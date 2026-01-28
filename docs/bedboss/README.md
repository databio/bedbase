<p align="center">
<h1><img align="center" src="img/bedboss_logo.svg" class="img-header" height="100"></h1>
</p>

<p align="center">

<a href="https://pep.databio.org/"><img src="https://pepkit.github.io/img/PEP-compatible-green.svg" alt=""></a>
<a href="https://pypi.org/project/bedboss/"><img src="https://img.shields.io/pypi/v/bedboss?color=%2334D058" alt=""></a>
<a href="https://github.com/databio/bedboss"><img src="https://img.shields.io/badge/source-github-354a75?logo=github"></a>
</p>


A command-line tool and Python package for managing and processing genomic interval region files and bedsets in BEDbase.
BEDboss is highly related to BEDbase, nevertheless, it can be used as a standalone tool for calculating statistics, converting files, and verifying the quality of BED files.

---

## 💿 Installation
To install `bedboss` use this command: 
```
pip install bedboss
```
or install the latest version from the GitHub repository:
```
pip install git+https://github.com/databio/bedboss.git
```

---

## 💻 CLI usage:
Command line documentation is available here: [📑 CLI usage ](./usage.md)

---

## 📑 BEDbase configuration file

To run most of the pipelines, you need to create a BEDbase configuration file.

How to create a BEDbase configuration file is described in the [configuration section](../bedbase/how-to-configure.md).

---

## 🗃️ Main components:

1) **bedmaker** - pipeline to convert various genomic interval file types into BED format and bigBed format. </br>
2) **bedqc** - quality assessment pipeline of bed files </br>
3) **bedstat** - pipeline for obtaining statistics about bed files. </br>
4) **bedbuncher** - pipeline for grouping bed files in collections and calculation statistics about them. </br>
5) **bedclassifier** - scripts for classifying bed files based on their columns. </br>
6) **refgenome_validator** - pipeline for validating the reference genome of the bed files. </br>
7) **bbuploader** - pipeline for uploading bed files from GEO database to the BEDbase database and processing them. </br>

Mainly pipelines are intended to be run from command line but nevertheless, 
they are also available as a python functions, so that user can use them independently.

---

## 📦 BEDboss dependencies
Before running any of the pipelines, you need to install the required dependencies.

To check if all dependencies are installed, you can run the following command:

```bash
bedboss check-requirements
```


To install all R dependencies, you can run the following command:

```bash
bedboss install-requirements
```

Additionally, sometimes you would need to have UCSC tools installed on your system.
To install UCSC tools, follow initial instructions from the [UCSC website](https://genome.ucsc.edu/goldenpath/help/bigBed.html).

---



## ℹ️ BEDboss pipelines:

#### 🟢 bedmaker
Bedmaker can convert different interval region set files to BED and bigBed format, cache it using [Geniml bbclient](../geniml/bbclient/bbclient.md).

Supported formats are:
- bedGraph
- bigBed
- bigWig
- wig

#### 🟢 bedqc
Evaluates bed files if statistically they are correct, and if they should be included in the downstream analysis. 
Currently, it flags bed files that are larger than 2G, has over 5 milliom regions, and/or has mean region width less than 10 bp.
This threshold can be changed in bedqc function arguments.

#### 🟢 bedstat

Pipeline for obtaining statistics about bed files. Statistics include:

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

#### 🟢 bedbuncher

Pipeline designed to create **bedsets** (collections of BED files) that will be retrieved from bedbase.

Example bedsets:

- Bed files from the AML database.
- Bed files from the [Excluderanges](https://github.com/dozmorovlab/excluderanges#bedbase-data-download) database.
- Bed files from the LOLA database [https://databio.org/regiondb](https://databio.org/regiondb)

\*This pipeline is available only in for bedbase processing, and can't be use as a standalone tool.

#### 🟢 bedclassifier

Pipeline for classifying bed files based on their columns.
The example output of the bedclassifier is bed_format: `nerrowopeak`/`broadpeak`/`bed` and bed_type: `bed3+5`.

#### 🟢 refgenome_validator

Pipeline for validating the reference genome of the bed files. 
It is standalone tool, and can be used independently. It tries to validate and predict the reference genome of the bed files.
by comparing the regions in the bed file with the reference genome. It produces the ranking of the reference genomes
where 1 is the best match and 4 is the worst match.


#### 🟢 GEOuploader

Module for uploading bed files from GEO database to the BEDbase database and processing them. Data for uploading files 
are taken from the PEPhub database, where all GEO metadata is stored.
