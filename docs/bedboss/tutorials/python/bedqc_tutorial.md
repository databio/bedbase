## BEDqc

BEDqc is a tool for quality control of BED files. 
As for now, it checks:
- maximum file size, 
- maximum number of regions, 
- minimum region width threshold

----
### Run BEDqc from command line
```bash
bedboss qc \
    --bed-file path/to/bedfile.bed \
    --outfolder path/to/output/dir
```

---

Run BEDqc from within Python
```python
from bedboss import bedqc

bedqc.run_bedqc(
    bedfile="path/to/bedfile.bed",
    outfolder="path/to/output/dir"
    max_file_size=1000000, # optional
    max_number_of_regions=1000, # optional
    min_region_width=10, # optional
)
```

If file won't pass the quality control, it will raise an error. and add this information to the log file.