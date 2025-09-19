# Scoring Module

Fragment scoring functionality for genomic analysis (ATAC-seq and ChIP-seq data).

## What it does

Counts overlaps between fragment files and consensus peak regions, producing a count matrix where:

- Rows = fragment files
- Columns = consensus regions
- Values = overlap counts

## CLI Usage

```bash
gtars fscoring <fragments> <consensus> /
  --mode <atac|chip> /
  --output <output.csv.gz>
```

**Arguments:**

- `fragments`: Glob pattern for fragment files (e.g., `"*.bed.gz"`)
- `consensus`: Path to consensus peak set (BED file)
- `--mode`: Scoring mode (`atac` or `chip`, default: `atac`)
  - `atac`: Counts 5' and 3' cut sites with shifts (+4/-5 bp)
  - `chip`: Counts full fragment overlaps
- `--output`: Output file path (default: `count_matrix.csv.gz`)

**Example:**
```bash
gtars fscoring "fragments/*.bed.gz" peaks.bed /
  --mode atac /
  --output counts.csv.gz
```

## Rust Library Usage

```rust
use gtars::scoring::{
    region_scoring_from_fragments, 
    ConsensusSet, 
    FragmentFileGlob, 
    ScoringMode
};

// Set up inputs
let mut fragments = FragmentFileGlob::new("path/to/*.bed.gz")?;
let consensus = ConsensusSet::new("peaks.bed".into())?;

// Generate count matrix
let count_matrix = region_scoring_from_fragments(
    &mut fragments, 
    &consensus, 
    ScoringMode::Atac
)?;

// Write to file
count_matrix.write_to_file("output.csv.gz")?;

// Or access counts directly
let count = count_matrix.get(row, col);
```

## Output Format

Gzipped CSV file with:

- Each row = one fragment file
- Each column = one consensus region
- Values = count of overlapping fragments
