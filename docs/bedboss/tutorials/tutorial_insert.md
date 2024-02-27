## Bedboss insert 

Bedboss insert is intended to run each sample in provided PEP. 
PEP can be provided as a file or as a registry path of the PEPhub.


### Step 1: Install all dependencies
 
First you have to install bedboss and check if all requirements are satisfied. 
To do so, you can run next command:
```bash
bedboss requirements-check
```
If requirements are not satisfied, you will see the list of missing packages.

### Step 2: Create bedconf.yaml file 
To run bedboss insert, you need to create a bedconf.yaml file with configuration. 
Detail instructions are in the configuration section.

### Step 3: Create PEP with bed files.
BEDboss PEP should contain next fields: sample_name, input_file, input_type, genome.
Before running bedboss, you need to validate provided PEP with [bedboss_insert schema](https://schema.databio.org/?namespace=pipelines&schema=bedboss).
The easiest way to do so is to use [PEPhub](https://pephub.databio.org/), where you create a new PEP and validate it with the schema.
Example PEP: [https://pephub.databio.org/databio/excluderanges?tag=bedbase](https://pephub.databio.org/databio/excluderanges?tag=bedbase)

### Step 4: Run bedboss insert
To run bedboss insert , you need to run the next command:
```bash
bedboss insert \
    --bedbase-config bedconf.yaml \
    --pep path/to/pep.yaml \
    --output-folder path/to/output/dir
    
```

Above command will run bedboss on the bed file and create a bedstat file in the output directory.
It contains only required parameters. For more details, please check the usage section.

By default, results will be uploaded only to postgres database.
- To upload results to PEPhub, you need to make `databio` org available on GitHub, then login to PEPhub, and add `--upload-pephub` flag to the command.
- To upload results to Qdrant, you need to add `--upload-qdrant` flag to the command.
- To upload actual files to s3, you need to add `--upload-s3` flag to the command, and Before uploading you have to set up all necessary env vars: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_ENDPOINT_URL.
- To create bedset of provided pep files, you need to add `--create-bedset` flag to the command.


---

### Run bedboss insert from within Python

To run bedboss insert from within Python, instead of using the command line in the step #4, you can use the following code:

```python
from bedboss import bedboss

bedboss.insert_pep(
    bedbase_config="bedconf.yaml",
    pep="path/to/pep.yaml",
    output_folder="path/to/output/dir",
    upload_pephub=True, # optional
    upload_qdrant=True, # optional
    upload_s3=True, # optional
    create_bedset=True # optional
)
```