# bedboss

[![PEP compatible](https://pepkit.github.io/img/PEP-compatible-green.svg)](https://pep.databio.org/)
![Run pytests](https://github.com/bedbase/bedboss/workflows/Run%20instalation%20test/badge.svg)
[![pypi-badge](https://img.shields.io/pypi/v/bedboss?color=%2334D058)](https://pypi.org/project/bedboss)
[![pypi-version](https://img.shields.io/pypi/pyversions/bedboss.svg?color=%2334D058)](https://pypi.org/project/bedboss)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Github badge](https://img.shields.io/badge/source-github-354a75?logo=github)](https://github.com/databio/bedboss)

---

**Documentation**: <a href="https://docs.bedbase.org/bedboss" target="_blank">https://docs.bedbase.org/bedboss</a>

**Source Code**: <a href="https://github.com/databio/bedboss" target="_blank">https://github.com/databio/bedboss</a>

---

bedboss is a command-line pipeline that filters, standardizes, and calculates statistics for genomic interval data, 
and enters the results into a BEDbase database. 

## Installation
To install `bedboss` use this command: 
```
pip install bedboss
```
or install the latest version from the GitHub repository:
```
pip install git+https://github.com/databio/bedboss.git
```

It has 3 components: 

1) bedmaker (`bedboss make`); </br>
2) bedqc (`bedboss qc`);</br>
3) bedstat (`bedboss stat`).

You may run all 3 pipelines together, or separately.

Mainly pipelines are intended to be run from command line but nevertheless, 
they are also available as a python function, so that user can implement them to his own code.
----
## BEDboss consist of 3 main pipelines:

### bedmaker
bedmaker - pipeline to convert supported file types* into BED format and bigBed format. Currently supported formats:

- bedGraph
- bigBed
- bigWig
- wig

### bedqc
flag bed files for further evaluation to determine whether they should be included in the downstream analysis. 
Currently, it flags bed files that are larger than 2G, has over 5 milliom regions, and/or has mean region width less than 10 bp.
This threshold can be changed in bedqc function arguments.

### bedstat

pipeline for obtaining statistics about bed files

It produces BED file Statistics:

- **GC content**.The average GC content of the region set. 
- **Number of regions**. The total number of regions in the BED file. 
- **Median TSS distance**. The median absolute distance to the Transcription Start Sites (TSS)
- **Mean region width**. The average region width of the region set.
- **Exon percentage**.	The percentage of the regions in the BED file that are annotated as exon. 
- **Intron percentage**.	The percentage of the regions in the BED file that are annotated as intron.
- **Promoter proc percentage**.	The percentage of the regions in the BED file that are annotated as promoter-prox.
- **Intergenic percentage**. The percentage of the regions in the BED file that are annotated as intergenic.
- **Promoter core percentage**.	The percentage of the regions in the BED file that are annotated as promoter-core.
- **5' UTR percentage**. The percentage of the regions in the BED file that are annotated as 5'-UTR.
- **3' UTR percentage**. The percentage of the regions in the BED file that are annotated as 3'-UTR.

# Additional information

## bedmaker

### Additional dependencies

- bedToBigBed: http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
- bigBedToBed: http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed
- bigWigToBedGraph: http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bigWigToBedGraph
- wigToBigWig: http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig

## bedstat

### Additional dependencies
regionstat.R script is used to calculate the bed file statistics, so the pipeline also depends on several R packages:

All dependencies you can find in R helper script, and use it to easily install the required packages:

- Rscript scripts/installRdeps.R [How to install R dependencies](./how_to_install_r_dep.md)



---

# OTHER docs:





It has 3 components: 1) bedmaker (`bedboss make`); 2) bedqc (`bedboss qc`); and 3) bedstat `bedboss stat`. You may run all 3 pipelines separately, together (`bedbase all`).
## 1) bedmaker

Converts supported file types into BED and bigBed format. Currently supported formats:
   - bedGraph
   - bigBed
   - bigWig
   - wig

## 2) bedqc

Assess QC of BED files and flag potential problems for further evaluation so you can determine whether they should be included in downstream analysis. 
Currently, it flags BED files that are larger than 2 GB, have over 5 million regions, or have a mean region width less than 10 bp.
These thresholds can be changed with pipeline arguments.

## 3) bedstat

Calculates statistics about BED files.

## 4) bedbuncher

Creates **bedsets** (sets of BED files) and calculates statistics about them (currently means and standard deviations).

## Additional bedboss components:
### Indexing
bedboss can automatically create vector embeddings for BED files using geniml. And later these embeddings can 
be automatically inserted into the qdrant database.

### Uploading to s3
bedboss can automatically upload files to an s3 bucket. This can be done using `--upload-to-s3` flag.

---

# Documentation
Full documentation is available at [bedboss.databio.org](https://docs.bedbase.org/).

## How to install R dependencies

1. Install R: https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html
2. Install dev tools on linux: ```sudo apt install r-cran-devtools```
3. Download script `installRdeps.R` from this repository.
4. Install dependencies by running this command in your terminal: ```Rscript installRdeps.R```
5. Run `bash_requirements_test.sh` to check if everything was installed correctly (located in test folder: 
[Bash requirement tests](https://github.com/bedbase/bedboss/blob/68910f5142a95d92c27ef53eafb9c35599af2fbd/test/bash_requirements_test.sh)
