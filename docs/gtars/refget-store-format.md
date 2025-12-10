# RefgetStore File Format

The RefgetStore is a directory-based file format for storing reference genome sequences with content-addressable access via GA4GH refget digests. It provides efficient storage, deduplication, and retrieval of sequences across multiple genome assemblies.

## Overview

A RefgetStore is a self-contained directory that stores sequence data in individual files (one per sequence), sequence metadata (names, lengths, digests, alphabets), collection metadata (grouping sequences by genome assembly), and index files for efficient lookup.

## Directory Structure

```
refget-store/
├── index.json                    # Store metadata and configuration
├── sequences.farg                # Index of all sequences
├── sequences/                    # Sequence data files
│   ├── Ab/                       # Subdirectories by digest prefix
│   │   ├── AbCdEf123....seq     # Individual sequence file
│   │   └── AbXyZ789....seq
│   └── Xy/
│       └── XyZabc456....seq
└── collections/                  # Collection metadata
    ├── collection1.farg
    └── collection2.farg
```

## File Specifications

### index.json

The root metadata file containing store configuration.

**Location:** `<store-root>/index.json`

**Format:** JSON

**Schema:**
```json
{
  "version": 1,
  "seqdata_path_template": "sequences/%s2/%s.seq",
  "collections_path_template": "collections/%s.farg",
  "sequence_index": "sequences.farg",
  "mode": "Encoded",
  "created_at": "2025-01-15T10:30:00Z"
}
```

**Fields:**

- `version` (integer): Format version number (currently `1`)
- `seqdata_path_template` (string): Template for sequence file paths
  - `%s` = full digest string
  - `%s2` = first 2 characters of digest
  - `%s4` = first 4 characters of digest
  - Example: `"sequences/%s2/%s.seq"` → `"sequences/Ab/AbCdEf123....seq"`
- `collections_path_template` (string): Template for collection file paths
  - Example: `"collections/%s.farg"`
- `sequence_index` (string): Path to the sequence metadata index file
  - Default: `"sequences.farg"`
- `mode` (string): Storage mode for sequence data
  - `"Raw"`: Uncompressed sequence data
  - `"Encoded"`: Bit-packed encoded sequences (space efficient)
- `created_at` (string): ISO 8601 timestamp of store creation

### sequences.farg

Master index of all sequences in the store.

**Location:** `<store-root>/sequences.farg`

**Format:** Tab-separated values (TSV)

**Schema:**
```
#name    length    alphabet    sha512t24u                md5
chr1     248956422  dna2bit    AbCdEf123GhIjK...         a1b2c3d4e5f6...
chr2     242193529  dna2bit    XyZabc456DefGh...         f7e8d9c0b1a2...
chrM     16569      dna2bit    MnOpQr789StUv...          1a2b3c4d5e6f...
```

The header line starts with `#` and defines column names.

**Data Columns:**

1. **name** (string): Sequence name (e.g., chromosome name)
2. **length** (integer): Sequence length in base pairs
3. **alphabet** (string): Alphabet type
   - `dna2bit`: 2-bit DNA encoding (ACGT only)
   - `dna3bit`: 3-bit DNA encoding (includes N)
   - `dnaio`: Full IUPAC DNA alphabet
   - `protein`: Protein sequences
   - `ASCII`: Generic ASCII sequences
4. **sha512t24u** (string): GA4GH SHA-512/24u digest (base64url, 32 chars)
   - Content-addressable identifier
   - Used as primary key for sequence lookup
5. **md5** (string): MD5 digest (hex, 32 chars)
   - Legacy support for backwards compatibility

Each sequence occupies one line, with lines starting with `#` serving as comments or headers. Fields are tab-separated and no quoting is required since sequence names cannot contain tabs.

### Sequence Files (.seq)

Individual sequence data files, one per sequence.

**Location:** Determined by `seqdata_path_template` in `index.json`

**Naming:** Based on SHA-512/24u digest

**Format:** Binary

**Content depends on storage mode:** Raw mode stores plain sequence data as bytes (DNA as ASCII characters like A, C, G, T, N; protein as A, R, N, D, C, etc.) that is directly readable as text, while encoded mode uses bit-packed sequence data (DNA 2-bit packs 4 nucleotides per byte for ACGT; DNA 3-bit stores ~2.67 nucleotides per byte including N) that is more space-efficient but requires decoding to read. For example, human chr1 (248 Mbp) takes ~248 MB in raw mode but only ~62 MB in encoded 2-bit mode (4× compression).

### Collection Files (.farg)

Metadata files grouping sequences into collections (e.g., genome assemblies).

**Location:** `<store-root>/collections/<collection-digest>.farg`

**Format:** Tab-separated values (TSV) with header sections

**Structure:**
```
##seqcol_digest=uC_UorBNf3YUu1YIDainBhI94CedlNeH
##names_digest=zxcvbnmasdfghjkl
##sequences_digest=qwertyuiopasdfgh
##lengths_digest=poiuytrewqlkjhgf
#name	length	alphabet	sha512t24u	md5
chr1	248956422	dna2bit	AbCdEf123GhIjK...	a1b2c3d4e5f6...
chr2	242193529	dna2bit	XyZabc456DefGh...	f7e8d9c0b1a2...
```

The header section uses `##` (double hash) for collection-level metadata headers, including the sequence collection digest (`##seqcol_digest`), and digests for the names, sequences, and lengths arrays. The data section header uses `#` (single hash) and is tab-separated.

**Data Section:**
Same format as `sequences.farg`, but only sequences in this collection.

## Storage Modes

RefgetStore supports two storage modes: **Raw mode** stores sequences as plain text (for DNA/protein), making them simple to debug and inspect with no decoding overhead, but results in larger file sizes without compression—use this when storage space is not a concern, you need human-readable sequences, or during debugging and development. **Encoded mode** provides 2-4× smaller file sizes through efficient bit-packing and faster I/O, though it requires decoding and is slightly more complex—use this for production deployments and storing large genomes where storage space matters.

## Path Templates

Templates use placeholders to organize files hierarchically:

### Sequence Path Templates

**Pattern:** `sequences/%s2/%s.seq`

Placeholders include `%s` (full 32-character digest), `%s2` (first 2 characters), and `%s4` (first 4 characters).

**Example:**
```
Digest: AbCdEf123GhIjKlMnOpQrStUvWxYzAb
Template: sequences/%s2/%s.seq
Result: sequences/Ab/AbCdEf123GhIjKlMnOpQrStUvWxYzAb.seq
```

Using digest prefixes prevents directories with millions of files, provides better filesystem performance, and cleaner organization. Common patterns include `sequences/%s2/%s.seq` (2-char prefix, 256 subdirectories), `sequences/%s4/%s.seq` (4-char prefix, 65,536 subdirectories), and `sequences/%s.seq` (flat structure, not recommended for large stores).

## Content-Addressable Storage

RefgetStore uses **content-addressable storage**: sequences are identified by their digest (hash of content), not by name.

### Benefits

Content-addressable storage enables **deduplication** by storing identical sequences only once, even when they appear in different assemblies (like chrM shared between GRCh38 and GRCh37). The digest-based approach ensures **integrity** by verifying that content hasn't been corrupted, providing tamper-evident storage. Finally, it creates **universal identifiers** where the same sequence has the same digest everywhere, enabling distributed, federated stores that are portable across systems.

### Example

```
GRCh38 chr1: sha512t24u = AbCdEf123...
GRCh37 chr1: sha512t24u = XyZabc456...  (different sequence)
GRCh38 chrM: sha512t24u = MnOpQr789...
GRCh37 chrM:   sha512t24u = MnOpQr789...  (same sequence as GRCh38!)
```

Only 3 sequence files needed, even though we have 4 sequence references.

## GA4GH Compliance

RefgetStore implements the [GA4GH refget specification](https://samtools.github.io/hts-specs/refget.html), using SHA-512/24u digests (truncated SHA-512, base64url encoded) and supporting both Level 1 and Level 2 sequence collection digests.

## Usage Patterns

### Creating a Store

```rust
use gtars_refget::store::{GlobalRefgetStore, StorageMode};

// Create new store
let mut store = GlobalRefgetStore::new(StorageMode::Encoded);

// Import FASTA file
store.add_sequence_collection_from_fasta("genome.fa")?;

// Write to directory
store.write_store_to_dir(
    "/path/to/store",
    "sequences/%s2/%s.seq"
)?;
```

### Loading a Store

```rust
// Load from local directory (with lazy loading)
let mut store = GlobalRefgetStore::load_local("/path/to/cache")?;

// Load from remote URL with custom cache location
let mut store = GlobalRefgetStore::load_remote(
    "/path/to/cache",                    // Local cache directory
    "https://example.com/refget-store"   // Remote URL
)?;
```

### Querying Sequences

```rust
// Get sequence by digest
let seq = store.get_sequence_by_id("AbCdEf123GhIjK...")?;

// Get sequence by name in a collection
let seq = store.get_sequence_by_collection_and_name(
    "uC_UorBNf3YUu1YIDainBhI94CedlNeH",  // collection digest
    "chr1"
)?;

// Get substring (0-based, half-open interval)
let substring = store.get_substring(
    "AbCdEf123GhIjK...",
    1000,    // start
    2000     // end (exclusive)
)?;
```

### Extracting Sequences from BED file

```rust
// Extract sequences for regions in BED file
store.export_fasta_from_regions(
    "collection_digest",
    "regions.bed",
    "output.fa"
)?;

// Or get as iterator (more memory efficient)
let sequences = store.substrings_from_regions(
    "collection_digest",
    "regions.bed"
)?;

// Collect into vector if needed
let sequences_vec: Vec<_> = sequences.collect();
```

## Distribution

### Local Distribution
Package the entire directory and distribute:
```bash
tar -czf refget-store.tar.gz /path/to/refget-store/
```

### Remote Distribution
Host on any static file server or object storage:
```bash
# S3
aws s3 sync /path/to/refget-store/ s3://bucket/refget-store/

# HTTP server
python -m http.server -d /path/to/refget-store/

# Users access via URL with explicit cache location
store = GlobalRefgetStore::load_remote(
    "/local/cache/path",                              // User-specified cache
    "https://mybucket.s3.amazonaws.com/refget-store"  // Remote URL
)?;
```

Remote access provides lazy loading (only downloading sequences when requested), user-controlled caching (you specify where cached data is stored), bandwidth efficiency (only transferring needed data), and selective downloads (skipping sequences you don't need).

## Cache Directory

When loading remote stores with `load_remote()`, you **explicitly specify** the cache location:

```rust
// Example: Cache in a specific directory
let cache_dir = "/data/genomes/cache/hg38";
let store = GlobalRefgetStore::load_remote(
    cache_dir,
    "https://example.com/hg38-store"
)?;
```

The cache directory has the same structure as the remote store, with `index.json` and `sequences.farg` downloaded on load, while sequence files in `sequences/` and collection files are downloaded on-demand only when accessed.

**Important**: The cache location is **user-controlled**, not automatic, giving you control over disk usage location, the ability to share caches between processes, explicit cleanup (just delete the directory), and no hidden ~/.cache directories.

## Design Rationale

### Why separate files per sequence?

Separate files per sequence enable selective memory mapping (mmap only the sequences you need, not an entire archive), automatic deduplication (identical sequences naturally share the same digest-named file), and simplified remote access (download only the specific sequence files you need with standard HTTP range requests). The key advantage over indexed single files is granular resource management—you can load, cache, and mmap individual sequences independently, which is particularly beneficial for distributed storage systems, content delivery networks, and partial synchronization where you don't want to handle a monolithic file.

### Why use digest prefixes in paths?

Digest prefixes avoid filesystem limits (directories with millions of files), improve directory lookup performance, and make it easier to shard across multiple servers or buckets.

### Why support both Raw and Encoded?

Supporting both modes provides flexibility to trade space for simplicity, with raw mode easier to debug during development and encoded mode providing efficiency for production.

### Why include MD5?

MD5 support provides compatibility with legacy systems, easier migration from MD5-based systems, and cross-referencing between old and new identifiers.

## See Also

- [GA4GH refget specification](https://samtools.github.io/hts-specs/refget.html)
- [gtars-refget module documentation](refget.md)
- [Python reference guide with examples](python/refget-store.md)
- [Python bindings documentation](python.md)
