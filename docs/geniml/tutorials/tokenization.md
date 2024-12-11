# How to use the tokenizers
## Overview
The `geniml` tokenizers are used to prepare data for training, evaluation, and inference of genomic machine learning models. Like tokenizers for natural language processing, the `geniml` tokenizers convert raw data into a format that can be used by our models. `geniml` has a few tokenizers, but they all follow the same principles.

All tokenizers require a *universe file* (or, vocab file). This is a bedfile that contains all possible regions that can be tokenized. It may also include special tokens like the start, end, unknown, and padding token.

Our tokenizers are implemented in Rust for speed and efficiency. They exist in the `geniml` companion library called [`genimtools`](https://github.com/databio/genimtools). Currently, there are two tokenizers available: the TreeTokenizer, and the AnnDataTokenizer. The TreeTokenizer is a simple and flexible tokenizer that can be used for any type of data. The AnnDataTokenizer is specifically designed for use with single-cell AnnData objects from the `anndata` library.

The API is loosely based on the [`transformers`](https://github.com/huggingface/tokenizers) library, so it should be familiar to users of that library.

## Using the tokenizers
To start using a tokenizer, simply pass it an appropriate universe file:

```python
from geniml.tokenization import TreeTokenizer # or any other tokenizer
from geniml.io import RegionSet

rs = RegionSet("/path/to/file.bed")
t = TreeTokenizer("/path/to/universe.bed")

tokens = t(rs)
for token in tokens:
    print(f"{t.chr}:{t.start}-{t.end}")
```

You can also get token ids for the tokens:

```python
from geniml.tokenization import ITTokenizer # or any other tokenizer
from geniml.io import RegionSet

rs = RegionSet("/path/to/file.bed")
t = ITTokenizer("/path/to/universe.bed")

model = Region2Vec(len(t), 100) # 100 dimensional embedding
tokens = t(rs))

ids = tokens.to_ids()
```

## Future work
Genomic region tokenization is an active area of research. We will implement new tokenizers as they are developed. If you have a tokenizer you'd like to see implemented, please open an issue or submit a pull request.

For core development of our tokenizers, see the [gtokenizers](https://github.com/databio/genimtools) repository.
