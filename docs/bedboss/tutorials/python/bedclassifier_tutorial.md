# BED classifier tutorial

BED classifier is a utility that allows you to classify BED files based on the number of columns and the types of data contained within those columns.

Information on various data formats can be found here:
[https://genome.ucsc.edu/FAQ/FAQformat.html](https://genome.ucsc.edu/FAQ/FAQformat.html)

Additional detailed specifications for the Browser Extensible Data (BED) format can be found here:
[https://samtools.github.io/hts-specs/BEDv1.pdf](https://samtools.github.io/hts-specs/BEDv1.pdf)


## get_bed_classification

The function, ` get_bed_classification`, takes a path to bed-like file or a dataframe and returns a `BedClassification` object with the following attributes:

```
class BedClassification(BaseModel):
    bed_compliance: str
    data_format: DATA_FORMAT
    compliant_columns: int
    non_compliant_columns: int

```

where `DATA_FORMAT` is defined as:

```
class DATA_FORMAT(str, Enum):
    UNKNOWN = "unknown_data_format"
    UCSC_BED = "ucsc_bed"
    BED_RS = "bed_rs"
    BED_LIKE = "bed_like"
    BED_LIKE_RS = "bed_like_rs"
    ENCODE_NARROWPEAK = "encode_narrowpeak"
    ENCODE_NARROWPEAK_RS = "encode_narrowpeak_rs"
    ENCODE_BROADPEAK = "encode_broadpeak"
    ENCODE_BROADPEAK_RS = "encode_broadpeak_rs"
    ENCODE_GAPPEDPEAK = "encode_gappedpeak"
    ENCODE_GAPPEDPEAK_RS = "encode_gappedpeak_rs"
    ENCODE_RNA_ELEMENTS = "encode_rna_elements"
    ENCODE_RNA_ELEMENTS_RS = "encode_rna_elements_rs"
```

## Example usage of the BED classifier:

```python
from bedboss.bedclassifier.bedclassifier import get_bed_classification

classification = get_bed_classification("path/to/bedfile.bed")


print(f"{classification.bed_compliance}, {classification.data_format}, {classification.compliant_columns}, {classification.non_compliant_columns}")


## Example 1
## > 'bed3+0', 'ucsc_bed', 3, 0

## Example 2
## > 'bed6+4', 'encode_narrowpeak', 6, 4
```


## Data formats 

Below `rs` refers to `relaxed_score` which indicates that a fifth column was present where the values are integers greater than 0. In constrast, a strict interpretation for column 5 is:
```
Column 5 - score - A score between 0 and 1000.
```

### UNKNOWN

Classification was unable to determine the data format.

### UCSC_BED
Conforms to [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)

### BED_RS
Conforms to [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) but with a relaxed interpretation for the fifth column.

### BED_LIKE
Data is tab delimited but contains columns that are not compliant with [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1).
Example: `bedn+m` where `n` are compliant columns, `m` are non-compliant columns and `m > 0` 

### BED_LIKE_RS
Data is tab delimited but contains columns that are not compliant with [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) but with a relaxed interpretation for the fifth column.

**Example:** 
`bedn+m` where `n` are compliant columns, `m` are non-compliant columns and `m > 0`, Column 5 = `integer > 0` 

### ENCODE_NARROWPEAK
Conforms to [ENCODE narrowPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format12)

### ENCODE_NARROWPEAK_RS
Conforms to [ENCODE narrowPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format12) but with a relaxed interpretation for the fifth column.

### ENCODE_BROADPEAK
Conforms to [ENCODE broadPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format13) 

### ENCODE_BROADPEAK_RS
Conforms to [ENCODE broadPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format13) but with a relaxed interpretation for the fifth column.

### ENCODE_GAPPEDPEAK
Conforms to [ENCODE gappedPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format14)

### ENCODE_GAPPEDPEAK_RS
Conforms to [ENCODE gappedPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format14) but with a relaxed interpretation for the fifth column.

### ENCODE_RNA_ELEMENTS
Conforms to [ENCODE RNA elements](https://genome.ucsc.edu/FAQ/FAQformat.html#format11)

### ENCODE_RNA_ELEMENTS_RS
Conforms to [ENCODE RNA elements](https://genome.ucsc.edu/FAQ/FAQformat.html#format11)  but with a relaxed interpretation for the fifth column.