# DEMO of the bbconf module

`bbconf` is a configuration and management tool for BEDbase, facilitating the reading of configuration file,
setting up connections to PostgreSQL, PEPhub, S3, and Qdrant databases, managing file paths, and storing transformer models.

### Introduction

`bbconf` is divided into 2 main modules:
- `bbconf.config_parser` - reads the configuration file and sets up connections to databases. 
`BedBaseConfig` class is used to store the passwords, configuration, connection objects, and other information.

- `bbconf.modules` - contains modules for managing `bed_files`, `bedsets`, and other common functionalities.
Users will mainly use this module because it provides classes with methods for managing the database.

### Example:

#### 1) Init the `BedBaseAgent` class

```python
from bbconf.bbagent import BedBaseAgent

bbagent = BedBaseAgent(bbconf_file_path)
```
Where `bbconf_file_path` is the path to the configuration file. How to create a configuration file is described in the configuration section.

#### Upload a bedfile to the database

```python

    bbagent.bed.add(
        identifier=bed_metadata.bed_digest,
        stats=stats.model_dump(exclude_unset=True),
        metadata=other_metadata,
        plots=plots.model_dump(exclude_unset=True),
        files=files.model_dump(exclude_unset=True),
        classification=classification.model_dump(exclude_unset=True),
        upload_qdrant=upload_qdrant,
        upload_pephub=upload_pephub,
        upload_s3=upload_s3,
        local_path=outfolder,
        overwrite=force_overwrite,
        nofail=True,
    )
```

#### Get a bedfile from the database

```python
bed = bbagent.bed.get(identifier=bed_id, full=True,)
```

#### Get a bedset from the database

```python
bedset = bbagent.bedset.get(identifier=bedset_id, full=True,)
```

#### User can access credentials and other configurations from the `BedBaseConfig` class

e.g. to get pephub namespace used in config you can use the following code:

```python
bbagent.config._config["pephub"]["namespace"]
```


Full API of bbconf can be found [here](./bbc_api.md)