# BED classifier

BED classifier is a utility that allows you to classify BED files based on the number of columns and the types of data contained within those columns.


## `get_bed_classification`

The function, `get_bed_classification`, takes a path to bed-like file or a dataframe and returns a `BedClassification` object with the following attributes:

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

??? Note
    To read documentation of DATA Formats visit this page: [BEDBASE data formats](../../../../bedbase/user/bed_classification/#data-formats)

## Example usage of the BED classifier:

```python
from bedboss.bedclassifier import get_bed_classification

clasif = get_bed_classification("ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM8208nnn/GSM8208095/suppl/GSM8208095_Day4_WT-1_aligned_reads_peaks.narrowPeak.gz")

print(clasif)

# >> bed_compliance='bed6+4' 
# >> data_format=<DATA_FORMAT.ENCODE_NARROWPEAK_RS: 'encode_narrowpeak_rs'>
# >> compliant_columns=6
# >> non_compliant_columns=4

```
