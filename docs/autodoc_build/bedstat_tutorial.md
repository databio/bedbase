jupyter:True
# bedboss stat

This tutorial is intended to introduce you to bedstat, pipeline that produces statistics and plots based on bed and bigbed files

### 1. Install all dependencies and initialize database for it

- Install dependecies: [How to install R dependencies](./how_to_install_r_dep/)
- Initialize database: [How to initialize database](./how_to_create_database/)
- Create config file: [How to create config file](./how_to_bedbase_config/)

### 2. Create working repository


```bash
mkdir stat_tutorial ; cd stat_tutorial 
```

Create config file by downloading it and configuring it


```bash
cat bedbase_config_test.yaml
```

```.output
path:
  pipeline_output_path: $BEDBOSS_OUTPUT_PATH  # do not change it
  bedstat_dir: bedstat_output
  remote_url_base: null
  bedbuncher_dir: bedbucher_output
database:
  host: localhost
  port: 5432
  password: docker
  user: postgres
  name: pep-db
  dialect: postgresql
  driver: psycopg2
server:
  host: 0.0.0.0
  port: 8000
remotes:
  http:
    prefix: https://data.bedbase.org/
    description: HTTP compatible path
  s3:
    prefix: s3://data.bedbase.org/
    description: S3 compatible path

```

### 3. Download bed and bigbed files

Bed file


```bash
wget -O sample1.bed.gz https://github.com/bedbase/bedboss/raw/dev/test/data/bed/hg19/correct/sample1.bed.gz

```

```.output
--2023-02-28 15:32:57--  https://github.com/bedbase/bedboss/raw/dev/test/data/bed/hg19/correct/sample1.bed.gz
Resolving github.com (github.com)... 140.82.113.3
Connecting to github.com (github.com)|140.82.113.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://raw.githubusercontent.com/bedbase/bedboss/dev/test/data/bed/hg19/correct/sample1.bed.gz [following]
--2023-02-28 15:32:57--  https://raw.githubusercontent.com/bedbase/bedboss/dev/test/data/bed/hg19/correct/sample1.bed.gz
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.108.133, 185.199.111.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.108.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7087126 (6.8M) [application/octet-stream]
Saving to: ‘sample1.bed.gz’

sample1.bed.gz      100%[===================>]   6.76M  --.-KB/s    in 0.07s   

2023-02-28 15:32:58 (95.8 MB/s) - ‘sample1.bed.gz’ saved [7087126/7087126]


```

BigBed file


```bash
wget -O sample1.bigBed https://github.com/bedbase/bedboss/raw/dev/test/data/bigbed/hg19/correct/sample1.bigBed

```

```.output
--2023-02-28 15:33:00--  https://github.com/bedbase/bedboss/raw/dev/test/data/bigbed/hg19/correct/sample1.bigBed
Resolving github.com (github.com)... 140.82.113.3
Connecting to github.com (github.com)|140.82.113.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://raw.githubusercontent.com/bedbase/bedboss/dev/test/data/bigbed/hg19/correct/sample1.bigBed [following]
--2023-02-28 15:33:00--  https://raw.githubusercontent.com/bedbase/bedboss/dev/test/data/bigbed/hg19/correct/sample1.bigBed
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.110.133, 185.199.111.133, 185.199.109.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.110.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 13092350 (12M) [application/octet-stream]
Saving to: ‘sample1.bigBed’

sample1.bigBed      100%[===================>]  12.49M  --.-KB/s    in 0.1s    

2023-02-28 15:33:00 (101 MB/s) - ‘sample1.bigBed’ saved [13092350/13092350]


```


```bash
ls
```

```.output
bedbase_config_test.yaml  sample1.bed.gz  sample1.bigBed

```

### 4. Run statistics:

Additionally we need some metadata about files. 1) genome assembly, config file and know output folder.


```bash
bedboss stat --help
```

```.output
usage: bedboss stat [-h] --bedfile BEDFILE --outfolder OUTFOLDER
                    [--open-signal-matrix OPEN_SIGNAL_MATRIX] [--ensdb ENSDB]
                    [--bigbed BIGBED] --bedbase-config BEDBASE_CONFIG
                    [-y SAMPLE_YAML] --genome GENOME_ASSEMBLY [--no-db-commit]
                    [--just-db-commit]

options:
  -h, --help            show this help message and exit
  --bedfile BEDFILE     a full path to bed file to process [Required]
  --outfolder OUTFOLDER
                        Pipeline output folder [Required]
  --open-signal-matrix OPEN_SIGNAL_MATRIX
                        a full path to the openSignalMatrix required for the
                        tissue specificity plots
  --ensdb ENSDB         a full path to the ensdb gtf file required for genomes
                        not in GDdata
  --bigbed BIGBED       a full path to the bigbed files
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file [Required]
  -y SAMPLE_YAML, --sample-yaml SAMPLE_YAML
                        a yaml config file with sample attributes to pass on
                        more metadata into the database
  --genome GENOME_ASSEMBLY
                        genome assembly of the sample [Required]
  --no-db-commit        whether the JSON commit to the database should be
                        skipped
  --just-db-commit      whether just to commit the JSON to the database

```


```bash
bedboss stat \
--bedfile ./sample1.bed.gz \
--bigbed ./sample1.bigBed \
--outfolder ./test_output \
--genome hg19 \
--bedbase-config ./bedbase_config_test.yaml 

```

```.output
Warning: You're running an interactive python session. This works, but pypiper cannot tee the output, so results are only logged to screen.
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss stat --bedfile ./sample1.bed.gz --bigbed ./sample1.bigBed --outfolder ./test_output --genome hg19 --bedbase-config ./bedbase_config_test.yaml`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial
*            Outfolder:  ./test_output/
*  Pipeline started at:   (02-28 15:46:52) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.6
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.12.3
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  0.1.0-dev1

### Arguments passed to pipeline:


----------------------------------------

Target to produce: `/home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1.json`  

> `Rscript /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedstat/tools/regionstat.R --bedfilePath=./sample1.bed.gz --fileId=sample1 --openSignalMatrix=None --outputFolder=/home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c --genome=hg19 --ensdb=None --digest=c557c915a9901ce377ef724806ff7a2c` (530529)
<pre>
Loading required package: IRanges
Loading required package: BiocGenerics

Attaching package: ‘BiocGenerics’

The following objects are masked from ‘package:stats’:

    IQR, mad, sd, var, xtabs

The following objects are masked from ‘package:base’:

    anyDuplicated, append, as.data.frame, basename, cbind, colnames,
    dirname, do.call, duplicated, eval, evalq, Filter, Find, get, grep,
    grepl, intersect, is.unsorted, lapply, Map, mapply, match, mget,
    order, paste, pmax, pmax.int, pmin, pmin.int, Position, rank,
    rbind, Reduce, rownames, sapply, setdiff, sort, table, tapply,
    union, unique, unsplit, which.max, which.min

Loading required package: S4Vectors
Loading required package: stats4

Attaching package: ‘S4Vectors’

The following objects are masked from ‘package:base’:

    expand.grid, I, unname

Loading required package: GenomicRanges
Loading required package: GenomeInfoDb
[?25hsnapshotDate(): 2021-10-19
[?25h[?25hLoading required package: GenomicFeatures
Loading required package: AnnotationDbi
Loading required package: Biobase
Welcome to Bioconductor

    Vignettes contain introductory material; view with
    'browseVignettes()'. To cite Bioconductor, see
    'citation("Biobase")', and for packages 'citation("pkgname")'.

Loading required package: AnnotationFilter

Attaching package: 'ensembldb'

The following object is masked from 'package:stats':

    filter

[?25h[?25h[?25hLoading required package: R.oo
Loading required package: R.methodsS3
R.methodsS3 v1.8.2 (2022-06-13 22:00:14 UTC) successfully loaded. See ?R.methodsS3 for help.
R.oo v1.25.0 (2022-06-12 02:20:02 UTC) successfully loaded. See ?R.oo for help.

Attaching package: 'R.oo'

The following object is masked from 'package:R.methodsS3':

    throw

The following object is masked from 'package:GenomicRanges':

    trim

The following object is masked from 'package:IRanges':

    trim

The following objects are masked from 'package:methods':

    getClasses, getMethods

The following objects are masked from 'package:base':

    attach, detach, load, save

R.utils v2.12.2 (2022-11-11 22:00:03 UTC) successfully loaded. See ?R.utils for help.

Attaching package: 'R.utils'

The following object is masked from 'package:utils':

    timestamp

The following objects are masked from 'package:base':

    cat, commandArgs, getOption, isOpen, nullfile, parse, warnings

[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[?25h[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_tssdist"
Scale for x is already present.
Adding another scale for x, which will replace the existing scale.
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_tssdist"
Successfully calculated and plot TSS distance.
[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_chrombins"
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_chrombins"
Successfully calculated and plot chromosomes region distribution.
Calculating overlaps...
[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_paritions"
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_paritions"
Successfully calculated and plot regions distribution over genomic partitions.
[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_expected_partitions"
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_expected_partitions"
Successfully calculated and plot expected distribution over genomic partitions.
[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_cumulative_partitions"
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_cumulative_partitions"
Successfully calculated and plot cumulative distribution over genomic partitions.
[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_widths_histogram"
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_widths_histogram"
Successfully calculated and plot quantile-trimmed histogram of widths.
[1] "Plotting: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/stat_tutorial/test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_neighbor_distances"
[1] "Writing plot json: output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1_neighbor_distances"
Successfully calculated and plot distance between neighbor regions.
open signal matrix not provided. Skipping tissue specificity plot ... 
[?25h[?25h</pre>
Command completed. Elapsed time: 0:00:20. Running peak memory: 1.358GB.  
  PID: 530529;	Command: Rscript;	Return code: 0;	Memory used: 1.358GB

These results exist for 'c557c915a9901ce377ef724806ff7a2c': bedfile, genome

### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:00:20
*  Total elapsed time (all runs):  0:00:20
*         Peak memory (this run):  1.3577 GB
*        Pipeline completed time: 2023-02-28 15:47:12

```

After plots and statistics were produced, we can look at them


```bash
ls test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c
```

```.output
sample1_chrombins.pdf              sample1_neighbor_distances.png
sample1_chrombins.png              sample1_paritions.pdf
sample1_cumulative_partitions.pdf  sample1_paritions.png
sample1_cumulative_partitions.png  sample1_plots.json
sample1_expected_partitions.pdf    sample1_tssdist.pdf
sample1_expected_partitions.png    sample1_tssdist.png
sample1.json                       sample1_widths_histogram.pdf
sample1_neighbor_distances.pdf     sample1_widths_histogram.png

```


```bash
cat test_output/output/bedstat_output/c557c915a9901ce377ef724806ff7a2c/sample1.json
```

```.output
{
  "name": ["sample1"],
  "regions_no": [300000],
  "mean_region_width": [663.9],
  "md5sum": ["c557c915a9901ce377ef724806ff7a2c"],
  "median_TSS_dist": [48580],
  "exon_frequency": [14871],
  "exon_percentage": [0.0496],
  "fiveUTR_frequency": [8981],
  "fiveUTR_percentage": [0.0299],
  "intergenic_frequency": [141763],
  "intergenic_percentage": [0.4725],
  "intron_frequency": [106638],
  "intron_percentage": [0.3555],
  "promoterCore_frequency": [10150],
  "promoterCore_percentage": [0.0338],
  "promoterProx_frequency": [6851],
  "promoterProx_percentage": [0.0228],
  "threeUTR_frequency": [10746],
  "threeUTR_percentage": [0.0358]
}

```
