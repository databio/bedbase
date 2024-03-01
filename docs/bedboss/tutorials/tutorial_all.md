## Bedboss all

Bedboss run-all is intended to run on sample (bed file) and run all bedboss pipelines:
 bedmaker (+ bedclassifier + bedqc) -> bedstat. After that optionally it can run bedbuncher, qdrant indexing and upload metadata to PEPhub.

### Step 1: Install all dependencies
 
First you have to install bedboss and check if all requirements are satisfied. 
To do so, you can run next command:
```bash
bedboss requirements-check
```
If requirements are not satisfied, you will see the list of missing packages.

### Step 2: Create bedconf.yaml file 
To run bedboss, you need to create a bedconf.yaml file with configuration. 
Detail instructions are in the configuration section.

### Step 3: Run bedboss
To run bedboss, you need to run the next command:
```bash
bedboss all \
    --bedbase-config bedconf.yaml \
    --input-file path/to/bedfile.bed \
    --output-dir path/to/output/dir \
    --input-type bed \
    --genome hg38 \
    
```

Above command will run bedboss on the bed file and create a bedstat file in the output directory.
It contains only required parameters. For more details, please check the usage section.

By default, results will be uploaded only to postgres database.
- To upload results to PEPhub, you need to make `databio` org available on GitHub, then login to PEPhub, and add `--upload-pephub` flag to the command.
- To upload results to Qdrant, you need to add `--upload-qdrant` flag to the command.
- To upload actual files to s3, you need to add `--upload-s3` flag to the command, and Before uploading you have to set up all necessary env vars: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_ENDPOINT_URL.


---

### Run bedboss all from within Python

To run bedboss all from within Python, instead of using the command line in the step #3, you can use the following code:

```python
from bedboss import bedboss

bedboss.run_all(
    sample_name="sample1",
    input_file="path/to/bedfile.bed",
    input_type="bed",
    outfolder="path/to/output/dir",
    genome="hg38",
    bedbase_config="bedconf.yaml",
    narrowpeak=False, # optional
    standardardize=True, # optional
    other_metadata=None, # optional
    upload_pephub=True, # optional
)
```