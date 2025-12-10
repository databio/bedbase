# BED Classification

BED classification is a calculated metadata about RegionSet file that classifies RegionSet files based on the number of columns and the types of data contained within those columns.

BED classifier calculates 2 metadata fields: BED compliance and Data Format. *(BED classifier tutorial can be found here: [BED Classifier tutorial](../../bedboss/tutorials/python/bedclassifier_tutorial.md))*

### 🟢 BED compliance (`compliant_columns` + `non_compliant_columns`)

BED compliance is a string that indicates the number of compliant and non-compliant columns in the BED file. 
It is represented as `bedn+m`, where `n` is the number of compliant columns, and `m` is the number of non-compliant columns. 
For example, `bed3+0` indicates that there are 3 compliant columns and 0 non-compliant columns.

???+ example

    ```
    bed3+0, bed7+3
    ```
    Where: </br>
    - `bed3+0` indicates that there are 3 compliant columns and 0 non-compliant columns. </br>
    - `bed7+3` indicates that there are 7 compliant columns and 3 non-compliant columns.

### 🟢 Data formats 

The **data format** is a string that indicates flavor of the RegionSet format. We defined the following data formats:

```
class DATA_FORMAT(str, Enum):
    UNKNOWN = "unknown_data_format"
    UCSC_BED = "ucsc_bed"
    UCSC_BED_RS = "ucsc_bed_rs"
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
???+ note
    **`rs`** refers to **`relaxed_score`** which indicates that a fifth column was present where the values are integers greater than 0. </br>
    In contrast, a strict interpretation for column 5 is: A score between 0 and 1000.


- #### UNKNOWN
Classification was unable to determine the data format.

- #### UCSC_BED
Conforms to [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)

- #### UCSC_BED_RS
Conforms to [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) but with a relaxed interpretation for the fifth column.

- #### BED_LIKE
Data is tab delimited but contains columns that are not compliant with [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1).
Example: `bedn+m` where `n` are compliant columns, `m` are non-compliant columns and `m > 0` 

- #### BED_LIKE_RS
Data is tab delimited but contains columns that are not compliant with [ucsc bed](https://genome.ucsc.edu/FAQ/FAQformat.html#format1) but with a relaxed interpretation for the fifth column.</br>
**Example:** 
`bedn+m` where `n` are compliant columns, `m` are non-compliant columns and `m > 0`, Column 5 = `integer > 0` 

- #### ENCODE_NARROWPEAK
Conforms to [ENCODE narrowPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format12)

- #### ENCODE_NARROWPEAK_RS
Conforms to [ENCODE narrowPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format12) but with a relaxed interpretation for the fifth column.

- #### ENCODE_BROADPEAK
Conforms to [ENCODE broadPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format13) 

- #### ENCODE_BROADPEAK_RS
Conforms to [ENCODE broadPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format13) but with a relaxed interpretation for the fifth column.

- #### ENCODE_GAPPEDPEAK
Conforms to [ENCODE gappedPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format14)

- #### ENCODE_GAPPEDPEAK_RS
Conforms to [ENCODE gappedPeak](https://genome.ucsc.edu/FAQ/FAQformat.html#format14) but with a relaxed interpretation for the fifth column.

- #### ENCODE_RNA_ELEMENTS
Conforms to [ENCODE RNA elements](https://genome.ucsc.edu/FAQ/FAQformat.html#format11)

- #### ENCODE_RNA_ELEMENTS_RS
Conforms to [ENCODE RNA elements](https://genome.ucsc.edu/FAQ/FAQformat.html#format11)  but with a relaxed interpretation for the fifth column.


## ℹ️ References:
- Information on various data formats can be found here:
[https://genome.ucsc.edu/FAQ/FAQformat.html](https://genome.ucsc.edu/FAQ/FAQformat.html)

- Additional detailed specifications for the Browser Extensible Data (BED) format can be found here:
[https://samtools.github.io/hts-specs/BEDv1.pdf](https://samtools.github.io/hts-specs/BEDv1.pdf)

- BEDBoss tutorial of bedclassifier can be found here: [BED Classifier tutorial](../../bedboss/tutorials/python/bedclassifier_tutorial.md)

