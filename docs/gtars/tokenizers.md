# gtars-tokenizers

The gtars package contains genomic tokenizers module. 
These are used to convert genomic interval data from disparate sources into a consistent universe or consensus set. 
Primarily, the tokenizers are used to standardize input into our machine learning models.

<p align="center">
  <img align="center" src="../img/tokenization.svg" width="600" />
</p>

A minimal tokenizer requires a bedfile. 
Once instantiated, this tokenizer can be used to tokenize new genomic interval data into the model's vocabulary.

## Features

- Multiple tokenization strategies configurable via TOML
- HuggingFace integration support
- Configurable tokenization schemes
- Optimized for ML pipelines

## Usage
=== "Python"
    ```python
    from gtars.tokenizers import Tokenizer
    
    # load tokenizer from a BED file (creates vocabulary from regions)
    tokenizer = Tokenizer.from_bed("path/to/bedfile.bed")
    
    # load from configuration file
    tokenizer = Tokenizer.from_config("tokenizer_config.toml")
    
    # load pretrained tokenizer
    tokenizer = Tokenizer.from_pretrained("path/to/model")
    
    # tokenize regions from a list of region strings
    tokens = tokenizer.tokenize(["chr1:1000-2000", "chr2:3000-4000"])

    # tokenize regions from a RegionSet
    from gtars.models import RegionSet
    regions = RegionSet("path/to/bedfile.bed")
    tokens = tokenizer.tokenize(regions)

     # or dirdectly from a BED file
    tokens = tokenizer.tokenize_from_bed("path/to/bedfile.bed")
    ```

=== "Rust"
    ```rust
    use gtars_tokenizers::Tokenizer;
    
    // load tokenizer
    let tokenizer = Tokenizer::from_bed("regions.bed")?;
    
    // tokenize regions
    let tokens = tokenizer.tokenize(&regions)?;
    ```

## Integration with HuggingFace Transformers
The tokenizers were designed to be as compatible as possible with HuggingFace Transformers. You can easily integrate them into your ML pipelines.

=== "Python"
    ```python
    from gtars.tokenizers import Tokenizer
    
    tokenizer = Tokenizer.from_pretrained("databio/atacformer-base-hg38")
    
    vocab_size = tokenizer.vocab_size
    special_tokens_map = tokenizer.special_tokens_map
    ```