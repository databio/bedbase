# How to upload GEO data to bedbase

BEDboss provides geo submodule with functionality to upload GEO data to bedbase.

```
$ bedboss geo --help
                                                                                                                                                                                                                                    
 Usage: bedboss geo [OPTIONS] COMMAND [ARGS]...                                                                                                                                                                                     
                                                                                                                                                                                                                                    
 Automatic BEDbase uploader for GEO data                                                                                                                                                                                            
                                                                                                                                                                                                                                    
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ --version  -v        App version                                                                                                                                                                                                 │
│ --help               Show this message and exit.                                                                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─ Commands ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ upload-all   Run bedboss uploading pipeline for specified genome in specified period of time.                                                                                                                                    │
│ upload-gse   Run bedboss uploading pipeline for GSE.                                                                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

It has two main commands:

- 🟢 upload-all: Runs the BEDboss uploading pipeline for a specified genome within a given time period.

- 🟢 upload-gse: Uploads or reprocesses a specific GSE accession.

## How does it work?

- First, PEPhub automatically, every day (using a GitHub Actions cron job), uploads the metadata of GEO projects toEach PEP 
corresponds to a GEO project (GSE) with all samples containing narrowPeak, broadPeak, or BED files. 
These files are not quality-checked and may include incorrectly formatted files that users labeled as BED-like.
- Next, the GEO uploader retrieves all PEPs from PEPhub for a specific time period (e.g., the last month) or a specific GSE.
    1. `upload-all`: fetches all PEPs for the given time period.
    2. `upload-gse`: fetches a specific GSE.

Then, for each sample in the PEP, the bedboss-all function processes the files.

!!! info    
    BEDboss upload-all supports two upload modes:
    - **Full mode**: Downloads, upload and **processes** file if it can.
    - **Lite mode**: Downloads and uploads file if it can, but **does not process it**. 
        This mode is useful if you want to upload a large number of files quickly, and process them later.

    For reprocessing files, there is a separate command: `bedboss  reprocess-all` and `bedboss reprocess-one`.

- When a GSM (sample) is processed, it is flagged in the database as processed, so it will not be processed again in the future. 
In addition to the metadata from GEO, we also store the processing time and file digest in the database.
The same applies to GSEs (projects): if a GSE or PEP in PEPhub has been processed and the reprocess flag is not set, 
the project will not be processed again.

## Full CLI docs:

**_bedboss geo upload-all --help_**
```text
                                                                                                                      
 Usage: bedboss geo upload-all [OPTIONS]                                                                              
                                                                                                                      
 Run bedboss uploading pipeline for specified genome in specified period of time.                                     
                                                                                                                      
╭─ Options ──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config                               TEXT     Path to bedbase config file [default: None] [required]  │
│ *  --outfolder                                    TEXT     Path to output folder [default: None] [required]        │
│    --start-date                                   TEXT     The earliest date when opep was updated [Default:       │
│                                                            2000/01/01]                                             │
│                                                            [default: None]                                         │
│    --end-date                                     TEXT     The latest date when opep was updated [Default: today's │
│                                                            date]                                                   │
│                                                            [default: None]                                         │
│    --search-limit                                 INTEGER  Limit of projects to be searched. [Default: 50]         │
│                                                            [default: 50]                                           │
│    --search-offset                                INTEGER  Limit of projects to be searched. [Default: 0]          │
│                                                            [default: 0]                                            │
│    --download-limit                               INTEGER  Limit of projects to be downloaded [Default: 100]       │
│                                                            [default: 100]                                          │
│    --genome                                       TEXT     Reference genome [Default: None] (e.g. hg38) - if None, │
│                                                            all genomes will be processed                           │
│                                                            [default: None]                                         │
│    --preload             --no-preload                      Download bedfile before caching it. [Default: True]     │
│                                                            [default: preload]                                      │
│    --create-bedset       --no-create-bedset                Create bedset from bed files. [Default: True]           │
│                                                            [default: create-bedset]                                │
│    --overwrite           --no-overwrite                    Overwrite existing bedfiles. [Default: False]           │
│                                                            [default: no-overwrite]                                 │
│    --overwrite-bedset    --no-overwrite-bedset             Overwrite existing bedset. [Default: False]             │
│                                                            [default: overwrite-bedset]                             │
│    --rerun               --no-rerun                        Re-run all the samples. [Default: False]                │
│                                                            [default: no-rerun]                                     │
│    --run-skipped         --no-run-skipped                  Run skipped projects. [Default: False]                  │
│                                                            [default: run-skipped]                                  │
│    --run-failed          --no-run-failed                   Run failed projects. [Default: False]                   │
│                                                            [default: run-failed]                                   │
│    --standardize-pep     --no-standardize-pep              Standardize pep with BEDMESS. [Default: False]          │
│                                                            [default: no-standardize-pep]                           │
│    --use-skipper         --no-use-skipper                  Use skipper to skip projects if they were processed     │
│                                                            locally [Default: False]                                │
│                                                            [default: no-use-skipper]                               │
│    --reinit-skipper      --no-reinit-skipper               Reinitialize skipper. [Default: False]                  │
│                                                            [default: no-reinit-skipper]                            │
│    --lite                --no-lite                         Run the pipeline in lite mode. [Default: False]         │
│                                                            [default: no-lite]                                      │
│    --help                                                  Show this message and exit.                             │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

**_bedboss geo upload-gse --help_**
```text
 Usage: bedboss geo upload-gse [OPTIONS]                                                                              
                                                                                                                      
 Run bedboss uploading pipeline for GSE.                                                                              
                                                                                                                      
╭─ Options ──────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config                               TEXT  Path to bedbase config file [default: None] [required]     │
│ *  --outfolder                                    TEXT  Path to output folder [default: None] [required]           │
│ *  --gse                                          TEXT  GSE number that can be found in pephub. eg. GSE123456      │
│                                                         [default: None]                                            │
│                                                         [required]                                                 │
│    --create-bedset       --no-create-bedset             Create bedset from bed files. [Default: True]              │
│                                                         [default: create-bedset]                                   │
│    --genome                                       TEXT  reference genome to upload to database. If None, all       │
│                                                         genomes will be processed                                  │
│                                                         [default: None]                                            │
│    --preload             --no-preload                   Download bedfile before caching it. [Default: True]        │
│                                                         [default: preload]                                         │
│    --rerun               --no-rerun                     Re-run all the samples. [Default: False] [default: rerun]  │
│    --run-skipped         --no-run-skipped               Run skipped projects. [Default: False]                     │
│                                                         [default: run-skipped]                                     │
│    --run-failed          --no-run-failed                Run failed projects. [Default: False]                      │
│                                                         [default: run-failed]                                      │
│    --overwrite           --no-overwrite                 Overwrite existing bedfiles. [Default: False]              │
│                                                         [default: no-overwrite]                                    │
│    --overwrite-bedset    --no-overwrite-bedset          Overwrite existing bedset. [Default: False]                │
│                                                         [default: overwrite-bedset]                                │
│    --standardize-pep     --no-standardize-pep           Standardize pep with BEDMESS. [Default: False]             │
│                                                         [default: no-standardize-pep]                              │
│    --use-skipper         --no-use-skipper               Use local skipper to skip projects if they were processed  │
│                                                         locally [Default: False]                                   │
│                                                         [default: no-use-skipper]                                  │
│    --reinit-skipper      --no-reinit-skipper            Reinitialize skipper. [Default: False]                     │
│                                                         [default: no-reinit-skipper]                               │
│    --lite                --no-lite                      Run the pipeline in lite mode. [Default: False]            │
│                                                         [default: no-lite]                                         │
│    --help                                               Show this message and exit.                                │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```