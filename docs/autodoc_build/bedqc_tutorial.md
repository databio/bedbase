jupyter:True
# bedqc tutorial

To check Quality of bed file use this command: `badboss qc`


```bash
bedboss qc --help
```

```.output
usage: bedboss qc [-h] --bedfile BEDFILE --outfolder OUTFOLDER

options:
  -h, --help            show this help message and exit
  --bedfile BEDFILE     a full path to bed file to process
  --outfolder OUTFOLDER
                        a full path to output log folder.

```

bedqc example:


```bash
bedboss qc --bedfile ../test/data/bed/hg19/correct/hg19_example1.bed --outfolder .
```

```.output
Running bedqc...
### Pipeline run code and environment:

*              Command:  `/home/bnt4me/virginia/venv/jupyter/bin/bedboss qc --bedfile ../test/data/bed/hg19/correct/hg19_example1.bed --outfolder .`
*         Compute host:  bnt4me-Precision-5560
*          Working dir:  /home/bnt4me/virginia/repos/bedbase_all/bedboss/docs_jupyter
*            Outfolder:  ./
*  Pipeline started at:   (02-08 15:44:57) elapsed: 0.0 _TIME_

### Version log:

*       Python version:  3.10.6
*          Pypiper dir:  `/home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/pypiper`
*      Pypiper version:  0.12.3
*         Pipeline dir:  `/home/bnt4me/virginia/venv/jupyter/bin`
*     Pipeline version:  None

### Arguments passed to pipeline:


----------------------------------------

Target exists: `../test/data/bed/hg19/correct/hg19_example1.bed`  
Targetless command, running...  

> `bash /home/bnt4me/virginia/venv/jupyter/lib/python3.10/site-packages/bedboss/bedqc/est_line.sh ../test/data/bed/hg19/correct/hg19_example1.bed ` (2478311)
<pre>
1000</pre>
Command completed. Elapsed time: 0:00:00. Running peak memory: 0GB.  
  PID: 2478311;	Command: bash;	Return code: 0;	Memory used: 0.0GB

Starting cleanup: 1 files; 0 conditional files for cleanup

Cleaning up flagged intermediate files. . .

### Pipeline completed. Epilogue
*        Elapsed time (this run):  0:00:00
*  Total elapsed time (all runs):  0:00:00
*         Peak memory (this run):  0 GB
*        Pipeline completed time: 2023-02-08 15:44:57

```
