# BEDbase Client

To interact with BEDbase, we provide a client that allows you to easily access and cache RegionSets (bed files) and 
BedSets (Collection of bed files) from the BEDbase, and local or remote (from url) files.
The client is designed to be user-friendly and efficient, making it easy to work with large datasets.

BBclient is both a command line interface (CLI), a Python API and a Rust API.

BBClient currently available in Geniml python package and gtars rust package.

## 💿 Installation 

Installation documentation is available [Geniml installation](../../geniml/README.md).

## 🧪 Examples


#### Python
```python
from geniml.bbclient import BBClient

# Create a BBClient instance
bbclient = BBClient()

# download, cache and return a RegionSet object*
bedfile = bbclient.load_bed("233479aab145cffe46221475d5af5fae")
```


#### CLI
```bash
geniml bbclient cache-bed 233479aab145cffe46221475d5af5fae

geniml bbclient seek 233479aab145cffe46221475d5af5fae
```


#### Rust
```rust
use gtars::bbclient::BBClient;

let mut bbc = BBClient::new(Some(cache_folder.clone()), None).expect("Failed to create BBClient");

let bed_id: String = bbc
            .add_local_bed_to_cache(PathBuf::from(_path/to.bed.gz), None)
            .unwrap();
```
Full usage documentation is available in the Usage documentation is available [BBclient usage](../../geniml/bbclient/bbclient.md).


## 🧰 RegionSet

RegionSet is a Python/Rust/R representation of a BED file. It allows user to compute identifiers, save bed files, 
iterate through regions, and perform other operations on the BED file.

How to install and use RegionSet in Python is described in the [RegionSet documentation](../../gtars/models.md). 

Quick example:

```python
from gtars.models import RegionSet
rs = RegionSet("https://api.bedbase.org/v1/files/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz")
rs.identifier
```
