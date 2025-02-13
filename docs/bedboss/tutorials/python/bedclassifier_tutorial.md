# BED classifier tutorial

BED classifier is a utility that allows you to classify BED files based on their columns.
The function output is a tuple of two strings: `bed_format` and `bed_type`. e.g. `('narrowpeak', 'bed3+5')`.

Example usage of the BED classifier:

```python
from bedboss.bedclassifier.bedclassifier import get_bed_type

f = get_bed_type("path/to/bedfile.bed")
print(f)

## > ('narrowpeak', 'bed3+5')
```