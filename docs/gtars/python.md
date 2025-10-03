# gtars-python

Python bindings for gtars functionality, providing native Python API for genomic interval analysis.

## Installation

```bash
pip install gtars
```

## Available Modules

### tokenizers
```python
from gtars.tokenizers import Tokenizer

# Create tokenizer from BED file
tokenizer = Tokenizer.from_bed("regions.bed")

# Or from configuration
tokenizer = Tokenizer.from_config("config.toml")

# Tokenize regions
tokens = tokenizer.tokenize(["chr1:1000-2000", "chr2:3000-4000"])
```

### models (RegionSet)
```python
from gtars.models import RegionSet

# Create from BED file
rs = RegionSet.from_bed("peaks.bed")

# Access properties
print(f"Number of regions: {len(rs)}")
print(f"Total coverage: {rs.coverage()}")

# Operations
rs.sort()
merged = rs.merge()
```

### refget
```python
from gtars.refget import RefgetStore, compute_digest

# Compute sequence digest
digest = compute_digest(b"ACGTACGT")

# Use RefgetStore for sequence management
store = RefgetStore()
```

## Performance

- Native Rust performance
- Zero-copy data transfer where possible
- NumPy array integration
- Parallel processing support
