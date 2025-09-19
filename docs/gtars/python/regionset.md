# RegionSet

RegionSet is Python representation of a genomic region set, commonly named as BED file.


## 🧪 Quick example
```python

from gtars.models import RegionSet

# Create a RegionSet from a BED file
rs = RegionSet("https://data2.bedbase.org/files/d/a/dafd661aa70590999e0ff9e1980217db.bed.gz")

# Get identifier for the RegionSet
rs.identifier



```

### Main commands

- Load a BED file from local path or URL
```python
rs = RegionSet("path/to/bedfile.bed")
```
- Get number of regions
```python
len(rs)
```
- Calculate mean reagion width
```python
rs.mean_region_width()
```
- Get last base pair location for each chromosome
```python
rs.get_max_end_per_ch()
```
- Get number of base pairs in the region set
```python
rs.get_nucleotide_length()
```
- Save the regionSet as a BED file
```python
rs.to_bed("path/to/save/bedfile.bed")
rs.to_bed_gz("path/to/save/bedfile.bed.gz")  # gzipped
```
- Save the regionSet as a bigBed file
```python
rs.to_bigbed("path/to/save/bedfile.bb", chrom_sizes="path/to/chrom.sizes")
```