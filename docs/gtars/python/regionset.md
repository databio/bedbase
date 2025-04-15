# RegionSet


RegionSet is Python representation of a genomic region set.


## 🧪 Examples
```python

from gtars.models import RegionSet


# Create a RegionSet from a BED file
rs = RegionSet("https://data2.bedbase.org/files/d/a/dafd661aa70590999e0ff9e1980217db.bed.gz")

# Get identifier for the RegionSet
rs.identifier

# Get the number of regions in the RegionSet
len(rs)

# iterate over the regions in the RegionSet
regions_list = [region for region in rs]

```