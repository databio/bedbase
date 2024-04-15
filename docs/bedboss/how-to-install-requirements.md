# How to install R dependencies

0. Install bedboss
1. Install R: https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html
2. Download this script: [installRdeps.R](https://github.com/databio/bedboss/blob/dev/scripts/installRdeps.R)
3. Install dependencies by running this command in your terminal: ```Rscript installRdeps.R```
4. Run `bedboss check-requirements` to check if everything was installed correctly.


# How to install regionset conversion tools:

- **bedToBigBed**: http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed
- **bigBedToBed**: http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed
- **bigWigToBedGraph**: http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/bigWigToBedGraph
- **wigToBigWig**: http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/wigToBigWig
