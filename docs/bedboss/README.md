<p align="center">
<h1><img align="center" src="img/bedboss_logo.svg" class="img-header" height="100"></h1>
</p>


<p align="center">
<a href="https://pypi.org/project/bedboss/"><img src="https://img.shields.io/pypi/v/bedboss" alt=""></a>
<a href="https://github.com/databio/bedboss"><img src="https://img.shields.io/badge/source-github-354a75?logo=github"></a>
</p>


A command-line and manager tool for calculating statistics for region set files (BED files) and managing them in the BEDbase database.

### Main features:

1) **bedmaker** - pipeline to convert supported file types into BED format and bigBed format. </br>
2) **bedqc** - pipeline to flag bed files for further evaluation to determine whether they should be included in the downstream analysis. </br>
3) **bedstat** - pipeline for obtaining statistics about bed files. </br>
4) **bedbuncher** - pipeline designed to create bedsets (sets of BED files) that will be retrieved from bedbase. </br>
5) **index** - pipeline to create vectors of bedfiles and insert them into vector database for further search. </br>
6) Other delete and update tools that manage bed and bedset files in the BEDbase database. </br>

Mainly pipelines are intended to be run from command line but nevertheless, 
they are also available as a python function, so that user can implement them to his own code (e.g. automatic uploading tools).

---

## Installation
To install `bedboss` use this command: 
```
pip install bedboss
```
or install the latest version from the GitHub repository:
```
pip install git+https://github.com/databio/bedboss.git
```

---

## BEDboss dependencies
Before running any of the pipelines, you need to install the required dependencies.

To check if all dependencies are installed, you can run the following command:

```bash
bedboss check-requirements
```

All dependencies can be using this how to documentation: [How to install dependencies](./how-to-install-requirements.md)


---

## BEDbase configuration file

To run most of the pipelines, you need to create a BEDbase configuration file.

How to create a BEDbase configuration file is described in the [configuration section](./how-to-configure.md).


---

## Pipelines information

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

### bedbuncher

Pipeline designed to create **bedsets** (sets of BED files) that will be retrieved from bedbase.

Example bedsets:

- Bed files from the AML database.
- Bed files from the [Excluderanges](https://github.com/dozmorovlab/excluderanges#bedbase-data-download) database.
- Bed files from the LOLA database [http://lolaweb.databio.org/](http://lolaweb.databio.org/)

Bedbuncher calculates statistics:
- Bedset statistics (currenty means and standard deviations).

