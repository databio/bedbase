# Bedbase configuration file documentation

In order to start working with the `BedBaseConf` object, it has to be initialized first. The constuctor requires one argument, which is a path to the configuration file (in YAML format).

## Minimal config file

The minimal configuration must define the `path` section with 3 keys:

- `pipeline_output_path`: path to the desired output directory for the pipelines
- `bedstat_dir`: name of the [bedstat](https://github.com/databio/bedstat) pipeline output directory
- `bedbuncher_dir`: name of the [bedbuncher](https://github.com/databio/bedbuncher) pipeline output directory

Here's an example of a minimal bedbase configuration file:


```python
!cat ../tests/data/config_min.yaml
```

    # min config example. Refer to bbconf/const.py for key names and default values
    
    path:
      pipeline_output_path:  $HOME/bedbase
      bedstat_dir: bedstat_output
      bedbuncher_dir: bedbuncher_output

## Example config file

Apart from the required `path` section, there are 2 other sections that can be used to configure the PostgreSQL database, used to store the metadata about the bedfiles and bedsets (`database` section) and to configure the bedhost server that displays the pipeline results and provides an API to query them (`server` section).

Here's an example of a complete bedbase configuration file:


```python
!cat ../tests/data/config.yaml
```

    database:
      name: pipestat-test
      user: postgres
      password: pipestat-password
      host: localhost
    #  port: 5432; intentionally commented out to test the defaults setting system
    path:
      pipeline_output_path: $BEDBASE_DATA_PATH/outputs
      bedstat_dir: bedstat_output
      bedbuncher_dir: bedbuncher_output
      remote_url_base: null
    server:
      host: 0.0.0.0
      port: 8000

## Default values

In case any of the values shown below is not provided in the configuration file, it will be set to a default value


```python
from bbconf.const import DEFAULT_SECTION_VALUES
from attmap import AttMap
AttMap(DEFAULT_SECTION_VALUES)
```




    AttMap
    path:
      remote_url_base: null
    database:
      user: postgres
      password: bedbasepassword
      name: postgres
      port: 5432
      host: localhost
    server:
      host: 0.0.0.0
      port: 80


