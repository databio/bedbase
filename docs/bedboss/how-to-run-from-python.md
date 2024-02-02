# How to run bedboss as a Python API

## Install bedboss

```bash
pip install bedboss
```

## Run bedboss all

```python
from bedboss import run_all

run_all(
    sample_name="example_sample_name",
    input_file="example/path/to/input_file",
    input_type="bed",
    outfolder="example/path/to/outfolder",
    genome="hg38",
    bedbase_config="example/path/to/bedbase_config.yaml",
    # + another optional arguments
)


```


## Run bedboss all-pep

```python
from bedboss import run_all_by_pep

run_all_by_pep(
    pep="example/path/to/pep.yaml"
)
```

## Run bedboss make

```python
from bedboss import BedMaker

BedMaker(
    input_file="example/path/to/input_file",
    input_type="bed",
    output_bed="example/path/to/output_bed",
    output_bigbed="example/path/to/output_bigbed",
    sample_name="example_sample_name",
    genome="hg38",
)

```

## Run bedboss stat

```python
from bedboss import bedstat

bedstat( 
    bedfile="example/path/to/bedfile.bed",
    bedbase_config="example/path/to/bedbase_config.yaml",
    genome="hg38",
    outfolder="example/path/to/outfolder",
)

```

## Run bedboss qc

```python
from bedboss import bedqc

bedqc(
    bedfile="example/path/to/bedfile.bed",
    outfolder="example/path/to/outfolder",
)
```