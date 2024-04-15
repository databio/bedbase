### BEDbuncher

Bedbuncher is used to create bedset of bed files in the bedbase database.

### 1) Create bedbase config file

How to create config file: [configuration section](../how-to-configure.md).


### 2) Create pep with bed file record identifiers.
To do so, you need to create a PEP with the following fields: sample_name (where sample_name is record_identifier), or `sample_name` + `record_identifier`
e.g. sample_table:

| sample_name | record_identifier |
|----------|----------|
| sample1 | asdf3215f34 |
| sample2 | a23452f34tf | 

### 3) Run bedboss bunch
#### From command line
```bash
bedboss bunch \
  --bedbase-config path/to/bedbase_config.yaml \
  --bedset-name bedset1 \
  --pep path/to/pep.yaml \
  --outfolder path/to/output/dir \
  --heavy \
  --upload-pephub \
  --upload-s3 
```

### Run bedboss bunch from within Python
```python
from bedboss.bedbuncher.bedbuncher import run_bedbuncher_form_pep

run_bedbuncher_form_pep(
    bedbase_config=bedbase_config,
    bedset_pep=pep,
    output_folder=outfolder,
    bedset_name=bedset_name,
    heavy=heavy,
    upload_pephub=upload_pephub,
    upload_s3=upload_s3,
    no_fail=no_fail,
    force_overwrite=force_overwrite,
    )
```