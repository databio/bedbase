# BEDbase Client

To interact with BEDbase, we provide a client that allows you to easily access and cache RegionSets (bed files) and 
BedSets (Collection of bed files) from the BEDbase, and local or remote (from url) files.
The client is designed to be user-friendly and efficient, making it easy to work with large datasets.

BBclient is both a command line interface (CLI), a Python API, R API and a Rust API.

BBClient currently available in `Geniml` python package and gtars rust package.

## 💿 Installation 

Installation documentation is available [Geniml installation](../../geniml/README.md).

## 🧪 Quick Start

#### Python
```python
from geniml.bbclient import BBClient

# Create a BBClient instance
bbclient = BBClient()

# download, cache and return a RegionSet object*
bedfile = bbclient.load_bed("233479aab145cffe46221475d5af5fae")
```
???- "Output"
    ```
    RegionSet with 51701 regions.
    ```


#### CLI
```bash
geniml bbclient cache-bed 233479aab145cffe46221475d5af5fae
geniml bbclient seek 233479aab145cffe46221475d5af5fae
```
???- "Output"
    ```
    BED file 233479aab145cffe46221475d5af5fae was downloaded and cached successfully
    /home/user/.bbcache/bedfiles/2/3/233479aab145cffe46221475d5af5fae.bed.gz

    ```

#### Rust
```rust
use gtars::bbclient::BBClient;

let mut bbc = BBClient::new(Some(cache_folder.clone()), None).expect("Failed to create BBClient");

let bed_id: String = bbc
            .add_local_bed_to_cache(PathBuf::from(_path/to.bed.gz), None)
            .unwrap();
```


!!! info 
    Full usage documentation is available [BBclient usage](../../geniml/bbclient/bbclient.md).


## 🧰 RegionSet

BBClient is based on RegionSet - representation of bed file in Python/Rust/R. It allows user to compute identifiers, save bed files, 
iterate through regions, and perform other operations on the BED file, such as compute statistics, overlaps and more.

How to install and use RegionSet in Python is described in the [RegionSet documentation](../../gtars/regionSet.md). 

🧪 Quick example:

```python
from gtars.models import RegionSet
rs = RegionSet("https://api.bedbase.org/v1/files/files/d/c/dcc005e8761ad5599545cc538f6a2a4d.bed.gz")
rs.identifier
```
???- "Output"
    ```
    'dcc005e8761ad5599545cc538f6a2a4d'
    ```
