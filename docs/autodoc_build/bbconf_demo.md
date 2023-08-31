jupyter:True
# `BedBaseConf` object usage demonstration

`bbconf` standardizes reporting of [bedstat](https://github.com/databio/bedstat) and [bedbuncher](https://github.com/databio/bedsbuncher) results. It formalizes a way for these pipelines and downstream tools communicate -- the produced results can easily and reliably become an
input for the server ([bedhost](https://github.com/databio/bedhost)). The object exposes API for interacting with the results and is backed by a [PostgreSQL](https://www.postgresql.org/) database.


`bbconf` provides a way to easily determine a path to the required configuration file. The file can be pointed to by the `$BEDBASE` environment variable. `get_bedbase_cfg` function returns a path which can be either excplicitly provided as an argument or read from the environment variable.


```python
import logmuse
logmuse.init_logger("bbconf", "DEBUG")
from bbconf import *

bbc = BedBaseConf(config_path="../tests/data/config.yaml")
```

```.output
DEBU 10:09:08 | bbconf:est:266 > Configured logger 'bbconf' using logmuse v0.2.6 

```

As you can see above, missing entries are populated with default values.

## Object contents

`BedBaseConf` objects consist of two [`PipestatManager`](http://pipestat.databio.org/) instances. These objects are responsible for bedfiles and bedsets metadata management.  Additionally, `BedBaseConf` maintains a "relationship table" that stores the information regarding the bedfile-bedset relationsips, i.e. which bedfile is a part of which bedset.

The `PipestatManager` instances for bedfiles and bedsets can be accessed via the object properties: `BedBaseConf.bed` and `BedBaseConf.bedset`, respectively:

### `BedBaseConf.bed`:


```python
print(bbc.bed)
```

```.output
PipestatManager (bedfiles)
Backend: PostgreSQL
Results schema source: /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/bbconf/schemas/bedfiles_schema.yaml
Status schema source: /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/pipestat/schemas/status_schema.yaml
Records count: 11

```

### `BedBaseConf.bedset`:


```python
print(bbc.bedset)
```

```.output
PipestatManager (bedsets)
Backend: PostgreSQL
Results schema source: /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/bbconf/schemas/bedsets_schema.yaml
Status schema source: /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/pipestat/schemas/status_schema.yaml
Records count: 3

```

### `BedBaseConf.config`:

Additionally, there's a `BedBaseConf.config` property, that can be used to retrieve the bedbase project configuration values, which include both ones declared in the configuration file and default ones:


```python
print(bbc.config)
```

```.output
database:
  name: pipestat-test
  user: postgres
  password: pipestat-password
  host: localhost
  port: 5432
path:
  pipeline_output_path: $BEDBASE_DATA_PATH/outputs
  bedstat_dir: bedstat_output
  bedbuncher_dir: bedbuncher_output
  remote_url_base: null
server:
  host: 0.0.0.0
  port: 8000

```

## Running a database

Before we start interacting with the database, we need to establish the connection. The required database information is sourced from the object itself. Obviously, the PostgreSQL database instance has to be launched before and running in the background. For example, to run the database in a Docker container, execute these two lines:

```
docker volume create postgres-data
docker run -d --name bedbase-postgres -p 5432:5432 -e POSTGRES_PASSWORD=bedbasepassword -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres -v postgres-data:/var/lib/postgresql/data postgres
```
The environment variables passed to the container need to match the settings in `BedBaseConf` object.

## Standardized metadata specification

`bbconf` package comes with a predefined schemas, that describe the required bed and bedset metadata including the identifiers and types. For example, name of the bedfile, that will be stored in the column `"name"`  has to be a string, whereas columns `"widths_histogram"` expects an image:


```python
print(bbc.bed.schema["name"])
print(bbc.bed.schema["widths_histogram"])
```

```.output
{'type': 'string', 'description': 'BED file name'}
{'type': 'image', 'description': 'Quantile-trimmed histogram of widths'}

```

A result of type `image` is in fact a mapping with three required elements: `path`, `thumbnail_path` and `title`. The actual jsonschema schemas can be accessed as `result_schemas` property for both tables:


```python
bbc.bed.result_schemas["widths_histogram"]
```




    {'type': 'object',
     'description': 'Quantile-trimmed histogram of widths',
     'properties': {'path': {'type': 'string'},
      'thumbnail_path': {'type': 'string'},
      'title': {'type': 'string'}},
     'required': ['path', 'thumbnail_path', 'title']}



## Convenient metadata management and exploration

Building on `PipestatManager`s `BedBaseConf` offers multiple methods for bedfile and bedset metadata management and exploration. Here are some examples:

### Get the number of reported bedfiles


```python
bbc.bed.record_count
```




    11



### Report metadata for a bedfile or bedset


```python
bbc.bed.report(record_identifier="78c0e4753d04b238fc07e4ebe5a02984", values={"name": "some_name"})
```

```.output
These results exist for '78c0e4753d04b238fc07e4ebe5a02984': ['name']

```




    False



Oops, `name` for this bedfile has been reported already. `BedBaseConf`, does not allow reporting results overwriting, unless it's explicitly forced with `force_overwrite=True`.

Let's try reporting a different value:


```python
bbc.bed.report(record_identifier="78c0e4753d04b238fc07e4ebe5a02984", values={"test": "some_value"})
```


    ---------------------------------------------------------------------------

    AssertionError                            Traceback (most recent call last)

    <ipython-input-9-932799b3747a> in <module>
    ----> 1 bbc.bed.report(record_identifier="78c0e4753d04b238fc07e4ebe5a02984", values={"test": "some_value"})
    

    /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/pipestat/pipestat.py in report(self, values, record_identifier, force_overwrite, strict_type, return_id)
        764             raise SchemaNotFoundError("report results")
        765         result_identifiers = list(values.keys())
    --> 766         self.assert_results_defined(results=result_identifiers)
        767         existing = self._check_which_results_exist(
        768             rid=record_identifier, results=result_identifiers)


    /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/pipestat/pipestat.py in assert_results_defined(self, results)
       1029         for r in results:
       1030             assert r in known_results, SchemaError(
    -> 1031                 f"'{r}' is not a known result. Results defined in the "
       1032                 f"schema are: {list(known_results)}.")
       1033 


    AssertionError: 'test' is not a known result. Results defined in the schema are: ['name', 'md5sum', 'bedfile', 'bigbedfile', 'regions_no', 'gc_content', 'mean_absolute_tss_dist', 'mean_region_width', 'exon_frequency', 'intron_frequency', 'promoterprox_frequency', 'intergenic_frequency', 'promotercore_frequency', 'fiveutr_frequency', 'threeutr_frequency', 'fiveutr_percentage', 'threeutr_percentage', 'promoterprox_percentage', 'exon_percentage', 'intron_percentage', 'intergenic_percentage', 'promotercore_percentage', 'tssdist', 'chrombins', 'gccontent', 'paritions', 'expected_partitions', 'cumulative_partitions', 'widths_histogram', 'neighbor_distances', 'open_chromatin', 'other'].


Oops, the result `test` is not allowed, since it hasn't been specified in the schema. Results that are allowed are prinded in the error message above.

Let's try reporting a new bedfile then:


```python
bbc.bed.report(record_identifier="78c1e4111d04b238fc11e4ebe5a02984", values={"name": "some_name"})
```

```.output
Reported records for '78c1e4111d04b238fc11e4ebe5a02984' in 'bedfiles' namespace:
 - name: some_name

```




    True



Success, the name for the bedfile identified by `78c1e4111d04b238fc11e4ebe5a02984` has been reported.

Therefore, we can retrieve this result:


```python
bbc.bed.retrieve(record_identifier="78c1e4111d04b238fc11e4ebe5a02984", result_identifier="name") 
```




    'some_name'



Or all the reported results:


```python
bbc.bed.retrieve(record_identifier="78c1e4111d04b238fc11e4ebe5a02984") 
```




    {'name': 'some_name'}



Naturally, a record can be removed:


```python
bbc.bed.remove(record_identifier="78c1e4111d04b238fc11e4ebe5a02984") 
```

```.output
Removing '78c1e4111d04b238fc11e4ebe5a02984' record

```




    True



### Report bedfile-bedset relationships

Another useful feature of `BedBaseConf` is conveninent many to many bedfile-bedset relationships handling. To report one use `BedBaseConf.report_relationship` method:


```python
bbc.report_relationship(bedfile_id=3, bedset_id=2)
```

Now we can select bedfiles that are part of a bedsets with name "bedsetOver1kRegions". Therefore they need to match the following query: `name='bedsetOver1kRegions'`. With `bedfile_col` argument we select the bedfile table columns we're interested in:


```python
bbc.select_bedfiles_for_bedset(condition="name=%s", condition_val=["bedsetOver1kRegions"], bedfile_col=["id", "name"])
```




    [[1, 'GSE105587_ENCFF018NNF_conservative_idr_thresholded_peaks_GRCh38'],
     [2, 'GSE105977_ENCFF617QGK_optimal_idr_thresholded_peaks_GRCh38'],
     [3, 'GSE105977_ENCFF793SZW_conservative_idr_thresholded_peaks_GRCh38'],
     [4, 'GSE105977_ENCFF937CGY_peaks_GRCh38'],
     [5, 'GSE91663_ENCFF316ASR_peaks_GRCh38'],
     [6, 'GSE91663_ENCFF319TPR_conservative_idr_thresholded_peaks_GRCh38'],
     [7, 'GSE91663_ENCFF553KIK_optimal_idr_thresholded_peaks_GRCh38'],
     [8, 'GSM2423312_ENCFF155HVK_peaks_GRCh38'],
     [9, 'GSM2423313_ENCFF722AOG_peaks_GRCh38'],
     [10, 'GSM2827349_ENCFF196DNQ_peaks_GRCh38'],
     [11, 'GSM2827350_ENCFF928JXU_peaks_GRCh38']]



The unwanted relationships can be removed with `BedBaseConf.remove_relationship` method:


```python
bbc.remove_relationship(bedfile_ids=[3], bedset_id=2)
```
