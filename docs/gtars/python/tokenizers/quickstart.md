# Quickstart
To quickly get started with the genomic tokenizers in Python, import the `Tokenizer` class from the `gtars.tokenizers` module, and give it a bedfile of universe/vocab regions. Here's a simple example of how to use it:

```python
from gtars.tokenizers import Tokenizer
from gtars.models import RegionSet

universe = "path/to/your/regions.bed"
tokenizer = Tokenizer(universe)

rs = RegionSet("path/to/your/sample.bed")

tokens = tokenizer.tokenize(rs)
print(tokens) # ["chr1:100-200", "chr2:300-400", ...]
```

Here, we created a tokenizer by specifying a BED file that defines the universe of genomic regions we want to tokenize against. We then created a `RegionSet` object from another BED file containing our sample genomic intervals. Finally, we used the `tokenize` method to convert our genomic intervals into tokens based on the defined universe.