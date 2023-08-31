jupyter:True
# bedmaker tutorial

To create bed and bigbed files we will need to use bedmaker: `bedboss make`


```bash
bedboss --help
```

```.output
version: 0.1.0-dev1
usage: bedboss [-h] [--version] {all,make,qc,stat} ...

Warehouse of pipelines for BED-like files: bedmaker, bedstat, and bedqc.

positional arguments:
  {all,make,qc,stat}
    all               Run all bedboss pipelines and insert data into bedbase
    make              A pipeline to convert bed, bigbed, bigwig or bedgraph
                      files into bed and bigbed formats
    qc                Run quality control on bed file (bedqc)
    stat              A pipeline to read a file in BED format and produce
                      metadata in JSON format.

options:
  -h, --help          show this help message and exit
  --version           show program's version number and exit

```


```bash
bedboss make --help
```

```.output
usage: bedboss make [-h] -f INPUT_FILE [-n NARROWPEAK] -t INPUT_TYPE -g GENOME
                    -r RFG_CONFIG -o OUTPUT_BED --output-bigbed OUTPUT_BIGBED
                    -s SAMPLE_NAME [--chrom-sizes CHROM_SIZES]
                    [--standard-chrom]

options:
  -h, --help            show this help message and exit
  -f INPUT_FILE, --input-file INPUT_FILE
                        path to the input file
  -n NARROWPEAK, --narrowpeak NARROWPEAK
                        whether the regions are narrow (transcription factor
                        implies narrow, histone mark implies broad peaks)
  -t INPUT_TYPE, --input-type INPUT_TYPE
                        a bigwig or a bedgraph file that will be converted
                        into BED format
  -g GENOME, --genome GENOME
                        reference genome
  -r RFG_CONFIG, --rfg-config RFG_CONFIG
                        file path to the genome config file
  -o OUTPUT_BED, --output-bed OUTPUT_BED
                        path to the output BED files
  --output-bigbed OUTPUT_BIGBED
                        path to the folder of output bigBed files
  -s SAMPLE_NAME, --sample-name SAMPLE_NAME
                        name of the sample used to systematically build the
                        output name
  --chrom-sizes CHROM_SIZES
                        a full path to the chrom.sizes required for the
                        bedtobigbed conversion
  --standard-chrom      Standardize chromosome names. Default: False

```


```bash
 bedboss make --sample-name test_bed \
 --input-file ../test/data/bed/hg19/correct/hg19_example1.bed \
 --input-type bed \
 --genome hg19 \
 --output-bed ./bed \
 --output-bigbed ./bigbed 

```

```.output
Output directory does not exist. Creating: ./bed
BigBed directory does not exist. Creating: ./bigbed
bedmaker logs directory doesn't exist. Creating one...
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss make --sample-name test_bed --input-file ../test/data/bed/hg19/correct/hg19_example1.bed --input-type bed --genome hg19 --output-bed ./bed --output-bigbed ./bigbed`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter
*            Outfolder:  ./bed/bedmaker_logs/test_bed/
*  Pipeline started at:   (02-08 15:39:09) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.6
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.12.3
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  None

### Arguments passed to pipeline:


----------------------------------------

Got input type: bed
Converting ../test/data/bed/hg19/correct/hg19_example1.bed to BED format.
Target to produce: `./bed/hg19_example1.bed.gz`  

> `cp ../test/data/bed/hg19/correct/hg19_example1.bed ./bed/hg19_example1.bed` (2477650)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2477650;	Command: cp;	Return code: 0;	Memory used: 0.0GB


> `gzip ./bed/hg19_example1.bed ` (2477652)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2477652;	Command: gzip;	Return code: 0;	Memory used: 0.0GB

Running bedqc...
Target to produce: `./bed/bedmaker_logs/test_bed/xl67fcgi`  

> `zcat ./bed/hg19_example1.bed.gz > ./bed/bedmaker_logs/test_bed/xl67fcgi` (2477654)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2477654;	Command: zcat;	Return code: 0;	Memory used: 0.0GB

Targetless command, running...  

> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh ./bed/bedmaker_logs/test_bed/xl67fcgi ` (2477656)
<pre>
1000</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2477656;	Command: bash;	Return code: 0;	Memory used: 0.0GB

Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:00:00
*  Total elapsed time (all runs):  0:00:00
*         Peak memory (this run):  0 GB
*        Pipeline completed time: 2023-02-08 15:39:09
Generating bigBed files for: ../test/data/bed/hg19/correct/hg19_example1.bed
Determining path to chrom.sizes asset via Refgenie.
Creating refgenie genome config file...
Reading refgenie genome configuration file from file: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/genome_config.yaml
/home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/alias/hg19/fasta/default/hg19.chrom.sizes
Determined path to chrom.sizes asset: /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/alias/hg19/fasta/default/hg19.chrom.sizes
Target to produce: `./bigbed/jckj3p1d`  

> `zcat ./bed/hg19_example1.bed.gz  | sort -k1,1 -k2,2n > ./bigbed/jckj3p1d` (2477666,2477667)
<pre>
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2477666;	Command: zcat;	Return code: 0;	Memory used: 0.0GB  
  PID: 2477667;	Command: sort;	Return code: 0;	Memory used: 0.0GB

Running: bedToBigBed -type=bed6+3 ./bigbed/jckj3p1d /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/alias/hg19/fasta/default/hg19.chrom.sizes ./bigbed/hg19_example1.bigBed
Target to produce: `./bigbed/hg19_example1.bigBed`  

> `bedToBigBed -type=bed6+3 ./bigbed/jckj3p1d /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter/alias/hg19/fasta/default/hg19.chrom.sizes ./bigbed/hg19_example1.bigBed` (2477669)
<pre>
pass1 - making usageList (1 chroms): 1 millis
pass2 - checking and writing primary data (175 records, 9 fields): 0 millis
</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2477669;	Command: bedToBigBed;	Return code: 0;	Memory used: 0.0GB

Starting cleanup: 2 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:00:00
*  Total elapsed time (all runs):  0:00:00
*         Peak memory (this run):  0 GB
*        Pipeline completed time: 2023-02-08 15:39:09

```

### Let's check if bed file was created  (or copied)


```bash
ls bed
```

```.output
bedmaker_logs  hg19_example1.bed.gz

```

### Let's check if bigbed file  was created


```bash
ls bigbed
```

```.output
hg19_example1.bigBed

```

### everything was finished successfuly and files are ready for further analysis!
