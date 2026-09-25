# BEDbase API user guide

BEDbase exposes a REST API that lets you query metadata, download files, and search BED records and BEDsets programmatically.

!!! info "Full API reference"
    The complete, interactive API reference is at **[api.bedbase.org/v1/docs](https://api.bedbase.org/v1/docs)**.
    This page is a brief introduction to help you get started.

---

## Base URL

```
https://api.bedbase.org/v1
```

All endpoints described below are relative to this base URL.

---

## Data types

BEDbase stores two types of records:

| Type | Description |
|------|-------------|
| **BED** | A single BED file with associated metadata, statistics, and analysis outputs |
| **BEDset** | A named collection of BED files |

---

## Endpoint groups

The API is organized into four groups:

| Group | Path prefix | Purpose |
|-------|-------------|---------|
| **BED** | `/v1/bed/` | Metadata, statistics, and analysis for individual BED records |
| **BEDset** | `/v1/bedset/` | Metadata and contents for BEDset records |
| **Search** | `/v1/bed/search/` | Text, exact, and similarity-based search |
| **Objects** | `/v1/objects/` | File download URLs (implements [GA4GH DRS](https://ga4gh.github.io/data-repository-service-schemas/)) |

---

## Record identifiers and object identifiers

Every BED and BEDset record has a **record identifier** — a hexadecimal digest, for example `dcc005e8761ad5599545cc538f6a2a4d`. Use this with the `/bed/` and `/bedset/` endpoints to retrieve metadata.

To download actual files you need an **object identifier**, which specifies both the record and the particular file associated with it. Object IDs follow this pattern:

```
<record_type>.<record_id>.<file_type>
```

For example, `bed.dcc005e8761ad5599545cc538f6a2a4d.bedfile` refers to the BED file for that record.

Common `<file_type>` values:

| File type | Description |
|-----------|-------------|
| `bedfile` | The BED file (gzipped) |
| `bigbed` | BigBed format |
| `bedfile_figure` | Summary statistics plots |

---

## Examples

### Get metadata for a BED record

```
GET /v1/bed/{bed_id}/metadata
```

```bash
curl https://api.bedbase.org/v1/bed/dcc005e8761ad5599545cc538f6a2a4d/metadata
```

Returns a JSON object with fields such as genome assembly, region count, file size, and tissue/assay annotations.

---

### Search BED files by text

```
GET /v1/bed/search/text?query={query}
```

```bash
curl "https://api.bedbase.org/v1/bed/search/text?query=CTCF+K562&limit=5"
```

Returns a ranked list of BED records whose metadata matches the query. Supports optional `genome` and `assay` filters.

---

### Download a BED file

First, get the download URL via the Objects endpoint:

```
GET /v1/objects/{object_id}/access/http
```

```bash
curl "https://api.bedbase.org/v1/objects/bed.dcc005e8761ad5599545cc538f6a2a4d.bedfile/access/http"
```

The response contains an `url` field. You can then download the file directly from that URL.

---

## See also

- [Full API reference (Swagger)](https://api.bedbase.org/v1/docs)
- [BBClient](bbclient.md) — Python/CLI/Rust client that handles downloads and caching for you
- [BEDbase search guide](bedbase-search.md)
