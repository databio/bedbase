# gtars Modules

gtars is organized as a workspace of independent Rust crates, each providing specific functionality for genomic interval analysis. All modules share common dependencies and infrastructure through `gtars-core`.

## Core Infrastructure

- **[gtars-core](core.md)** - Fundamental data structures and utilities
- **[gtars-io](io.md)** - I/O operations and file format parsers

## Genomic Analysis

- **[gtars-overlaprs](overlaprs.md)** - High-performance interval overlap operations
- **[gtars-uniwig](uniwig.md)** - Coverage computation from BED/BAM files
- **[gtars-igd](igd.md)** - Fast genomic interval search
- **[gtars-scoring](scoring.md)** - Fragment overlap scoring
- **[gtars-fragsplit](fragsplit.md)** - Fragment file splitting for pseudobulk

## Machine Learning

- **[gtars-tokenizers](tokenizers.md)** - Genomic region tokenizers for ML

## Data Access

- **[gtars-refget](refget.md)** - GA4GH refget protocol implementation
- **[gtars-bbcache](bbcache.md)** - BED file caching for bedbase.org

## Language Bindings

- **[gtars-python](python.md)** - Python API bindings
- **[gtars-wasm](wasm.md)** - WebAssembly bindings
- **[gtars-cli](cli.md)** - Command-line interface