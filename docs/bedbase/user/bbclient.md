# BEDbase Client

To interact with BEDbase, we provide a client that allows you to easily access and cache RegionSets (bed files) and 
BedSets (Collection of bed files) from the BEDbase, and local or remote (from url) files.
The client is designed to be user-friendly and efficient, making it easy to work with large datasets.

BBclient is both a command line interface (CLI) and a Python API.

BBClient currently available in Geniml python package. 

## 💿 Installation 

Installation documentation is available [Geniml installation](../../geniml/README.md).

## 💻 Usage

Usage documentation is available [BBclient usage](../../geniml/bbclient/bbclient.md).

## 🧪 Examples

```python
from geniml.bbclient import BBClient

# Create a BBClient instance
bbclient = BBClient()

# download, cache and return a RegionSet object*
bedfile = bbclient.load_bed("233479aab145cffe46221475d5af5fae")
```

## 🧰 RegionSet

RegionSet is a Python/Rust/R representation of a BED file. It allows user to compute identifiers, save bed files, 
iterate through regions, and perform other operations on the BED file.

How to install and use RegionSet in Python is described in the [RegionSet documentation](../../gtars/python/regionset.md). 