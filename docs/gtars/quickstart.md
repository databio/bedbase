# Quick start
Tokenize some genomic regions using `gtars`. If you haven't already, install `gtars` by following the instructions in the [installation guide](installation.md).

## Tokenize regions
To tokenize regions, you need to provide a universe, which specifies the "vocabulary" of genomic regions. The universe is a BED file, containing representative regions. With the given universe, we represent (tokenize) raw regions into the regions in the universe.

```python
from gtars.tokenizers import TreeTokenizer
from gtars.models import RegionSet

tokenizer = TreeTokenizer("path/to/universe.bed")
rs = RegionSet("path/to/raw.bed")

tokens = tokenizer(rs)

for token in tokens:
    print(f"{token.chr}:{token.start}-{token.end}")
    print(f"{token.id}")
```