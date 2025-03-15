## Bedboss run-pep

Bedboss insert is designed to process each sample in the provided PEP. 
The PEP can be provided either as a path to config file or as a registry path of the PEPhub.


### Step 1: Install all dependencies
 
First, you have to install bedboss and check if all requirements are satisfied. 
To do so, you can run the following command:
```bash
bedboss check-requirements
```
If requirements are not satisfied, you will see the list of missing packages.

### Step 2: Create bedconf.yaml file 
To run bedboss run-pep, you need to create a bedconf.yaml file with configuration. 
Detailed instructions are in the [configuration section](../../../bedbase/how-to-configure.md).

### Step 3: Create PEP with bed files.
BEDboss PEP should contain next fields: sample_name, input_file, input_type, genome.
Before running bedboss, you need to validate provided PEP with [bedboss_insert schema](https://schema.databio.org/?namespace=pipelines&schema=bedboss).
The easiest way to do so is to use [PEPhub](https://pephub.databio.org/), where you create a new PEP and validate it with the schema.
Example PEP: [https://pephub.databio.org/databio/excluderanges?tag=default](https://pephub.databio.org/databio/excluderanges?tag=default)

### Step 4: Run bedboss insert
To run bedboss insert , you need to run the next command:
```bash
bedboss insert \
    --bedbase-config bedconf.yaml \
    --pep path/to/pep.yaml \
    --outfolder path/to/output/dir
```

Above command will run bedboss on the bed file and create a file with statistics in the output directory. 
It contains only required parameters. For more details, please check the usage section.

By default, results will be uploaded only to the PostgreSQL database.

- To upload results to PEPhub, you need to make the `databio` org available on GitHub, then login to PEPhub, and add the `--upload-pephub` flag to the command.
- To upload results to Qdrant, you need to add the `--upload-qdrant` flag to the command.
- To upload actual files to S3, you need to add the `--upload-s3` flag to the command, and before uploading, you have to set up all necessary environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_ENDPOINT_URL.
- To create a bedset of provided pep files, you need to add the `--create-bedset` flag to the command.
- To ignore errors and continue processing, you need to add the `--no-fail` flag to the command.

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
    create_bedset=True, # optional
    no_fail=True, # optional
)
```