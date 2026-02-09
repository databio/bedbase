# BEDbase Python Workflow: Search, Download, and Analyze

This tutorial walks through a complete workflow: searching for BED files via the BEDbase API, downloading them with BBClient, and performing basic analysis in Python.

## Prerequisites

```bash
pip install geniml requests
```

## Step 1: Search for BED files

Use the BEDbase REST API to find BED files by keyword. Here we search for CTCF ChIP-seq experiments on hg38:

```python
import requests

response = requests.get(
    "https://api.bedbase.org/v1/bed/search/text",
    params={
        "query": "CTCF ChIP-seq human",
        "genome": "hg38",
        "limit": 5,
    },
)
response.raise_for_status()
search_results = response.json()

print(f"Showing {len(search_results['results'])} of {search_results['count']} total records\n")
for hit in search_results["results"]:
    p = hit["payload"]
    print(f"  {hit['id']}  score={hit['score']:.3f}")
    print(f"    {p.get('description', p.get('name', ''))}")
    print(f"    cell_line={p.get('cell_line', '')}  target={p.get('target', '')}\n")
```

Example output:

```
Showing 5 of 159342 total records

  46edabf8c29b4fa836f21f51f3fa0ebc  score=0.500
    CTCF TF ChIP-seq experiment on HEK293
    cell_line=HEK293  target=CTCF
  ...
```

## Step 2: Inspect a result

Get detailed metadata and statistics for a specific BED file:

```python
bed_id = search_results["results"][0]["id"]

# Get full metadata (stats, files, plots)
meta = requests.get(
    f"https://api.bedbase.org/v1/bed/{bed_id}/metadata",
    params={"full": True},
).json()

print(f"Name:        {meta['name']}")
print(f"Description: {meta['description']}")
print(f"Genome:      {meta['genome_alias']}")
print(f"Format:      {meta['bed_compliance']}")

if meta.get("stats"):
    stats = meta["stats"]
    print(f"\nStatistics:")
    print(f"  Regions:          {stats['number_of_regions']:.0f}")
    print(f"  Mean width:       {stats['mean_region_width']:.1f} bp")
    print(f"  GC content:       {stats['gc_content']:.2f}")
    print(f"  Median TSS dist:  {stats['median_tss_dist']:.0f} bp")

if meta.get("files"):
    print(f"\nAvailable files:")
    for name, info in meta["files"].items():
        print(f"  {name}: {info['size']} bytes")
```

## Step 3: Download and cache with BBClient

BBClient downloads BED files from BEDbase and caches them locally, so repeat access is instant:

```python
from geniml.bbclient import BBClient

bbclient = BBClient(cache_folder="./bedbase_cache")

# Download and cache a BED file -- returns a RegionSet object
bed_id = "dcc005e8761ad5599545cc538f6a2a4d"
region_set = bbclient.load_bed(bed_id)
print(f"Loaded {bed_id}: {type(region_set).__name__}")
```

Download multiple search results:

```python
region_sets = {}
for hit in search_results["results"][:3]:
    bed_id = hit["id"]
    rs = bbclient.load_bed(bed_id)
    region_sets[bed_id] = rs
    print(f"  Cached {hit['payload'].get('name', bed_id)}")

print(f"\nTotal cached BED files: {len(bbclient.list_beds())}")
```

## Step 4: Work with RegionSet objects

A `RegionSet` is the Python representation of a BED file, provided by the `gtars` package:

```python
from gtars.models import RegionSet

rs = bbclient.load_bed("dcc005e8761ad5599545cc538f6a2a4d")

# Sequence collection digest (unique identifier)
print(f"Identifier: {rs.identifier}")

# Convert to a pandas DataFrame
df = rs.to_pandas()
print(f"\nRegions: {len(df)}")
print(df.head())
#   chr     start       end
# 0 chr1    985751      986258
# 1 chr1    1312516     1312898
# ...

# Basic statistics
print(f"\nMean region width: {(df['end'] - df['start']).mean():.1f} bp")
print(f"Chromosomes: {df['chr'].nunique()}")
```

You can also create a RegionSet directly from a URL:

```python
rs = RegionSet("https://api.bedbase.org/v1/files/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz")
print(f"Regions: {len(rs.to_pandas())}")
```

## Step 5: Download a BEDset

A BEDset is a collection of BED files. Download an entire set with `load_bedset`:

```python
bedset = bbclient.load_bedset("encode_batch_1")
print(f"BEDset contains files that are now cached locally")
```

You can also query the BEDset API to see what's inside:

```python
bedset_meta = requests.get(
    "https://api.bedbase.org/v1/bedset/encode_batch_1/metadata"
).json()
print(f"BEDset: {bedset_meta['name']}")
print(f"Description: {bedset_meta['description']}")

# Get the list of BED files in the set
bedfiles = requests.get(
    "https://api.bedbase.org/v1/bedset/encode_batch_1/bedfiles"
).json()
print(f"Contains {len(bedfiles['results'])} BED files")
```

## Step 6: Find similar BED files

Use the neighbours endpoint to find BED files with similar genomic content:

```python
bed_id = "dcc005e8761ad5599545cc538f6a2a4d"
neighbours = requests.get(
    f"https://api.bedbase.org/v1/bed/{bed_id}/neighbours",
    params={"limit": 5},
).json()

print(f"Top 5 similar BED files to {bed_id}:\n")
for hit in neighbours["results"]:
    p = hit["payload"]
    print(f"  {hit['id']}  similarity={hit['score']:.4f}")
    print(f"    {p.get('description', p.get('name', ''))}")
    print(f"    cell_line={p.get('cell_line', '')}  assay={p.get('assay', '')}\n")
```

Download the top neighbour and compare:

```python
top_neighbour_id = neighbours["results"][0]["id"]
neighbour_rs = bbclient.load_bed(top_neighbour_id)

original_df = bbclient.load_bed(bed_id).to_pandas()
neighbour_df = neighbour_rs.to_pandas()

print(f"Original:  {len(original_df)} regions, mean width {(original_df['end'] - original_df['start']).mean():.0f} bp")
print(f"Neighbour: {len(neighbour_df)} regions, mean width {(neighbour_df['end'] - neighbour_df['start']).mean():.0f} bp")
```

## Complete Script

Here's the full workflow in a single script:

```python
"""BEDbase workflow: search, download, and analyze BED files."""
import requests
from geniml.bbclient import BBClient

# 1. Search
results = requests.get(
    "https://api.bedbase.org/v1/bed/search/text",
    params={"query": "CTCF ChIP-seq", "genome": "hg38", "limit": 5},
).json()
print(f"Found {len(results['results'])} results")

# 2. Download with BBClient
bbclient = BBClient(cache_folder="./bedbase_cache")
for hit in results["results"]:
    bed_id = hit["id"]
    rs = bbclient.load_bed(bed_id)
    df = rs.to_pandas()
    print(f"  {hit['payload'].get('name', bed_id)}: {len(df)} regions")

# 3. Get stats for the first result
bed_id = results["results"][0]["id"]
stats = requests.get(
    f"https://api.bedbase.org/v1/bed/{bed_id}/metadata/stats"
).json()
print(f"\nStats for {bed_id}:")
print(f"  Regions:     {stats['number_of_regions']:.0f}")
print(f"  Mean width:  {stats['mean_region_width']:.1f} bp")
print(f"  GC content:  {stats['gc_content']:.2f}")

# 4. Find similar files
neighbours = requests.get(
    f"https://api.bedbase.org/v1/bed/{bed_id}/neighbours",
    params={"limit": 3},
).json()
print(f"\nTop 3 similar files:")
for hit in neighbours["results"]:
    print(f"  {hit['payload'].get('name', hit['id'])}  score={hit['score']:.4f}")
```

## See Also

- [API Cookbook](../../bedbase/user/api-cookbook.md) -- curl examples for all common API tasks
- [BBClient Reference](../bbclient/bbclient.md) -- full Python, CLI, and Rust interface docs
- [RegionSet Documentation](../../gtars/models.md) -- working with RegionSet objects
