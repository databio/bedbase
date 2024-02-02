# BEDboss
bedboss is a command-line pipeline that standardizes and calculates statistics for genomic interval data, and enters the results into a BEDbase database. 
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
