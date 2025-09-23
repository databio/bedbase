# gtars-igd

Implementation of IGD (Integrated Genome Database) - a high-performance genomic interval search tool.

## Features

- Fast interval queries (logarithmic time complexity)
- Memory-efficient indexing
- Binary format for persistence
- Support for multiple genomes

## Usage

### Building an Index
```rust
use gtars_igd::IGDBuilder;

let mut builder = IGDBuilder::new();
builder.add_intervals_from_bed("regions.bed")?;
builder.save_to_file("index.igd")?;
```

### Querying
```rust
use gtars_igd::IGD;

let igd = IGD::load_from_file("index.igd")?;
let overlaps = igd.query("chr1", 1000, 2000)?;
```

## Performance

- Index creation: O(n log n)
- Query time: O(log n + k) where k is number of results
- Memory usage: ~30% of input file size

## File Format

IGD uses a binary format optimized for:

- Fast loading
- Compact storage
- Memory-mapped access