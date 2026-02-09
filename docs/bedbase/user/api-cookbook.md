# BEDbase API Cookbook

Practical, copy-paste examples for common tasks using the BEDbase REST API.

!!! info "Quick reference"
    - **Base URL**: `https://api.bedbase.org/v1`
    - **Interactive docs**: [https://api.bedbase.org/v1/docs](https://api.bedbase.org/v1/docs)
    - **No authentication required**
    - All responses are JSON unless noted otherwise

---

## Searching for BED Files

### Text search (semantic + keyword)

Find BED files using natural language. This uses semantic search to match meaning, not just keywords.

```bash
curl -s "https://api.bedbase.org/v1/bed/search/text?query=CTCF+ChIP-seq+human&limit=5"
```

Filter by genome and assay:

```bash
curl -s "https://api.bedbase.org/v1/bed/search/text?query=CTCF&genome=hg38&assay=TF+ChIP-seq&limit=5"
```

??? example "Example response"
    ```json
    {
      "count": 159342,
      "limit": 5,
      "offset": 0,
      "results": [
        {
          "id": "46edabf8c29b4fa836f21f51f3fa0ebc",
          "payload": {
            "name": "encode_3719",
            "description": "CTCF TF ChIP-seq experiment on HEK293",
            "cell_line": "HEK293",
            "target": "CTCF",
            "assay": "TF ChIP-seq",
            "genome_alias": "hg38",
            "species_name": "Homo sapiens"
          },
          "score": 0.5,
          "metadata": {
            "id": "46edabf8c29b4fa836f21f51f3fa0ebc",
            "genome_alias": "hg38",
            "bed_compliance": "bed6+4",
            "annotation": { "..." : "..." },
            "processed": true
          }
        }
      ]
    }
    ```

**Key fields:**

| Field | Description |
|-------|-------------|
| `results[].id` | BED record identifier (32-char hex digest) |
| `results[].payload` | Summary fields used for search ranking |
| `results[].score` | Similarity score (higher = better match) |
| `results[].metadata` | Full record metadata |
| `count` | Total records in database (not result count) |

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `query` | string | required | Search text |
| `genome` | string | optional | Filter by genome (e.g., `hg38`, `mm10`) |
| `assay` | string | optional | Filter by assay type |
| `limit` | int | 10 | Max results to return (up to 10000) |
| `offset` | int | 0 | Skip first N results |

### Exact metadata search

Search for exact matches in BED file metadata fields:

```bash
curl -s "https://api.bedbase.org/v1/bed/search/exact?query=USF2&genome=hg38&limit=5"
```

Use exact search when you know the precise term (e.g., a specific target, cell line, or experiment ID). Use text search when describing what you're looking for in natural language.

### BED-to-BED similarity search

Upload your own BED file to find similar files in BEDbase:

```bash
curl -s "https://api.bedbase.org/v1/bed/search/bed?limit=5" \
  -F "file=@my_regions.bed.gz"
```

!!! note
    - Maximum file size: 20 MB
    - File must be valid BED format (gzipped or plain)
    - Currently available for hg38 genome only

---

## Browsing the Database

### List BED files with pagination

```bash
# First page: 20 results
curl -s "https://api.bedbase.org/v1/bed/list?limit=20&offset=0"

# Next page
curl -s "https://api.bedbase.org/v1/bed/list?limit=20&offset=20"
```

Filter by genome:

```bash
curl -s "https://api.bedbase.org/v1/bed/list?limit=10&genome=hg38"
```

??? example "Example response"
    ```json
    {
      "count": 55941,
      "limit": 10,
      "offset": 0,
      "results": [
        {
          "id": "dcc005e8761ad5599545cc538f6a2a4d",
          "name": "encode_61",
          "genome_alias": "hg38",
          "bed_compliance": "bed6+4",
          "description": "USF2 TF ChIP-seq experiment on K562",
          "annotation": {
            "assay": "TF ChIP-seq",
            "cell_line": "K562",
            "target": "USF2",
            "species_name": "Homo sapiens"
          }
        }
      ]
    }
    ```

**Filtering parameters:**

| Parameter | Description | Example |
|-----------|-------------|---------|
| `genome` | Reference genome alias | `hg38`, `mm10`, `hg19` |
| `bed_compliance` | BED format | `bed6+4`, `bed3+0` |
| `limit` | Results per page (max 10000) | `100` |
| `offset` | Pagination offset | `0` |

### List BEDsets

```bash
curl -s "https://api.bedbase.org/v1/bedset/list?limit=5&query=encode"
```

??? example "Example response"
    ```json
    {
      "count": 135,
      "limit": 5,
      "offset": 0,
      "results": [
        {
          "id": "gse27111",
          "name": "gse27111",
          "description": "Data from GEO GSE27111 - genome-wide ChIP data...",
          "bed_ids": ["a0644ea91b9471dc44e3a2834940c676"],
          "author": "Kevin, P., White",
          "source": "gse27111"
        }
      ]
    }
    ```

### Platform statistics

```bash
# Summary counts
curl -s "https://api.bedbase.org/v1/stats"
```

```json
{"bedfiles_number": 159339, "bedsets_number": 20678, "genomes_number": 63}
```

```bash
# Available genomes
curl -s "https://api.bedbase.org/v1/genomes"
```

```json
{"count": 62, "limit": 100, "offset": 0, "results": ["hg38", "hg19", "mm10", "mm9", "..."]}
```

```bash
# Service info (versions, embedding models)
curl -s "https://api.bedbase.org/v1/service-info"
```

---

## Getting BED File Details

All metadata endpoints use the 32-character BED record identifier.

### Full metadata

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata"
```

Add `?full=true` to include stats, plots, files, and classification:

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata?full=true"
```

??? example "Example response (full=true, truncated)"
    ```json
    {
      "id": "dcc005e8761ad5599545cc538f6a2a4d",
      "name": "encode_61",
      "genome_alias": "hg38",
      "bed_compliance": "bed6+4",
      "description": "USF2 TF ChIP-seq experiment on K562...",
      "annotation": {
        "species_name": "Homo sapiens",
        "cell_line": "K562",
        "assay": "TF ChIP-seq",
        "target": "USF2",
        "global_sample_id": ["encode:ENCFF602YIK"]
      },
      "stats": {
        "number_of_regions": 3432.0,
        "gc_content": 0.56,
        "median_tss_dist": 9245.0,
        "mean_region_width": 246.3
      },
      "files": {
        "bed_file": { "path": "...", "size": 64638, "object_id": "bed.dcc005e8761ad5599545cc538f6a2a4d.bed_file" },
        "bigbed_file": { "path": "...", "size": 105384, "object_id": "bed.dcc005e8761ad5599545cc538f6a2a4d.bigbed_file" }
      },
      "plots": {
        "chrombins": { "title": "Regions distribution over chromosomes", "object_id": "..." },
        "gccontent": { "title": "GC Content Distribution", "object_id": "..." },
        "partitions": { "title": "Regions distribution over genomic partitions", "object_id": "..." },
        "widths_histogram": { "title": "Quantile-trimmed histogram of widths", "object_id": "..." },
        "tss_distance": { "title": "Region-TSS distance distribution", "object_id": "..." }
      }
    }
    ```

### Statistics

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata/stats"
```

```json
{
  "number_of_regions": 3432.0,
  "gc_content": 0.56,
  "median_tss_dist": 9245.0,
  "mean_region_width": 246.3,
  "exon_frequency": 111.0,
  "exon_percentage": 0.0323,
  "intron_frequency": 925.0,
  "intron_percentage": 0.2695,
  "intergenic_percentage": 0.3214,
  "intergenic_frequency": 1103.0,
  "promotercore_frequency": 601.0,
  "promotercore_percentage": 0.1751,
  "fiveutr_frequency": 312.0,
  "fiveutr_percentage": 0.0909,
  "threeutr_frequency": 93.0,
  "threeutr_percentage": 0.0271,
  "promoterprox_frequency": 287.0,
  "promoterprox_percentage": 0.0836
}
```

### File references

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata/files"
```

??? example "Example response"
    ```json
    {
      "bed_file": {
        "name": "bed_file",
        "title": "BED file",
        "size": 64638,
        "object_id": "bed.dcc005e8761ad5599545cc538f6a2a4d.bed_file",
        "access_methods": [
          {
            "type": "http",
            "access_url": {
              "url": "https://api.bedbase.org/v1/files/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz"
            },
            "access_id": "http"
          },
          {
            "type": "s3",
            "access_url": {
              "url": "s3://data2.bedbase.org/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz"
            },
            "access_id": "s3"
          }
        ]
      },
      "bigbed_file": {
        "name": "bigbed_file",
        "title": "BigBed file",
        "size": 105384,
        "object_id": "bed.dcc005e8761ad5599545cc538f6a2a4d.bigbed_file"
      }
    }
    ```

### Classification

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata/classification"
```

---

## Finding Similar BED Files

Get nearest neighbours based on embedding similarity:

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/neighbours?limit=3"
```

??? example "Example response"
    ```json
    {
      "count": 159344,
      "limit": 3,
      "offset": 0,
      "results": [
        {
          "id": "6e4d348e77cd711c2b0d2c96d7bb4787",
          "payload": {
            "name": "encode_60",
            "description": "USF2 TF ChIP-seq experiment on K562...",
            "cell_line": "K562",
            "target": "USF2",
            "assay": "TF ChIP-seq",
            "genome_alias": "hg38"
          },
          "score": 0.99982566
        },
        {
          "id": "86b4fce5bf559925f7c88f3f8a83aa66",
          "payload": {
            "name": "wgEncodeAwgTfbsSydhK562Usf2IggrabUniPk",
            "description": "ChIP K562 USF2",
            "cell_line": "K562",
            "genome_alias": "hg38"
          },
          "score": 0.99845207
        },
        {
          "id": "7bae123cf5c366fe77b630949b392cbf",
          "payload": {
            "name": "TF ChIP-seq from K562 (ENCLB482JMW)",
            "description": "ChIP-Seq on K562",
            "cell_line": "K562",
            "genome_alias": "hg38"
          },
          "score": 0.95710635
        }
      ]
    }
    ```

The `score` field indicates similarity (1.0 = identical, lower = less similar).

---

## Downloading Files

### Understanding object IDs

BEDbase uses the [GA4GH DRS standard](https://ga4gh.github.io/data-repository-service-schemas/) for file access. Each downloadable file has an **object ID** constructed as:

```
<record_type>.<record_id>.<file_type>
```

For example:

| Object ID | What it is |
|-----------|------------|
| `bed.dcc005e8761ad5599545cc538f6a2a4d.bed_file` | The BED file |
| `bed.dcc005e8761ad5599545cc538f6a2a4d.bigbed_file` | The BigBed file |
| `bed.dcc005e8761ad5599545cc538f6a2a4d.chrombins` | Chromosome distribution plot |
| `bed.dcc005e8761ad5599545cc538f6a2a4d.gccontent` | GC content plot |

### Get download URL

```bash
curl -s "https://api.bedbase.org/v1/objects/bed.dcc005e8761ad5599545cc538f6a2a4d.bed_file/access/http"
```

This returns the direct HTTP URL you can use to download the file.

### Download a BED file (one-liner)

Download directly via the files endpoint:

```bash
curl -LO "https://api.bedbase.org/v1/files/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz"
```

Or use the metadata to find the URL first:

```bash
# Get the download URL from file metadata, then download
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata/files" | \
  jq -r '.bed_file.access_methods[] | select(.type=="http") | .access_url.url' | \
  xargs curl -LO
```

### Download from a BEDset

Get all BED file IDs in a BEDset, then download each:

```bash
# Step 1: Get BED IDs in the set
BED_IDS=$(curl -s "https://api.bedbase.org/v1/bedset/encode_batch_1/bedfiles" | \
  jq -r '.results[].id')

# Step 2: Download each BED file
for ID in $BED_IDS; do
  curl -LO "https://api.bedbase.org/v1/objects/bed.${ID}.bed_file/access/http/bytes"
done
```

---

## Working with BEDsets

### List BED files in a BEDset

```bash
curl -s "https://api.bedbase.org/v1/bedset/encode_batch_1/bedfiles"
```

### Get BEDset metadata

```bash
curl -s "https://api.bedbase.org/v1/bedset/encode_batch_1/metadata"
```

### Download BEDset as PEP

Download an entire BEDset as a [PEP](https://pep.databio.org/) project (ZIP archive):

```bash
curl -LO "https://api.bedbase.org/v1/bedset/encode_batch_1/pep"
```

---

## Pagination Pattern

All list and search endpoints support `limit` and `offset` parameters for pagination.

```bash
# Page through all hg38 BED files, 100 at a time
OFFSET=0
LIMIT=100

while true; do
  RESPONSE=$(curl -s "https://api.bedbase.org/v1/bed/list?limit=${LIMIT}&offset=${OFFSET}&genome=hg38")
  COUNT=$(echo "$RESPONSE" | jq '.results | length')

  # Process this page
  echo "$RESPONSE" | jq -r '.results[].id'

  # Stop if we got fewer results than the limit
  if [ "$COUNT" -lt "$LIMIT" ]; then
    break
  fi
  OFFSET=$((OFFSET + LIMIT))
done
```

---

## Error Handling

| Status Code | Meaning | Common Cause |
|-------------|---------|--------------|
| 400 | Bad request | Malformed query parameters |
| 404 | Not found | Invalid BED ID or object ID |
| 413 | Payload too large | BED file upload exceeds 20 MB |
| 415 | Unsupported media type | Uploaded file is not valid BED format |
| 500 | Server error | Internal issue; try again later |

Example error response:

```json
{"detail": "BED file with id: abc123 not found."}
```

!!! tip
    - BED IDs are 32-character hex digests (e.g., `dcc005e8761ad5599545cc538f6a2a4d`)
    - Use [jq](https://jqlang.github.io/jq/) for JSON processing in shell scripts
    - The interactive docs at [api.bedbase.org/v1/docs](https://api.bedbase.org/v1/docs) let you try endpoints in your browser

---

## See Also

- [BEDbase API User Guide](bedbase-api-user-guide.md) -- endpoint reference and concepts
- [BBClient](bbclient.md) -- Python/CLI client for downloading and caching BED files
- [BEDbase Search](bedbase-search.md) -- search concepts and UI guide
- [BBClient Python Workflow](../../geniml/tutorials/bbclient-workflow.md) -- end-to-end Python tutorial
