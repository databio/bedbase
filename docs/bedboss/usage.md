# Usage reference

BEDboss is command-line tool-manager and a set of tools for working with BED files and BEDbase. Main components of BEDboss are:
1) Pipelines for processing BED files: bedmaker, bedqc, and bedstats.
2) Indexing of the Bed files in bedbase
3) Managing bed and bedsets in the database

Here you can see the command-line usage instructions for the main bedboss command and for each subcommand:

## `bedboss --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss [OPTIONS] COMMAND [ARGS]...                                                                                                                                                                                             
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ --version             -v                                       App version                                                                                                                                                           │
│ --install-completion          [bash|zsh|fish|powershell|pwsh]  Install completion for the specified shell. [default: None]                                                                                                           │
│ --show-completion             [bash|zsh|fish|powershell|pwsh]  Show completion for the specified shell, to copy it or customize the installation. [default: None]                                                                    │
│ --help                                                         Show this message and exit.                                                                                                                                           │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─ Commands ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ check-requirements                              check installed R packages                                                                                                                                                           │
│ delete-bed                                      Delete bed from the bedbase database                                                                                                                                                 │
│ delete-bedset                                   Delete BedSet from the bedbase database                                                                                                                                              │
│ init-config                                     Initialize the new, sample configuration file                                                                                                                                        │
│ make-bed                                        Create a bed files form a [bigwig, bedgraph, bed, bigbed, wig] file                                                                                                                  │
│ make-bedset                                     Create a bedset from a pep file, and insert it to the bedbase database.                                                                                                              │
│ make-bigbed                                     Create a bigbed files form a bed file                                                                                                                                                │
│ reindex                                         Reindex the bedbase database and insert all files to the qdrant database.                                                                                                            │
│ run-all                                         Run all the bedboss pipeline for a single bed file                                                                                                                                   │
│ run-pep                                         Run the all bedboss pipeline for a bed files in a PEP                                                                                                                                │
│ run-qc                                          Run the quality control for a bed file                                                                                                                                               │
│ run-stats                                       Create the statistics for a single bed file.                                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss check-requirements --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss check-requirements [OPTIONS]                                                                                                                                                                                            
                                                                                                                                                                                                                                        
 check installed R packages                                                                                                                                                                                                             
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ --help          Show this message and exit.                                                                                                                                                                                          │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss delete-bed --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss delete-bed [OPTIONS]                                                                                                                                                                                                    
                                                                                                                                                                                                                                        
 Delete bed from the bedbase database                                                                                                                                                                                                   
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --sample-id        TEXT  Sample ID [default: None] [required]                                                                                                                                                                     │
│ *  --config           TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                                               │
│    --help                   Show this message and exit.                                                                                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss delete-bedset --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss delete-bedset [OPTIONS]                                                                                                                                                                                                 
                                                                                                                                                                                                                                        
 Delete BedSet from the bedbase database                                                                                                                                                                                                
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --identifier        TEXT  BedSet ID [default: None] [required]                                                                                                                                                                    │
│ *  --config            TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                                              │
│    --help                    Show this message and exit.                                                                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss init-config --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss init-config [OPTIONS]                                                                                                                                                                                                   
                                                                                                                                                                                                                                        
 Initialize the new, sample configuration file                                                                                                                                                                                          
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --outfolder        TEXT  Path to the output folder [default: None] [required]                                                                                                                                                     │
│    --help                   Show this message and exit.                                                                                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss make-bed --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss make-bed [OPTIONS]                                                                                                                                                                                                      
                                                                                                                                                                                                                                        
 Create a bed files form a [bigwig, bedgraph, bed, bigbed, wig] file                                                                                                                                                                    
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --input-file                        TEXT  Path to the input file [default: None] [required]                                                                                                                                       │
│ *  --input-type                        TEXT  Type of the input file. Options are: bigwig, bedgraph, bed, bigbed, wig [default: None] [required]                                                                                      │
│ *  --outfolder                         TEXT  Path to the output folder [default: None] [required]                                                                                                                                    │
│ *  --genome                            TEXT  Genome name. Example: 'hg38' [default: None] [required]                                                                                                                                 │
│    --rfg-config                        TEXT  Path to the rfg config file [default: None]                                                                                                                                             │
│    --narrowpeak     --no-narrowpeak          Is the input file a narrowpeak file? [default: no-narrowpeak]                                                                                                                           │
│    --chrom-sizes                       TEXT  Path to the chrom sizes file [default: None]                                                                                                                                            │
│    --multi          --no-multi               Run multiple samples [default: no-multi]                                                                                                                                                │
│    --recover        --no-recover             Recover from previous run [default: recover]                                                                                                                                            │
│    --dirty          --no-dirty               Run without removing existing files [default: no-dirty]                                                                                                                                 │
│    --help                                    Show this message and exit.                                                                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss make-bedset --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss make-bedset [OPTIONS]                                                                                                                                                                                                   
                                                                                                                                                                                                                                        
 Create a bedset from a pep file, and insert it to the bedbase database.                                                                                                                                                                
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --pep                                        TEXT  PEP file. Local or remote path [default: None] [required]                                                                                                                      │
│ *  --outfolder                                  TEXT  Path to the output folder [default: None] [required]                                                                                                                           │
│ *  --bedbase-config                             TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                     │
│ *  --bedset-name                                TEXT  Name of the bedset [default: None] [required]                                                                                                                                  │
│    --heavy              --no-heavy                    Run the heavy version of the pipeline [default: no-heavy]                                                                                                                      │
│    --force-overwrite    --no-force-overwrite          Force overwrite the output files [default: no-force-overwrite]                                                                                                                 │
│    --upload-s3          --no-upload-s3                Upload to S3 [default: no-upload-s3]                                                                                                                                           │
│    --upload-pephub      --no-upload-pephub            Upload to PEPHub [default: no-upload-pephub]                                                                                                                                   │
│    --no-fail            --no-no-fail                  Do not fail on error [default: no-no-fail]                                                                                                                                     │
│    --help                                             Show this message and exit.                                                                                                                                                    │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss make-bigbed --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss make-bigbed [OPTIONS]                                                                                                                                                                                                   
                                                                                                                                                                                                                                        
 Create a bigbed files form a bed file                                                                                                                                                                                                  
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-file                       TEXT  Path to the input file [default: None] [required]                                                                                                                                          │
│ *  --bed-type                       TEXT  bed type to be used for bigBed file generation 'bed{bedtype}+{n}' [Default: None] (e.g bed3+1) [default: None] [required]                                                                  │
│ *  --outfolder                      TEXT  Path to the output folder [default: None] [required]                                                                                                                                       │
│ *  --genome                         TEXT  Genome name. Example: 'hg38' [default: None] [required]                                                                                                                                    │
│    --rfg-config                     TEXT  Path to the rfg config file [default: None]                                                                                                                                                │
│    --chrom-sizes                    TEXT  Path to the chrom sizes file [default: None]                                                                                                                                               │
│    --multi          --no-multi            Run multiple samples [default: no-multi]                                                                                                                                                   │
│    --recover        --no-recover          Recover from previous run [default: recover]                                                                                                                                               │
│    --dirty          --no-dirty            Run without removing existing files [default: no-dirty]                                                                                                                                    │
│    --help                                 Show this message and exit.                                                                                                                                                                │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss reindex --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss reindex [OPTIONS]                                                                                                                                                                                                       
                                                                                                                                                                                                                                        
 Reindex the bedbase database and insert all files to the qdrant database.                                                                                                                                                              
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --bedbase-config        TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                                          │
│    --help                        Show this message and exit.                                                                                                                                                                         │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-all --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss run-all [OPTIONS]                                                                                                                                                                                                       
                                                                                                                                                                                                                                        
 Run all the bedboss pipeline for a single bed file                                                                                                                                                                                     
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --input-file                                    TEXT  Path to the input file [default: None] [required]                                                                                                                           │
│ *  --input-type                                    TEXT  Type of the input file. Options are: bigwig, bedgraph, bed, bigbed, wig [default: None] [required]                                                                          │
│ *  --outfolder                                     TEXT  Path to the output folder [default: None] [required]                                                                                                                        │
│ *  --genome                                        TEXT  Genome name. Example: 'hg38' [default: None] [required]                                                                                                                     │
│ *  --bedbase-config                                TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                  │
│    --rfg-config                                    TEXT  Path to the rfg config file [default: None]                                                                                                                                 │
│    --narrowpeak            --no-narrowpeak               Is the input file a narrowpeak file? [default: no-narrowpeak]                                                                                                               │
│    --check-qc              --no-check-qc                 Check the quality of the input file? [default: check-qc]                                                                                                                    │
│    --chrom-sizes                                   TEXT  Path to the chrom sizes file [default: None]                                                                                                                                │
│    --open-signal-matrix                            TEXT  Path to the open signal matrix file [default: None]                                                                                                                         │
│    --ensdb                                         TEXT  Path to the EnsDb database file [default: None]                                                                                                                             │
│    --just-db-commit        --no-just-db-commit           Just commit to the database? [default: no-just-db-commit]                                                                                                                   │
│    --force-overwrite       --no-force-overwrite          Force overwrite the output files [default: no-force-overwrite]                                                                                                              │
│    --upload-qdrant         --no-upload-qdrant            Upload to Qdrant [default: no-upload-qdrant]                                                                                                                                │
│    --upload-s3             --no-upload-s3                Upload to S3 [default: no-upload-s3]                                                                                                                                        │
│    --upload-pephub         --no-upload-pephub            Upload to PEPHub [default: no-upload-pephub]                                                                                                                                │
│    --multi                 --no-multi                    Run multiple samples [default: no-multi]                                                                                                                                    │
│    --recover               --no-recover                  Recover from previous run [default: recover]                                                                                                                                │
│    --dirty                 --no-dirty                    Run without removing existing files [default: no-dirty]                                                                                                                     │
│    --help                                                Show this message and exit.                                                                                                                                                 │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-pep --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss run-pep [OPTIONS]                                                                                                                                                                                                       
                                                                                                                                                                                                                                        
 Run the all bedboss pipeline for a bed files in a PEP                                                                                                                                                                                  
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --pep                                        TEXT  PEP file. Local or remote path [default: None] [required]                                                                                                                      │
│ *  --outfolder                                  TEXT  Path to the output folder [default: None] [required]                                                                                                                           │
│ *  --bedbase-config                             TEXT  Path to the bedbase config file [default: None] [required]                                                                                                                     │
│    --create-bedset      --no-create-bedset            Create a new bedset [default: no-create-bedset]                                                                                                                                │
│    --bedset-heavy       --no-bedset-heavy             Run the heavy version of the bedbuncher pipeline [default: no-bedset-heavy]                                                                                                    │
│    --bedset-id                                  TEXT  Bedset ID [default: None]                                                                                                                                                      │
│    --rfg-config                                 TEXT  Path to the rfg config file [default: None]                                                                                                                                    │
│    --check-qc           --no-check-qc                 Check the quality of the input file? [default: check-qc]                                                                                                                       │
│    --ensdb                                      TEXT  Path to the EnsDb database file [default: None]                                                                                                                                │
│    --just-db-commit     --no-just-db-commit           Just commit to the database? [default: no-just-db-commit]                                                                                                                      │
│    --force-overwrite    --no-force-overwrite          Force overwrite the output files [default: no-force-overwrite]                                                                                                                 │
│    --upload-qdrant      --no-upload-qdrant            Upload to Qdrant [default: no-upload-qdrant]                                                                                                                                   │
│    --upload-s3          --no-upload-s3                Upload to S3 [default: no-upload-s3]                                                                                                                                           │
│    --upload-pephub      --no-upload-pephub            Upload to PEPHub [default: no-upload-pephub]                                                                                                                                   │
│    --no-fail            --no-no-fail                  Do not fail on error [default: no-no-fail]                                                                                                                                     │
│    --multi              --no-multi                    Run multiple samples [default: no-multi]                                                                                                                                       │
│    --recover            --no-recover                  Recover from previous run [default: recover]                                                                                                                                   │
│    --dirty              --no-dirty                    Run without removing existing files [default: no-dirty]                                                                                                                        │
│    --help                                             Show this message and exit.                                                                                                                                                    │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-qc --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss run-qc [OPTIONS]                                                                                                                                                                                                        
                                                                                                                                                                                                                                        
 Run the quality control for a bed file                                                                                                                                                                                                 
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-file                             TEXT     Path to the bed file to check the quality control on. [default: None] [required]                                                                                                  │
│ *  --outfolder                            TEXT     Path to the output folder [default: None] [required]                                                                                                                              │
│    --max-file-size                        INTEGER  Maximum file size threshold to pass the quality [default: 2147483648]                                                                                                             │
│    --max-region-number                    INTEGER  Maximum number of regions threshold to pass the quality [default: 5000000]                                                                                                        │
│    --min-region-width                     INTEGER  Minimum region width threshold to pass the quality [default: 10]                                                                                                                  │
│    --multi                --no-multi               Run multiple samples [default: no-multi]                                                                                                                                          │
│    --recover              --no-recover             Recover from previous run [default: recover]                                                                                                                                      │
│    --dirty                --no-dirty               Run without removing existing files [default: no-dirty]                                                                                                                           │
│    --help                                          Show this message and exit.                                                                                                                                                       │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

## `bedboss run-stats --help`
```console
                                                                                                                                                                                                                                        
 Usage: bedboss run-stats [OPTIONS]                                                                                                                                                                                                     
                                                                                                                                                                                                                                        
 Create the statistics for a single bed file.                                                                                                                                                                                           
                                                                                                                                                                                                                                        
╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ *  --bed-file                                     TEXT  Path to the bed file [default: None] [required]                                                                                                                              │
│ *  --genome                                       TEXT  Genome name. Example: 'hg38' [default: None] [required]                                                                                                                      │
│ *  --outfolder                                    TEXT  Path to the output folder [default: None] [required]                                                                                                                         │
│    --ensdb                                        TEXT  Path to the EnsDb database file [default: None]                                                                                                                              │
│    --open-signal-matrix                           TEXT  Path to the open signal matrix file [default: None]                                                                                                                          │
│    --just-db-commit        --no-just-db-commit          Just commit to the database? [default: no-just-db-commit]                                                                                                                    │
│    --multi                 --no-multi                   Run multiple samples [default: no-multi]                                                                                                                                     │
│    --recover               --no-recover                 Recover from previous run [default: recover]                                                                                                                                 │
│    --dirty                 --no-dirty                   Run without removing existing files [default: no-dirty]                                                                                                                      │
│    --help                                               Show this message and exit.                                                                                                                                                  │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

```

