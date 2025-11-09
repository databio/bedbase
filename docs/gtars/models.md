# Models and RegionSet objects in Gtars

Gtars has multiple objects (structs/models) for representation of genomic regions and other related data. 

### 🟢 Region

Region is Python representation of a genomic region. e.g. `chr1:100-200` + additional information.

#### Example

=== "Python"
    ```python
    from gtars.models import Region

    # Create a Region
    genomic_region = Region(chr="chr1", 
                             start=100, 
                             end=200, 
                             rest="peak1")
    print(genomic_region)

    ```

=== "Rust"
    ```rust
    use gtars::models::Region;
    
    // Create a Region
    let genomic_region: Region = Region { chr: "chr1".to_string(), 
                                          start: 100, 
                                          end: 200, 
                                          rest: Some("peak1".to_string()) 
                                        },
    let identifier = genomic_region.digest();

    println!("{:?}", identifier);
    
    ```


### 🟢 RegionSet

RegionSet is Python representation of a genomic region set, commonly named as BED file.


#### 🧪 Quick example
Open BED file from URL and get its identifier.

=== "Python"
    ```python
    
    from gtars.models import RegionSet
    
    # Create a RegionSet from a url, or lcoal BED file.
    rs = RegionSet("https://data2.bedbase.org/files/d/a/dafd661aa70590999e0ff9e1980217db.bed.gz")
    
    # Get identifier for the RegionSet
    rs.identifier
    
    print(rs)

    ```
=== "Rust"
    ```rust
    use gtars::models::RegionSet;
    
    // Create a RegionSet from a url, or lcoal BED file.
    let rs = RegionSet::try_from("https://data2.bedbase.org/files/d/a/dafd661aa70590999e0ff9e1980217db.bed.gz").unwrap();
    
    // Get identifier for the RegionSet
    let id = rs.identifier();

    println!("{:?}", rs);
    ```

❗ Note: RegionSet can be created from a local file path, URL, or by passing a list (vector) or Region objects.

#### Main commands in Python

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