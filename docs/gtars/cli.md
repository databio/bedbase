# gtars-cli

Command-line interface for gtars tools.

## Installation

```bash
# From source
cd /path/to/gtars
cargo install --path gtars-cli

# Or download pre-built binary from releases page
```

## Available Commands

The CLI provides the following subcommands (availability depends on features enabled during compilation):

### igd
Build and query IGD (Integrated Genome Database) indexes:
```bash
gtars igd create --input regions.bed --output index.igd
gtars igd query --database index.igd --query chr1:1000-2000
```

### overlaprs
Compute overlaps between genomic intervals:
```bash
gtars overlaprs --input1 regions1.bed --input2 regions2.bed
```

### uniwig
Generate coverage tracks from BED/BAM files:
```bash
gtars uniwig --input reads.bam --output coverage.bw
```

### bbcache
Cache and manage BED files from bedbase.org:
```bash
gtars bbcache get --id GSM123456
gtars bbcache list
```

### scoring
Score fragment overlaps against a reference:
```bash
gtars scoring --fragments frags.tsv.gz --universe peaks.bed --output scores.txt
```

### fragsplit
Split fragment files by cell barcodes or clusters:
```bash
gtars fragsplit --fragments frags.tsv.gz --barcodes clusters.csv --output-dir splits/
```


## Global Options

```bash
gtars --help              # Show help
gtars --version           # Show version
gtars <command> --help    # Show command-specific help
```

## Building with Specific Features

To build the CLI with specific tools:
```bash
cargo build --release --features "uniwig,overlaprs,igd"
```