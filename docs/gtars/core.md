# gtars-core

Core library providing fundamental data structures and utilities for genomic interval operations. This is the foundation that all other gtars modules build upon.

## Features

- Common genomic data structures (Region, RegionSet)
- BED file parsing utilities
- Shared constants and helper functions
- Foundation for all gtars modules

## Core Data Types

### Region
Represents a genomic interval with chromosome, start, and end coordinates:
```rust
use gtars_core::models::Region;

// Create a region
let region = Region::new("chr1", 1000, 2000);

// Access properties
println!("Chr: {}", region.chr);
println!("Start: {}", region.start);
println!("End: {}", region.end);
```

### RegionSet
Collection of genomic regions:
```rust
use gtars_core::models::RegionSet;
use std::path::Path;

// Load from BED file
let rs = RegionSet::try_from(Path::new("peaks.bed"))?;

// Access regions
println!("Number of regions: {}", rs.regions.len());

// Iterate over regions
for region in &rs.regions {
    println!("{}: {}-{}", region.chr, region.start, region.end);
}
```

## Available Modules

- `models` - Core data structures (Region, RegionSet)
- `utils` - Utility functions for file handling and parsing
- `consts` - Shared constants

## Dependencies

Minimal external dependencies:

- `anyhow` - Error handling
- `flate2` - Gzip compression support
- Other standard bioinformatics libraries

This module serves as the foundation for all other gtars modules and maintains backward compatibility within major versions.