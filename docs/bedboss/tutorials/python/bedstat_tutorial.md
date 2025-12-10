# BEDstats

BEDstats is a tool that calculates the statistics of a BED file and provides plots to visualize the results.

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

---

### Step 1: Install all dependencies
 
First you have to install bedboss and check if all requirements are satisfied. 
To do so, you can run next command:
```bash
bedboss check-requirements
```
If requirements are not satisfied, you will see the list of missing packages.


### Step 2: Run bedstats

#### Run BEDstats from command line
```bash
bedboss stats \
    --bedfile path/to/bedfile.bed \
    --outfolder path/to/output/dir \
    --genome hg38 \
```

----
#### Run BEDstats from within Python
```python
from bedboss import bedstats

bedstat(
    bedfile="path/to/bedfile.bed",
    outfolder="path/to/output/dir",
    genome="hg19",
    )
```

After running BEDstats, you will find the following files in the output directory + all statistics will be saved in output file.