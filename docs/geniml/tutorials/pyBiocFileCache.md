# How to use bbclient cache in R

The bbclient caching system is supported in both Python and R. 
Both of these caching systems are compatible with `BiocFileCache` for BED files and `Zarr` with BED tokens.


## Bed caching

### Step 1: Cache BED File Using bbclient CLI
```terminal
geniml bbclient cache-bed bbad85f21962bb8d972444f7f9a3a932
```

The cached file is saved in the default bbclient cache folder, or a user-provided cache folder. 
Since we didn't provide a caching folder, the default folder will be in our home directory.

### Step 2: Get Path to the BED File Using Python

#### a. Using bbclient in Python

Here's an example of how you can retrieve the path to the BED file in Python:
```python
from geniml.bbclient import BBClient

bbc = BBClient()
print(bbc.seek("bbad85f21962bb8d972444f7f9a3a932"))
```

And it will print path to our file:
```text
'/home/bnt4me/.bbcache/bedfiles/b/b/bbad85f21962bb8d972444f7f9a3a932.bed.gz'
```

b. Using pyBiocFileCache

```python
import os

from pybiocfilecache import BiocFileCache

# get cache folder
bbcache_folder = os.path.join(os.path.expanduser("~"), ".bbcache")

# get bedfile cache folder 
bedfile_cache_folder = os.path.join(bbcache_folder, "bedfiles")

bio_cache = BiocFileCache(bedfile_cache_folder)

bed_cache_obj = bio_cache.get("bbad85f21962bb8d972444f7f9a3a932")

print(bed_cache_obj.fpath)
```
And it will print path to our file:
```text
'/home/bnt4me/.bbcache/bedfiles/b/b/bbad85f21962bb8d972444f7f9a3a932.bed.gz'
```

3. Get path using R caching system - BiocFileCache

```R
# Install necessary package
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install("BiocFileCache")

# Load necessary libraries
library(BiocFileCache)

# Get cache folder
bbcache_folder <- file.path(Sys.getenv("HOME"), ".bbcache")

# Get bedfile cache folder
bedfile_cache_folder <- file.path(bbcache_folder, "bedfiles")

# Create a BiocFileCache object
bio_cache <- BiocFileCache(bedfile_cache_folder)

# Get the cached file using the identifier
bed_cache_obj <- bfcrpath(bio_cache, "bbad85f21962bb8d972444f7f9a3a932")

# Print the file path
print(bed_cache_obj)
```
And we will get this message printed:
```text
[1] "/home/bnt4me/.bbcache/bedfiles/b/b/bbad85f21962bb8d972444f7f9a3a932.bed.gz"
```


This R script will perform the same tasks as the Python script: handling the cache and retrieving the specified BED file from the cache.

By following these steps, you can efficiently manage and retrieve cached BED files using the bbclient caching system in both Python and R.

P.S. All links will be different on your machine, as they are generated based on your local home directory.

____


## Zarr caching

### Step 1: Cache Zarr File Using bbclient CLI


### 🚧 Tutorial in progress! Stay tuned for updates. We're working hard to bring you valuable content soon!