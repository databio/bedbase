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

# load tokenizer from a BED file (creates vocabulary from regions)
tokenizer = Tokenizer.from_bed("path/to/bedfile.bed")

# load from configuration file
tokenizer = Tokenizer.from_config("tokenizer_config.toml")

# load pretrained tokenizer
tokenizer = Tokenizer.from_pretrained("path/to/model")

# tokenize regions
tokens = tokenizer.tokenize(["chr1:1000-2000", "chr2:3000-4000"])
```

## Rust Usage

```rust
use gtars_tokenizers::Tokenizer;

// load tokenizer
let tokenizer = Tokenizer::from_bed("regions.bed")?;

// tokenize regions
let tokens = tokenizer.tokenize(&regions)?;
```

## Integration with HuggingFace Transformers
The tokenizers were designed to be as compatible as possible with HuggingFace Transformers. You can easily integrate them into your ML pipelines.

```python
from gtars.tokenizers import Tokenizer

tokenizer = Tokenizer.from_pretrained("databio/atacformer-base-hg38")

vocab_size = tokenizer.vocab_size
special_tokens_map = tokenizer.special_tokens_map
```