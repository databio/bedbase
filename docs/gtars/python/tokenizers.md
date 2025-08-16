# Tokenizers
The `gtars` package contains our genomic tokenizers. These are used to convert genomic interval data from disparate sources into a consistent universe or consensus set. Primarily, the tokenizers are used to standardize input into our machine learning models.

<p align="center">
  <img align="center" src="../../img/tokenization.svg" width="600" />
</p>

A minimal tokenizer requires a bedfile. Once instantiated, this tokenizer can be used to tokenize new genomic interval data into the model's vocabulary.

## Quick start
You can quickly tokenize new bed files and iterate over the results.
```python
from gtars.tokenizers import Tokenizer

tokenizer = Tokenizer.from_bed("path/to/bedfile.bed")

tokens = tokenizer.tokenize("path/to/intervals.bed")
for token in tokens:
    print(token)
```

## Using a tokenizer from a pre-trained model
We can also download the universe (vocabulary) for a pre-trained model from huggingface and use that to instantiate our tokenizer.
```python
from gtars.tokenizers import Tokenizer

# identical API to huggingface
tokenizer = Tokenizer.from_pretrained("databio/atacformer-base-hg38")

tokens = tokenizer.tokenize("path/to/intervals.bed")
print(tokens)
# >>> ["chr1:100-200", "chr1:200-300", ...]
```

## Working with the tokenizer API
We designed the tokenizer API to be congruent with the [Hugging Face Tokenizers library](https://github.com/huggingface/tokenizers), making it easy to integrate with modern machine learning workflows tailored to genomic data.

### Getting input ids
It is common to represent genomic intervals as input ids for machine learning models, particularly for transformer-based architectures. These input ids are typically derived from the tokenized representation of the genomic intervals. You can obtain the input ids from the tokenizer as follows:
```python
from gtars.tokenizers import Tokenizer
from gtars.models import RegionSet

tokenizer = Tokenizer.from_pretrained("databio/atacformer-base-hg38")
rs = RegionSet("path/to/intervals.bed")

tokens = tokenizer(rs)
print(tokens["input_ids"])
# >>> [101, 202, 111]
```

### Getting special tokens
Special tokens are integral to the tokenizer's functionality, providing markers for padding, masking, and classification tasks. You can access the special tokens map from the tokenizer as follows:
```python
from gtars.tokenizers import Tokenizer

tokenizer = Tokenizer.from_pretrained("databio/atacformer-base-hg38")
print(tokenizer.special_tokens_map)
# >>> {'pad_token': '<pad>', 'mask_token': '<mask>', 'cls_token': '<cls>', ...}
```

### Decoding input id's
For generative tasks, or when you need to convert input ids back to their original genomic interval representation, you can use the tokenizer's decode method:
```python
from gtars.tokenizers import Tokenizer

tokenizer = Tokenizer.from_pretrained("databio/atacformer-base-hg38")
special_tokens_mask = tokenizer.decode([101, 202, 111])
# >>> chr1:100-200, chr1:200-300, ...
```