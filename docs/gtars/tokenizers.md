# gtars-tokenizers

Genomic region tokenizers for machine learning applications.

## Features

- Multiple tokenization strategies configurable via TOML
- HuggingFace integration support
- Configurable tokenization schemes
- Optimized for ML pipelines

## Python Usage

```python
from gtars.tokenizers import Tokenizer

# Load tokenizer from a BED file (creates vocabulary from regions)
tokenizer = Tokenizer.from_bed("path/to/bedfile.bed")

# Load from configuration file
tokenizer = Tokenizer.from_config("tokenizer_config.toml")

# Load pretrained tokenizer
tokenizer = Tokenizer.from_pretrained("path/to/model")

# Tokenize regions
tokens = tokenizer.tokenize(["chr1:1000-2000", "chr2:3000-4000"])
```

## Rust Usage

```rust
use gtars_tokenizers::Tokenizer;

// Load tokenizer
let tokenizer = Tokenizer::from_bed("regions.bed")?;

// Tokenize regions
let tokens = tokenizer.tokenize(&regions)?;
```

## Configuration

Tokenizers can be configured via TOML files:
```toml
[tokenizer]
resolution = 100
max_tokens = 10000
```

## Integration

- Compatible with HuggingFace Transformers
- Supports batch tokenization
- Provides vocabulary management