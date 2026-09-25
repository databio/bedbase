# Bulk metadata exports

BEDbase publishes a monthly snapshot of the metadata corpus as
[Apache Parquet](https://parquet.apache.org/) files on S3. This is the supported
way to get the whole corpus in bulk — you do not need to page through the API.

## Where the exports live

Artifacts are published under the `exports/` prefix of the public storage bucket,
served over HTTPS at `https://data2.bedbase.org/`:

```
https://data2.bedbase.org/exports/bedbase_metadata_2026_08_03.parquet
https://data2.bedbase.org/exports/bedbase_bedsets_2026_08_03.parquet
https://data2.bedbase.org/exports/bedbase_bedset_membership_2026_08_03.parquet
https://data2.bedbase.org/exports/manifest_2026_08_03.json
```

Each run publishes:

| File | Contents |
|---|---|
| `bedbase_metadata_<date>.parquet` | One row per BED record: the `bed` table left-joined with `bed_metadata`. Denormalized descriptive metadata (genome, assay, cell type, tissue, target, sample/experiment ids, …). Per-file statistics are not included in this export. |
| `bedbase_bedsets_<date>.parquet` | One row per bedset. |
| `bedbase_bedset_membership_<date>.parquet` | The bedfile ↔ bedset relation (`bedset_id`, `bedfile_id`). |
| `manifest_<date>.json` | Verifiable build metadata (see below). |

## Filenames are dated and immutable

Every filename carries its build date (`YYYY_MM_DD`). A published file is never
overwritten, and there is **no** `latest` alias. Do not construct or hardcode a
filename. Instead, discover the current snapshot through the index endpoint:

```
GET https://api.bedbase.org/v1/bed/exports
```

It returns the index newest-first, with `file_path` already rewritten to an
absolute `https://data2.bedbase.org/` URL:

```json
{
  "count": 4,
  "results": [
    {
      "file_path": "https://data2.bedbase.org/exports/bedbase_metadata_2026_08_03.parquet",
      "file_type": "metadata",
      "creation_date": "2026-08-03T00:00:00+00:00",
      "record_count": 663150,
      "file_size": 47208172,
      "checksum": "…sha256…",
      "schema_version": 1
    }
  ]
}
```

The newest row is first; take the first `metadata` entry to find the current
snapshot.

## Retention

Snapshots are published monthly. Monthly snapshots are retained for the trailing
12 months; older snapshots are thinned to quarterly (the 1st of January, April,
July, and October), which are kept permanently. For a durable, citable reference,
prefer a quarterly snapshot.

## The manifest

`manifest_<date>.json` makes a snapshot verifiable:

```json
{
  "schema_version": 1,
  "build_started": "2026-08-03T00:00:01+00:00",
  "build_ended": "2026-08-03T00:00:22+00:00",
  "source_database": "bedbase",
  "files": [
    {"name": "bedbase_metadata_2026_08_03.parquet",
     "file_type": "metadata", "rows": 663150,
     "bytes": 47208172, "sha256": "…"}
  ]
}
```

`rows` is the number of rows actually written to each file (not a separately
queried count), and each `sha256` matches its file on disk, so you can verify a
download end-to-end.

## Querying with DuckDB

Parquet plus open CORS and HTTP range requests means you can query a snapshot
directly over HTTPS — no download, no server — from the [DuckDB](https://duckdb.org/)
CLI or DuckDB-WASM in a browser.

**Try it today with DuckDB — no download or pagination needed:**

```sql
SELECT *
FROM read_parquet('https://data2.bedbase.org/exports/bedbase_metadata_2026_08_03.parquet')
WHERE assay = 'ChIP-seq' AND genome_alias = 'hg38';
```

DuckDB reads only the byte ranges it needs, so a filtered query does not transfer
the whole file.

## How it is produced

A monthly [databio/bedbase-loader](https://github.com/databio/bedbase-loader)
GitHub Action (`export_metadata.yml`) streams the tables straight from PostgreSQL
as unordered sequential scans through server-side cursors (joining `bed_metadata`
on the runner), writes zstd-compressed Parquet, verifies row counts against a
pre-scan `count(*)`, and refuses to publish a partial artifact. The read runs in a
single `REPEATABLE READ` transaction, so each snapshot is internally consistent.
