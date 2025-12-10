# How to upload BED files using PEP

### 1. Create PEP with BED files metadata
To upload BED files from PEP, first we should create a PEP project locally or on PEPhub.

PEP must include this fields in sample table:

- ✅ "sample_name"
- ✅ "input_file"
- ✅ "input_type"
- ✅ "genome"

ℹ️ All other fields are optional. Schema for PEP can be found [here](https://pephub.databio.org/schemas/databio/pipelines-bedboss)

ℹ️ All peps before their upload are validated against the schema using `eido` tool.

!!! example

    https://pephub.databio.org/khoroshevskyi/encode_batch_1

### 2. Make sure all paths or urls to input bed files are correct.

To complete this step, you should manually check that all paths or urls to input bed files are correct.

### 3. Run bedboss upload command:

```bash
bedboss run-pep --pep <path_to_pep> --outfolder <path_to_output_folder> --bedbase-config <path_to_bedbase_config>
```

???- "Full bedboss run-pep help"
    ```text
     bedboss run-pep --help
                                                                                                                                                                                                                                        
     Usage: bedboss run-pep [OPTIONS]                                                                                                                                                                                                   
                                                                                                                                                                                                                                        
     Run the all bedboss pipeline for a bed files in a PEP                                                                                                                                                                              
                                                                                                                                                                                                                                        
    ╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
    │ *  --pep                                        TEXT  PEP file. Local or remote path [default: None] [required]                                                                                                                  │
    │ *  --outfolder                                  TEXT  Path to the output folder [default: None] [required]                                                                                                                       │
    │ *  --bedbase-config                             TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                 │
    │    --create-bedset      --no-create-bedset            Create a new bedset [default: create-bedset]                                                                                                                               │
    │    --bedset-heavy       --no-bedset-heavy             Run the heavy version of the bedbuncher pipeline [default: no-bedset-heavy]                                                                                                │
    │    --bedset-id                                  TEXT  Bedset ID [default: None]                                                                                                                                                  │
    │    --rfg-config                                 TEXT  Path to the rfg config file [default: None]                                                                                                                                │
    │    --check-qc           --no-check-qc                 Check the quality of the input file? [default: check-qc]                                                                                                                   │
    │    --ensdb                                      TEXT  Path to the EnsDb database file [default: None]                                                                                                                            │
    │    --just-db-commit     --no-just-db-commit           Just commit to the database? [default: no-just-db-commit]                                                                                                                  │
    │    --force-overwrite    --no-force-overwrite          Force overwrite the output files [default: no-force-overwrite]                                                                                                             │
    │    --update             --no-update                   Update the bedbase database with the new record if it exists. This overwrites 'force_overwrite' option [default: no-update]                                                │
    │    --upload-qdrant      --no-upload-qdrant            Upload to Qdrant [default: upload-qdrant]                                                                                                                                  │
    │    --upload-s3          --no-upload-s3                Upload to S3 [default: upload-s3]                                                                                                                                          │
    │    --upload-pephub      --no-upload-pephub            Upload to PEPHub [default: upload-pephub]                                                                                                                                  │
    │    --no-fail            --no-no-fail                  Do not fail on error [default: no-no-fail]                                                                                                                                 │
    │    --license-id                                 TEXT  License ID [default: DUO:0000042]                                                                                                                                          │
    │    --standardize-pep    --no-standardize-pep          Standardize the PEP using bedMS [default: no-standardize-pep]                                                                                                              │
    │    --lite               --no-lite                     Run the pipeline in lite mode. [Default: False] [default: no-lite]                                                                                                         │
    │    --rerun              --no-rerun                    Rerun already processed samples [default: no-rerun]                                                                                                                        │
    │    --multi              --no-multi                    Run multiple samples [default: no-multi]                                                                                                                                   │
    │    --recover            --no-recover                  Recover from previous run [default: recover]                                                                                                                               │
    │    --dirty              --no-dirty                    Run without removing existing files [default: no-dirty]                                                                                                                    │
    │    --help                                             Show this message and exit.                                                                                                                                                │
    ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
    ```