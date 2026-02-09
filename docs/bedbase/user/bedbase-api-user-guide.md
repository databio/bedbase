# BEDbase API user guide

### Introduction

#### Data types

BEDbase stores two types of data, which we call *records*. They are 1. BEDs, and 2. BEDsets. 
BEDsets are simply collections of BEDs. Each record in the database is either a BED or a BEDset.

#### Endpoint organization

The endpoints are divided into 3 groups:

---

## Common Tasks

Quick examples for the most frequent operations. For more examples, see the [API Cookbook](api-cookbook.md).

### Search for BED files

```bash
curl -s "https://api.bedbase.org/v1/bed/search/text?query=CTCF+ChIP-seq&genome=hg38&limit=5"
```

This returns ranked results with similarity scores. See also: [BEDbase Search](bedbase-search.md) for details on search types.

### Get BED file metadata and statistics

```bash
# Basic metadata
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata"

# Full metadata including stats, files, and plots
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata?full=true"

# Statistics only
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata/stats"
```

### Download a BED file

Construct the object ID as `bed.<record_id>.bed_file`, then request the HTTP access URL:

```bash
curl -s "https://api.bedbase.org/v1/objects/bed.dcc005e8761ad5599545cc538f6a2a4d.bed_file/access/http"
```

Or download directly via the files endpoint:

```bash
curl -LO "https://api.bedbase.org/v1/files/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz"
```

### Find similar BED files

```bash
curl -s "https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/neighbours?limit=5"
```

---

## API Reference Summary

### Endpoint groups

| Group | Prefix | Purpose | Key endpoints |
|-------|--------|---------|---------------|
| **BED** | `/v1/bed` | BED file metadata and search | `search/text`, `list`, `{id}/metadata`, `{id}/neighbours` |
| **BEDset** | `/v1/bedset` | BEDset metadata | `list`, `{id}/metadata`, `{id}/bedfiles` |
| **Objects** | `/v1/objects` | File downloads (GA4GH DRS) | `{object_id}/access/http` |
| **Base** | `/v1` | Platform info | `stats`, `genomes`, `service-info` |

### Search endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/v1/bed/search/text` | GET | Semantic + keyword text search |
| `/v1/bed/search/exact` | GET | Exact metadata field matching |
| `/v1/bed/search/bed` | POST | BED-to-BED similarity (upload a file) |

### Pagination

All list and search endpoints support `limit` and `offset` query parameters:

- **`limit`**: Maximum results per page (default varies by endpoint, max 10000)
- **`offset`**: Number of results to skip (default 0)

Example: to get the second page of 50 results:

```
/v1/bed/list?limit=50&offset=50
```

### Filtering

| Parameter | Applies to | Description |
|-----------|-----------|-------------|
| `genome` | `list`, `search/text`, `search/exact` | Filter by reference genome (e.g., `hg38`, `mm10`) |
| `assay` | `search/text`, `search/exact` | Filter by assay type (e.g., `TF ChIP-seq`) |
| `bed_compliance` | `list` | Filter by BED format (e.g., `bed6+4`) |

---

## Response Format

### List responses

All list endpoints return a standard paginated format:

```json
{
  "count": 55941,
  "limit": 10,
  "offset": 0,
  "results": [ ... ]
}
```

- `count`: Total number of matching records (not just this page)
- `results`: Array of records for the current page

### Search responses

Search results include a `score` field indicating relevance:

```json
{
  "results": [
    {
      "id": "dcc005e8761ad5599545cc538f6a2a4d",
      "payload": { "name": "...", "description": "..." },
      "score": 0.5,
      "metadata": { ... }
    }
  ]
}
```

### Metadata responses

Full metadata responses (with `?full=true`) include nested objects:

- `annotation`: Species, cell line, assay, target, sample IDs
- `stats`: Region count, GC content, region width, genomic partition frequencies
- `files`: Available files with download URLs (BED, BigBed)
- `plots`: Analysis plots with download URLs

---

## Troubleshooting

| Status | Meaning | What to check |
|--------|---------|---------------|
| 404 | Not found | Verify the BED ID is a valid 32-character hex digest |
| 413 | Payload too large | BED upload for similarity search is limited to 20 MB |
| 415 | Unsupported media type | The uploaded file is not a valid BED file |
| 500 | Server error | Try again later; report persistent issues at [GitHub](https://github.com/databio/bedbase/issues) |

**Tips:**

- Use the interactive API docs at [api.bedbase.org/v1/docs](https://api.bedbase.org/v1/docs) to explore and test endpoints
- BED record IDs are 32-character hex strings, e.g., `dcc005e8761ad5599545cc538f6a2a4d`
- Object IDs always follow the format `<type>.<id>.<file_kind>` (e.g., `bed.dcc005e8761ad5599545cc538f6a2a4d.bed_file`)

1. **`/bed`** endpoints are used to interact with metadata for BED records.
2. **`/bedset`** endpoints are used to interact with metadata for BEDset records.
3. **`/objects`** endpoints are used to download metadata and get URLs to retrieve the underlying data itself. These endpoints implement the [GA4GH DRS standard](https://ga4gh.github.io/data-repository-service-schemas/).

Therefore, to get information and statistics about BED or BEDset records, or what is contained in the database, look through the `/bed` and `/bedset` endpoints. But if you need to write a tool that gets the actual underlying files, then you'll need to use the `/objects` endpoints. The type of identifiers used in each case differ.

### Record identifiers vs. object identifiers

Each record has an identifier. For example, `eaf9ee97241f300f1c7e76e1f945141f` is a BED identifier. You can use this identifier for the metadata endpoints. To download files, you'll need something slightly different -- you need an *object identifier*. This is because each BED record includes multiple files, such as the original BED file, the BigBed file, analysis plots, and so on. To download a file, you will construct what we call the `object_id`, which identifies the specific file.

### How to construct object identifiers

Object IDs take the form `<record_type>.<record_identifier>.<result_id>`. An example of an object_id for a BED file is `bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile`

So, you can get information about this object like this:

`GET` [/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile](https://api.bedbase.org/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile)

Or, you can get a URL to download the actual file with:

`GET` [/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile/access/http](https://api.bedbase.org/objects/bed.eaf9ee97241f300f1c7e76e1f945141f.bedfile/access/http)


---

## See Also

- [API Cookbook](api-cookbook.md) -- copy-paste curl examples for every common task
- [BBClient Python Workflow](../../geniml/tutorials/bbclient-workflow.md) -- end-to-end Python tutorial
- [BEDbase Search](bedbase-search.md) -- search concepts and UI guide
- [BBClient](bbclient.md) -- Python/CLI/Rust client for downloading and caching BED files
