# Command line interface reference

BEDboss is command-line tool-manager and a set of tools for working with BED files and BEDbase. Main components of BEDboss are: </br>
1) Pipeline for processing BED files: bedmaker, bedqc, and bedstats.</br>
2) Indexing of the Bed files in bedbase</br>
3) Managing bed and bedsets in the database</br>

Here you can see the command-line usage instructions for the main bedboss command and for each subcommand:

## `bedboss --help`
```console
                                                                                        
 Usage: bedboss [OPTIONS] COMMAND [ARGS]...                                             
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ --version             -v        App version                                          │
│ --install-completion            Install completion for the current shell.            │
│ --show-completion               Show completion for the current shell, to copy it or │
│                                 customize the installation.                          │
│ --help                          Show this message and exit.                          │
╰──────────────────────────────────────────────────────────────────────────────────────╯
╭─ Commands ───────────────────────────────────────────────────────────────────────────╮
│ run-all                Run all the bedboss pipeline for a single bed file            │
│ run-pep                Run the all bedboss pipeline for a bed files in a PEP         │
│ reprocess-all          Run unprocessed files, or reprocess them                      │
│ reprocess-one          Run unprocessed file, or reprocess it [Only 1 file]           │
│ reprocess-bedset       Reprocess a bedset                                            │
│ make-bed               Create a bed files form a [bigwig, bedgraph, bed, bigbed,     │
│                        wig] file                                                     │
│ make-bigbed            Create a bigbed files form a bed file                         │
│ run-qc                 Run the quality control for a bed file                        │
│ run-stats              Create the statistics for a single bed file.                  │
│ reindex                Reindex the bedbase database and insert all files to the      │
│                        qdrant database.                                              │
│ make-bedset            Create a bedset from a pep file, and insert it to the bedbase │
│                        database.                                                     │
│ init-config            Initialize the new, sample configuration file                 │
│ delete-bed             Delete bed from the bedbase database                          │
│ delete-bedset          Delete BedSet from the bedbase database                       │
│ tokenize-bed           Tokenize a bedfile                                            │
│ delete-tokenized       Delete tokenized bed file                                     │
│ convert-universe       Convert bed file to universe                                  │
│ check-requirements     Check installed R packages                                    │
│ install-requirements   Install R dependencies                                        │
│ verify-config          Verify configuration file                                     │
│ geo                    Automatic BEDbase uploader for GEO data                       │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss geo --help`
```console
                                                                                        
 Usage: bedboss geo [OPTIONS] COMMAND [ARGS]...                                         
                                                                                        
 Automatic BEDbase uploader for GEO data                                                
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ --version  -v        App version                                                     │
│ --help               Show this message and exit.                                     │
╰──────────────────────────────────────────────────────────────────────────────────────╯
╭─ Commands ───────────────────────────────────────────────────────────────────────────╮
│ upload-all   Run bedboss uploading pipeline for specified genome in specified period │
│              of time.                                                                │
│ upload-gse   Run bedboss uploading pipeline for GSE.                                 │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss geo upload-all --help`
```console
                                                                                        
 Usage: bedboss geo upload-all [OPTIONS]                                                
                                                                                        
 Run bedboss uploading pipeline for specified genome in specified period of time.       
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config                               TEXT     Path to bedbase config    │
│                                                            file                      │
│                                                            [default: None]           │
│                                                            [required]                │
│ *  --outfolder                                    TEXT     Path to output folder     │
│                                                            [default: None]           │
│                                                            [required]                │
│    --start-date                                   TEXT     The earliest date when    │
│                                                            opep was updated          │
│                                                            [Default: 2000/01/01]     │
│                                                            [default: None]           │
│    --end-date                                     TEXT     The latest date when opep │
│                                                            was updated [Default:     │
│                                                            today's date]             │
│                                                            [default: None]           │
│    --search-limit                                 INTEGER  Limit of projects to be   │
│                                                            searched. [Default: 50]   │
│                                                            [default: 50]             │
│    --search-offset                                INTEGER  Limit of projects to be   │
│                                                            searched. [Default: 0]    │
│                                                            [default: 0]              │
│    --download-limit                               INTEGER  Limit of projects to be   │
│                                                            downloaded [Default: 100] │
│                                                            [default: 100]            │
│    --genome                                       TEXT     Reference genome          │
│                                                            [Default: None] (e.g.     │
│                                                            hg38) - if None, all      │
│                                                            genomes will be processed │
│                                                            [default: None]           │
│    --preload             --no-preload                      Download bedfile before   │
│                                                            caching it. [Default:     │
│                                                            True]                     │
│                                                            [default: preload]        │
│    --create-bedset       --no-create-bedset                Create bedset from bed    │
│                                                            files. [Default: True]    │
│                                                            [default: create-bedset]  │
│    --overwrite           --no-overwrite                    Overwrite existing        │
│                                                            bedfiles. [Default:       │
│                                                            False]                    │
│                                                            [default: no-overwrite]   │
│    --overwrite-bedset    --no-overwrite-bedset             Overwrite existing        │
│                                                            bedset. [Default: False]  │
│                                                            [default:                 │
│                                                            overwrite-bedset]         │
│    --rerun               --no-rerun                        Re-run all the samples.   │
│                                                            [Default: False]          │
│                                                            [default: no-rerun]       │
│    --run-skipped         --no-run-skipped                  Run skipped projects.     │
│                                                            [Default: False]          │
│                                                            [default: run-skipped]    │
│    --run-failed          --no-run-failed                   Run failed projects.      │
│                                                            [Default: False]          │
│                                                            [default: run-failed]     │
│    --standardize-pep     --no-standardize-pep              Standardize pep with      │
│                                                            BEDMESS. [Default: False] │
│                                                            [default:                 │
│                                                            no-standardize-pep]       │
│    --use-skipper         --no-use-skipper                  Use skipper to skip       │
│                                                            projects if they were     │
│                                                            processed locally         │
│                                                            [Default: False]          │
│                                                            [default: no-use-skipper] │
│    --reinit-skipper      --no-reinit-skipper               Reinitialize skipper.     │
│                                                            [Default: False]          │
│                                                            [default:                 │
│                                                            no-reinit-skipper]        │
│    --lite                --no-lite                         Run the pipeline in lite  │
│                                                            mode. [Default: False]    │
│                                                            [default: no-lite]        │
│    --help                                                  Show this message and     │
│                                                            exit.                     │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss geo upload-gse --help`
```console
                                                                                        
 Usage: bedboss geo upload-gse [OPTIONS]                                                
                                                                                        
 Run bedboss uploading pipeline for GSE.                                                
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config                               TEXT  Path to bedbase config file  │
│                                                         [default: None]              │
│                                                         [required]                   │
│ *  --outfolder                                    TEXT  Path to output folder        │
│                                                         [default: None]              │
│                                                         [required]                   │
│ *  --gse                                          TEXT  GSE number that can be found │
│                                                         in pephub. eg. GSE123456     │
│                                                         [default: None]              │
│                                                         [required]                   │
│    --create-bedset       --no-create-bedset             Create bedset from bed       │
│                                                         files. [Default: True]       │
│                                                         [default: create-bedset]     │
│    --genome                                       TEXT  reference genome to upload   │
│                                                         to database. If None, all    │
│                                                         genomes will be processed    │
│                                                         [default: None]              │
│    --preload             --no-preload                   Download bedfile before      │
│                                                         caching it. [Default: True]  │
│                                                         [default: preload]           │
│    --rerun               --no-rerun                     Re-run all the samples.      │
│                                                         [Default: False]             │
│                                                         [default: rerun]             │
│    --run-skipped         --no-run-skipped               Run skipped projects.        │
│                                                         [Default: False]             │
│                                                         [default: run-skipped]       │
│    --run-failed          --no-run-failed                Run failed projects.         │
│                                                         [Default: False]             │
│                                                         [default: run-failed]        │
│    --overwrite           --no-overwrite                 Overwrite existing bedfiles. │
│                                                         [Default: False]             │
│                                                         [default: no-overwrite]      │
│    --overwrite-bedset    --no-overwrite-bedset          Overwrite existing bedset.   │
│                                                         [Default: False]             │
│                                                         [default: overwrite-bedset]  │
│    --standardize-pep     --no-standardize-pep           Standardize pep with         │
│                                                         BEDMESS. [Default: False]    │
│                                                         [default:                    │
│                                                         no-standardize-pep]          │
│    --use-skipper         --no-use-skipper               Use local skipper to skip    │
│                                                         projects if they were        │
│                                                         processed locally [Default:  │
│                                                         False]                       │
│                                                         [default: no-use-skipper]    │
│    --reinit-skipper      --no-reinit-skipper            Reinitialize skipper.        │
│                                                         [Default: False]             │
│                                                         [default: no-reinit-skipper] │
│    --lite                --no-lite                      Run the pipeline in lite     │
│                                                         mode. [Default: False]       │
│                                                         [default: no-lite]           │
│    --help                                               Show this message and exit.  │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-all --help`
```console
                                                                                        
 Usage: bedboss run-all [OPTIONS]                                                       
                                                                                        
 Run all the bedboss pipeline for a single bed file                                     
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --input-file                                    TEXT  Path to the input file      │
│                                                          [default: None]             │
│                                                          [required]                  │
│ *  --input-type                                    TEXT  Type of the input file.     │
│                                                          Options are: bigwig,        │
│                                                          bedgraph, bed, bigbed, wig  │
│                                                          [default: None]             │
│                                                          [required]                  │
│ *  --outfolder                                     TEXT  Path to the output folder   │
│                                                          [default: None]             │
│                                                          [required]                  │
│ *  --genome                                        TEXT  Genome name. Example:       │
│                                                          'hg38'                      │
│                                                          [default: None]             │
│                                                          [required]                  │
│ *  --bedbase-config                                TEXT  Path to the bedbase config  │
│                                                          file                        │
│                                                          [default: None]             │
│                                                          [required]                  │
│    --license-id                                    TEXT  License ID. If not provided │
│                                                          for in PEPfor each bed      │
│                                                          file, this license will be  │
│                                                          used                        │
│                                                          [default: DUO:0000042]      │
│    --rfg-config                                    TEXT  Path to the rfg config file │
│                                                          [default: None]             │
│    --narrowpeak            --no-narrowpeak               Is the input file a         │
│                                                          narrowpeak file?            │
│                                                          [default: no-narrowpeak]    │
│    --check-qc              --no-check-qc                 Check the quality of the    │
│                                                          input file?                 │
│                                                          [default: check-qc]         │
│    --chrom-sizes                                   TEXT  Path to the chrom sizes     │
│                                                          file                        │
│                                                          [default: None]             │
│    --open-signal-matrix                            TEXT  Path to the open signal     │
│                                                          matrix file                 │
│                                                          [default: None]             │
│    --ensdb                                         TEXT  Path to the EnsDb database  │
│                                                          file                        │
│                                                          [default: None]             │
│    --just-db-commit        --no-just-db-commit           Just commit to the          │
│                                                          database?                   │
│                                                          [default:                   │
│                                                          no-just-db-commit]          │
│    --force-overwrite       --no-force-overwrite          Force overwrite the output  │
│                                                          files                       │
│                                                          [default:                   │
│                                                          no-force-overwrite]         │
│    --update                --no-update                   Update the bedbase database │
│                                                          with the new record if it   │
│                                                          exists. This overwrites     │
│                                                          'force_overwrite' option    │
│                                                          [default: no-update]        │
│    --lite                  --no-lite                     Run the pipeline in lite    │
│                                                          mode. [Default: False]      │
│                                                          [default: no-lite]          │
│    --upload-qdrant         --no-upload-qdrant            Upload to Qdrant            │
│                                                          [default: no-upload-qdrant] │
│    --upload-s3             --no-upload-s3                Upload to S3                │
│                                                          [default: no-upload-s3]     │
│    --upload-pephub         --no-upload-pephub            Upload to PEPHub            │
│                                                          [default: no-upload-pephub] │
│    --universe              --no-universe                 Create a universe           │
│                                                          [default: no-universe]      │
│    --universe-method                               TEXT  Method used to create the   │
│                                                          universe                    │
│                                                          [default: None]             │
│    --universe-bedset                               TEXT  Bedset used used to create  │
│                                                          the universe                │
│                                                          [default: None]             │
│    --multi                 --no-multi                    Run multiple samples        │
│                                                          [default: no-multi]         │
│    --recover               --no-recover                  Recover from previous run   │
│                                                          [default: recover]          │
│    --dirty                 --no-dirty                    Run without removing        │
│                                                          existing files              │
│                                                          [default: no-dirty]         │
│    --help                                                Show this message and exit. │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-pep --help`
```console
                                                                                        
 Usage: bedboss run-pep [OPTIONS]                                                       
                                                                                        
 Run the all bedboss pipeline for a bed files in a PEP                                  
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --pep                                        TEXT  PEP file. Local or remote path │
│                                                       [default: None]                │
│                                                       [required]                     │
│ *  --outfolder                                  TEXT  Path to the output folder      │
│                                                       [default: None]                │
│                                                       [required]                     │
│ *  --bedbase-config                             TEXT  Path to the bedbase config     │
│                                                       file                           │
│                                                       [default: None]                │
│                                                       [required]                     │
│    --create-bedset      --no-create-bedset            Create a new bedset            │
│                                                       [default: create-bedset]       │
│    --bedset-heavy       --no-bedset-heavy             Run the heavy version of the   │
│                                                       bedbuncher pipeline            │
│                                                       [default: no-bedset-heavy]     │
│    --bedset-id                                  TEXT  Bedset ID [default: None]      │
│    --rfg-config                                 TEXT  Path to the rfg config file    │
│                                                       [default: None]                │
│    --check-qc           --no-check-qc                 Check the quality of the input │
│                                                       file?                          │
│                                                       [default: check-qc]            │
│    --ensdb                                      TEXT  Path to the EnsDb database     │
│                                                       file                           │
│                                                       [default: None]                │
│    --just-db-commit     --no-just-db-commit           Just commit to the database?   │
│                                                       [default: no-just-db-commit]   │
│    --force-overwrite    --no-force-overwrite          Force overwrite the output     │
│                                                       files                          │
│                                                       [default: no-force-overwrite]  │
│    --update             --no-update                   Update the bedbase database    │
│                                                       with the new record if it      │
│                                                       exists. This overwrites        │
│                                                       'force_overwrite' option       │
│                                                       [default: no-update]           │
│    --upload-qdrant      --no-upload-qdrant            Upload to Qdrant               │
│                                                       [default: upload-qdrant]       │
│    --upload-s3          --no-upload-s3                Upload to S3                   │
│                                                       [default: upload-s3]           │
│    --upload-pephub      --no-upload-pephub            Upload to PEPHub               │
│                                                       [default: upload-pephub]       │
│    --no-fail            --no-no-fail                  Do not fail on error           │
│                                                       [default: no-no-fail]          │
│    --license-id                                 TEXT  License ID                     │
│                                                       [default: DUO:0000042]         │
│    --standardize-pep    --no-standardize-pep          Standardize the PEP using      │
│                                                       bedMS                          │
│                                                       [default: no-standardize-pep]  │
│    --lite               --no-lite                     Run the pipeline in lite mode. │
│                                                       [Default: False]               │
│                                                       [default: no-lite]             │
│    --rerun              --no-rerun                    Rerun already processed        │
│                                                       samples                        │
│                                                       [default: no-rerun]            │
│    --multi              --no-multi                    Run multiple samples           │
│                                                       [default: no-multi]            │
│    --recover            --no-recover                  Recover from previous run      │
│                                                       [default: recover]             │
│    --dirty              --no-dirty                    Run without removing existing  │
│                                                       files                          │
│                                                       [default: no-dirty]            │
│    --help                                             Show this message and exit.    │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss reprocess-all --help`
```console
                                                                                        
 Usage: bedboss reprocess-all [OPTIONS]                                                 
                                                                                        
 Run unprocessed files, or reprocess them                                               
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config                    TEXT     Path to the bedbase config file      │
│                                                 [default: None]                      │
│                                                 [required]                           │
│ *  --outfolder                         TEXT     Path to the output folder            │
│                                                 [default: None]                      │
│                                                 [required]                           │
│    --limit                             INTEGER  Limit the number of files to         │
│                                                 reprocess                            │
│                                                 [default: 100]                       │
│    --no-fail           --no-no-fail             Do not fail on error                 │
│                                                 [default: no-fail]                   │
│    --help                                       Show this message and exit.          │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss reprocess-one --help`
```console
                                                                                        
 Usage: bedboss reprocess-one [OPTIONS]                                                 
                                                                                        
 Run unprocessed file, or reprocess it [Only 1 file]                                    
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config        TEXT  Path to the bedbase config file [default: None]     │
│                                  [required]                                          │
│ *  --outfolder             TEXT  Path to the output folder [default: None]           │
│                                  [required]                                          │
│ *  --identifier            TEXT  Identifier of the bed file [default: None]          │
│                                  [required]                                          │
│    --help                        Show this message and exit.                         │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss reprocess-bedset --help`
```console
                                                                                        
 Usage: bedboss reprocess-bedset [OPTIONS]                                              
                                                                                        
 Reprocess a bedset                                                                     
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config                    TEXT  Path to the bedbase config file         │
│                                              [default: None]                         │
│                                              [required]                              │
│ *  --outfolder                         TEXT  Path to the output folder               │
│                                              [default: None]                         │
│                                              [required]                              │
│ *  --identifier                        TEXT  Bedset ID [default: None] [required]    │
│    --no-fail           --no-no-fail          Do not fail on error [default: no-fail] │
│    --heavy             --no-heavy            Run the heavy version of the pipeline   │
│                                              [default: no-heavy]                     │
│    --help                                    Show this message and exit.             │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss make-bed --help`
```console
                                                                                        
 Usage: bedboss make-bed [OPTIONS]                                                      
                                                                                        
 Create a bed files form a [bigwig, bedgraph, bed, bigbed, wig] file                    
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --input-file                        TEXT  Path to the input file [default: None]  │
│                                              [required]                              │
│ *  --input-type                        TEXT  Type of the input file. Options are:    │
│                                              bigwig, bedgraph, bed, bigbed, wig      │
│                                              [default: None]                         │
│                                              [required]                              │
│ *  --outfolder                         TEXT  Path to the output folder               │
│                                              [default: None]                         │
│                                              [required]                              │
│ *  --genome                            TEXT  Genome name. Example: 'hg38'            │
│                                              [default: None]                         │
│                                              [required]                              │
│    --rfg-config                        TEXT  Path to the rfg config file             │
│                                              [default: None]                         │
│    --narrowpeak     --no-narrowpeak          Is the input file a narrowpeak file?    │
│                                              [default: no-narrowpeak]                │
│    --chrom-sizes                       TEXT  Path to the chrom sizes file            │
│                                              [default: None]                         │
│    --multi          --no-multi               Run multiple samples                    │
│                                              [default: no-multi]                     │
│    --recover        --no-recover             Recover from previous run               │
│                                              [default: recover]                      │
│    --dirty          --no-dirty               Run without removing existing files     │
│                                              [default: no-dirty]                     │
│    --help                                    Show this message and exit.             │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss make-bigbed --help`
```console
                                                                                        
 Usage: bedboss make-bigbed [OPTIONS]                                                   
                                                                                        
 Create a bigbed files form a bed file                                                  
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-file                       TEXT  Path to the input file [default: None]     │
│                                           [required]                                 │
│ *  --bed-type                       TEXT  bed type to be used for bigBed file        │
│                                           generation 'bed{bedtype}+{n}' [Default:    │
│                                           None] (e.g bed3+1)                         │
│                                           [default: None]                            │
│                                           [required]                                 │
│ *  --outfolder                      TEXT  Path to the output folder [default: None]  │
│                                           [required]                                 │
│ *  --genome                         TEXT  Genome name. Example: 'hg38'               │
│                                           [default: None]                            │
│                                           [required]                                 │
│    --rfg-config                     TEXT  Path to the rfg config file                │
│                                           [default: None]                            │
│    --chrom-sizes                    TEXT  Path to the chrom sizes file               │
│                                           [default: None]                            │
│    --multi          --no-multi            Run multiple samples [default: no-multi]   │
│    --recover        --no-recover          Recover from previous run                  │
│                                           [default: recover]                         │
│    --dirty          --no-dirty            Run without removing existing files        │
│                                           [default: no-dirty]                        │
│    --help                                 Show this message and exit.                │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-qc --help`
```console
                                                                                        
 Usage: bedboss run-qc [OPTIONS]                                                        
                                                                                        
 Run the quality control for a bed file                                                 
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-file                             TEXT     Path to the bed file to check the │
│                                                    quality control on.               │
│                                                    [default: None]                   │
│                                                    [required]                        │
│ *  --outfolder                            TEXT     Path to the output folder         │
│                                                    [default: None]                   │
│                                                    [required]                        │
│    --max-file-size                        INTEGER  Maximum file size threshold to    │
│                                                    pass the quality                  │
│                                                    [default: 2147483648]             │
│    --max-region-number                    INTEGER  Maximum number of regions         │
│                                                    threshold to pass the quality     │
│                                                    [default: 5000000]                │
│    --min-region-width                     INTEGER  Minimum region width threshold to │
│                                                    pass the quality                  │
│                                                    [default: 10]                     │
│    --multi                --no-multi               Run multiple samples              │
│                                                    [default: no-multi]               │
│    --recover              --no-recover             Recover from previous run         │
│                                                    [default: recover]                │
│    --dirty                --no-dirty               Run without removing existing     │
│                                                    files                             │
│                                                    [default: no-dirty]               │
│    --help                                          Show this message and exit.       │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-stats --help`
```console
                                                                                        
 Usage: bedboss run-stats [OPTIONS]                                                     
                                                                                        
 Create the statistics for a single bed file.                                           
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-file                                     TEXT  Path to the bed file         │
│                                                         [default: None]              │
│                                                         [required]                   │
│ *  --genome                                       TEXT  Genome name. Example: 'hg38' │
│                                                         [default: None]              │
│                                                         [required]                   │
│ *  --outfolder                                    TEXT  Path to the output folder    │
│                                                         [default: None]              │
│                                                         [required]                   │
│    --ensdb                                        TEXT  Path to the EnsDb database   │
│                                                         file                         │
│                                                         [default: None]              │
│    --open-signal-matrix                           TEXT  Path to the open signal      │
│                                                         matrix file                  │
│                                                         [default: None]              │
│    --just-db-commit        --no-just-db-commit          Just commit to the database? │
│                                                         [default: no-just-db-commit] │
│    --multi                 --no-multi                   Run multiple samples         │
│                                                         [default: no-multi]          │
│    --recover               --no-recover                 Recover from previous run    │
│                                                         [default: recover]           │
│    --dirty                 --no-dirty                   Run without removing         │
│                                                         existing files               │
│                                                         [default: no-dirty]          │
│    --help                                               Show this message and exit.  │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss reindex --help`
```console
                                                                                        
 Usage: bedboss reindex [OPTIONS]                                                       
                                                                                        
 Reindex the bedbase database and insert all files to the qdrant database.              
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config        TEXT  Path to the bedbase config file [default: None]     │
│                                  [required]                                          │
│    --help                        Show this message and exit.                         │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss make-bedset --help`
```console
                                                                                        
 Usage: bedboss make-bedset [OPTIONS]                                                   
                                                                                        
 Create a bedset from a pep file, and insert it to the bedbase database.                
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --pep                                        TEXT  PEP file. Local or remote path │
│                                                       [default: None]                │
│                                                       [required]                     │
│ *  --outfolder                                  TEXT  Path to the output folder      │
│                                                       [default: None]                │
│                                                       [required]                     │
│ *  --bedbase-config                             TEXT  Path to the bedbase config     │
│                                                       file                           │
│                                                       [default: None]                │
│                                                       [required]                     │
│ *  --bedset-name                                TEXT  Name of the bedset             │
│                                                       [default: None]                │
│                                                       [required]                     │
│    --heavy              --no-heavy                    Run the heavy version of the   │
│                                                       pipeline                       │
│                                                       [default: no-heavy]            │
│    --force-overwrite    --no-force-overwrite          Force overwrite the output     │
│                                                       files                          │
│                                                       [default: no-force-overwrite]  │
│    --upload-s3          --no-upload-s3                Upload to S3                   │
│                                                       [default: no-upload-s3]        │
│    --upload-pephub      --no-upload-pephub            Upload to PEPHub               │
│                                                       [default: no-upload-pephub]    │
│    --no-fail            --no-no-fail                  Do not fail on error           │
│                                                       [default: no-no-fail]          │
│    --help                                             Show this message and exit.    │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss init-config --help`
```console
                                                                                        
 Usage: bedboss init-config [OPTIONS]                                                   
                                                                                        
 Initialize the new, sample configuration file                                          
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --outfolder        TEXT  Path to the output folder [default: None] [required]     │
│    --help                   Show this message and exit.                              │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss delete-bed --help`
```console
                                                                                        
 Usage: bedboss delete-bed [OPTIONS]                                                    
                                                                                        
 Delete bed from the bedbase database                                                   
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --sample-id        TEXT  Sample ID [default: None] [required]                     │
│ *  --config           TEXT  Path to the bedbase config file [default: None]          │
│                             [required]                                               │
│    --help                   Show this message and exit.                              │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss delete-bedset --help`
```console
                                                                                        
 Usage: bedboss delete-bedset [OPTIONS]                                                 
                                                                                        
 Delete BedSet from the bedbase database                                                
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --identifier        TEXT  BedSet ID [default: None] [required]                    │
│ *  --config            TEXT  Path to the bedbase config file [default: None]         │
│                              [required]                                              │
│    --help                    Show this message and exit.                             │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss tokenize-bed --help`
```console
                                                                                        
 Usage: bedboss tokenize-bed [OPTIONS]                                                  
                                                                                        
 Tokenize a bedfile                                                                     
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-id                              TEXT  Path to the bed file [default: None]  │
│                                                [required]                            │
│ *  --universe-id                         TEXT  Universe ID [default: None]           │
│                                                [required]                            │
│    --cache-folder                        TEXT  Path to the cache folder              │
│                                                [default: None]                       │
│    --add-to-db         --no-add-to-db          Add the tokenized bed file to the     │
│                                                bedbase database                      │
│                                                [default: no-add-to-db]               │
│    --bedbase-config                      TEXT  Path to the bedbase config file       │
│                                                [default: None]                       │
│    --overwrite         --no-overwrite          Overwrite the existing tokenized bed  │
│                                                file                                  │
│                                                [default: no-overwrite]               │
│    --help                                      Show this message and exit.           │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss delete-tokenized --help`
```console
                                                                                        
 Usage: bedboss delete-tokenized [OPTIONS]                                              
                                                                                        
 Delete tokenized bed file                                                              
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --universe-id        TEXT  Universe ID [default: None] [required]                 │
│ *  --bed-id             TEXT  Bed ID [default: None] [required]                      │
│    --config             TEXT  Path to the bedbase config file [default: None]        │
│    --help                     Show this message and exit.                            │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss convert-universe --help`
```console
                                                                                        
 Usage: bedboss convert-universe [OPTIONS]                                              
                                                                                        
 Convert bed file to universe                                                           
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-id        TEXT  Path to the bed file [default: None] [required]             │
│ *  --config        TEXT  Path to the bedbase config file [default: None] [required]  │
│    --method        TEXT  Method used to create the universe [default: None]          │
│    --bedset        TEXT  Bedset used to create the universe [default: None]          │
│    --help                Show this message and exit.                                 │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss check-requirements --help`
```console
                                                                                        
 Usage: bedboss check-requirements [OPTIONS]                                            
                                                                                        
 Check installed R packages                                                             
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ --help          Show this message and exit.                                          │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss install-requirements --help`
```console
                                                                                        
 Usage: bedboss install-requirements [OPTIONS]                                          
                                                                                        
 Install R dependencies                                                                 
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ --help          Show this message and exit.                                          │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss verify-config --help`
```console
                                                                                        
 Usage: bedboss verify-config [OPTIONS]                                                 
                                                                                        
 Verify configuration file                                                              
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ *  --config        TEXT  Path to the bedbase config file [default: None] [required]  │
│    --help                Show this message and exit.                                 │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss get-commands --help`
```console
                                                                                        
 Usage: bedboss get-commands [OPTIONS]                                                  
                                                                                        
 Get available commands                                                                 
                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────╮
│ --help          Show this message and exit.                                          │
╰──────────────────────────────────────────────────────────────────────────────────────╯

```

