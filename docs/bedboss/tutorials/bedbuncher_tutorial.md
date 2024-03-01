### BEDbuncher

Bedbuncher is used to create bedset of bed files in the bedbase database.

### 1) Create bedbase config file
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
  --bedset-pep bedset_pep.yaml \
  --cache-path CACHE_PATH
```

### Run bedboss bunch from within Python
```python

```