# Usage reference

BEDboss is command-line tool-warehouse of 3 pipelines for genomic interval files

BEDboss include: bedmaker, bedqc, bedstat. This pipelines can be run using next positional arguments:

- `bedbase all`:  Runs all pipelines one in order: bedmaker -> bedqc -> bedstat

- `bedbase insert`:  Runs all pipelines one in order by using PEP file and creates bedset: bedmaker -> bedqc -> bedstat -> bedbuncher

- `bedbase make`:  Creates Bed and BigBed files from  other type of genomic interval files [bigwig|bedgraph|bed|bigbed|wig]

- `bedbase qc`: Runs Quality control for bed file (Works only with bed files)

- `bedbase stat`: Runs statistics for bed and bigbed files.

- `bedbase bunch`: Creates bedset from PEP file

- `bedbase index`: Creates bed file vectors and inserts to qdrant database

Here you can see the command-line usage instructions for the main bedboss command and for each subcommand:

## `bedboss --help`
```console
version: 0.1.0a5
usage: bedboss [-h] [--version] [--silent] [--verbosity V] [--logdev]
               {all,insert,make,qc,stat,bunch,index} ...

Warehouse of pipelines for BED-like files: bedmaker, bedstat, and bedqc.

positional arguments:
  {all,insert,make,qc,stat,bunch,index}
    all                 Run all bedboss pipelines and insert data into bedbase
    insert              Run all bedboss pipelines using one PEP and insert
                        data into bedbase
    make                A pipeline to convert bed, bigbed, bigwig or bedgraph
                        files into bed and bigbed formats
    qc                  Run quality control on bed file (bedqc)
    stat                A pipeline to read a file in BED format and produce
                        metadata in JSON format.
    bunch               A pipeline to create bedsets (sets of BED files) that
                        will be retrieved from bedbase.
    index               Index not indexed bed files and add them to the qdrant
                        database

options:
  -h, --help            show this help message and exit
  --version             show program's version number and exit
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
```

## `bedboss all --help`
```console
usage: bedboss all [-h] --outfolder OUTFOLDER -s SAMPLE_NAME -f INPUT_FILE -t
                   INPUT_TYPE -g GENOME [-r RFG_CONFIG]
                   [--chrom-sizes CHROM_SIZES] [-n] [--standard-chrom]
                   [--check-qc] [--open-signal-matrix OPEN_SIGNAL_MATRIX]
                   [--ensdb ENSDB] --bedbase-config BEDBASE_CONFIG
                   [--treatment TREATMENT] [--cell-type CELL_TYPE]
                   [--description DESCRIPTION] [--no-db-commit]
                   [--just-db-commit] [--skip-qdrant] [-R] [-N] [-D] [-F] [-T]
                   [--silent] [--verbosity V] [--logdev]

options:
  -h, --help            show this help message and exit
  --outfolder OUTFOLDER
                        Pipeline output folder [Required]
  -s SAMPLE_NAME, --sample-name SAMPLE_NAME
                        name of the sample used to systematically build the
                        output name [Required]
  -f INPUT_FILE, --input-file INPUT_FILE
                        Input file [Required]
  -t INPUT_TYPE, --input-type INPUT_TYPE
                        Input type [Required] options:
                        (bigwig|bedgraph|bed|bigbed|wig)
  -g GENOME, --genome GENOME
                        reference genome (assembly) [Required]
  -r RFG_CONFIG, --rfg-config RFG_CONFIG
                        file path to the genome config file(refgenie)
  --chrom-sizes CHROM_SIZES
                        a full path to the chrom.sizes required for the
                        bedtobigbed conversion
  -n, --narrowpeak      whether it's a narrowpeak file
  --standard-chrom      Standardize chromosome names. Default: False
  --check-qc            Check quality control before processing data. Default:
                        True
  --open-signal-matrix OPEN_SIGNAL_MATRIX
                        a full path to the openSignalMatrix required for the
                        tissue specificity plots
  --ensdb ENSDB         A full path to the ensdb gtf file required for genomes
                        not in GDdata
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file [Required]
  --treatment TREATMENT
                        A treatment of the bed file
  --cell-type CELL_TYPE
                        A cell type of the bed file
  --description DESCRIPTION
                        A description of the bed file
  --no-db-commit        skip the JSON commit to the database
  --just-db-commit      just commit the JSON to the database
  --skip-qdrant         whether to skip qdrant indexing
  -R, --recover         Overwrite locks to recover from previous failed run
  -N, --new-start       Overwrite all results to start a fresh run
  -D, --dirty           Don't auto-delete intermediate files
  -F, --force-follow    Always run 'follow' commands
  -T, --testmode        Only print commands, don't run
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
```

## `bedboss insert --help`
```console
usage: bedboss insert [-h] --bedbase-config BEDBASE_CONFIG --pep PEP
                      --output-folder OUTPUT_FOLDER [-r RFG_CONFIG]
                      [--check-qc] [--standard-chrom] [--create-bedset]
                      [--skip-qdrant] [--ensdb ENSDB] [--no-db-commit]
                      [--just-db-commit] [--force_overwrite] [--upload-s3]
                      [-R] [-N] [-D] [-F] [-T] [--silent] [--verbosity V]
                      [--logdev]

options:
  -h, --help            show this help message and exit
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file [Required]
  --pep PEP             path to the pep file or pephub registry path
                        containing pep [Required]
  --output-folder OUTPUT_FOLDER
                        Pipeline output folder [Required]
  -r RFG_CONFIG, --rfg-config RFG_CONFIG
                        file path to the genome config file(refgenie)
  --check-qc            Check quality control before processing data. Default:
                        True
  --standard-chrom      Standardize chromosome names. Default: False
  --create-bedset       Create bedset using pep samples. Name of the bedset
                        will be based on pep name.Default: False
  --skip-qdrant         whether to skip qdrant indexing
  --ensdb ENSDB         A full path to the ensdb gtf file required for genomes
                        not in GDdata
  --no-db-commit        skip the JSON commit to the database
  --just-db-commit      just commit the JSON to the database
  --force_overwrite     Weather to overwrite existing records. [Default:
                        False]
  --upload-s3           Weather to upload bed, bigbed, and statistics to s3.
                        Before uploading you have to set up all necessury env
                        vars: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and
                        AWS_ENDPOINT_URL. [Default: False]
  -R, --recover         Overwrite locks to recover from previous failed run
  -N, --new-start       Overwrite all results to start a fresh run
  -D, --dirty           Don't auto-delete intermediate files
  -F, --force-follow    Always run 'follow' commands
  -T, --testmode        Only print commands, don't run
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
```

## `bedboss make --help`
```console
usage: bedboss make [-h] -f INPUT_FILE --outfolder OUTFOLDER [-n] -t
                    INPUT_TYPE -g GENOME [-r RFG_CONFIG] -o OUTPUT_BED
                    --output-bigbed OUTPUT_BIGBED -s SAMPLE_NAME
                    [--chrom-sizes CHROM_SIZES] [--standard-chrom] [-R] [-N]
                    [-D] [-F] [-T] [--silent] [--verbosity V] [--logdev]

options:
  -h, --help            show this help message and exit
  -f INPUT_FILE, --input-file INPUT_FILE
                        path to the input file [Required]
  --outfolder OUTFOLDER
                        Pipeline output folder [Required]
  -n, --narrowpeak      whether it's a narrowpeak file
  -t INPUT_TYPE, --input-type INPUT_TYPE
                        input file format (supported formats: bedGraph,
                        bigBed, bigWig, wig) [Required]
  -g GENOME, --genome GENOME
                        reference genome [Required]
  -r RFG_CONFIG, --rfg-config RFG_CONFIG
                        file path to the genome config file
  -o OUTPUT_BED, --output-bed OUTPUT_BED
                        path to the output BED files [Required]
  --output-bigbed OUTPUT_BIGBED
                        path to the folder of output bigBed files [Required]
  -s SAMPLE_NAME, --sample-name SAMPLE_NAME
                        name of the sample used to systematically build the
                        output name [Required]
  --chrom-sizes CHROM_SIZES
                        whether standardize chromosome names. If ture,
                        bedmaker will remove the regions on ChrUn chromosomes,
                        such as chrN_random and chrUn_random. [Default: False]
  --standard-chrom      Standardize chromosome names. Default: False
  -R, --recover         Overwrite locks to recover from previous failed run
  -N, --new-start       Overwrite all results to start a fresh run
  -D, --dirty           Don't auto-delete intermediate files
  -F, --force-follow    Always run 'follow' commands
  -T, --testmode        Only print commands, don't run
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
```

## `bedboss qc --help`
```console
usage: bedboss qc [-h] --bedfile BEDFILE --outfolder OUTFOLDER [-R] [-N] [-D]
                  [-F] [-T] [--silent] [--verbosity V] [--logdev]

options:
  -h, --help            show this help message and exit
  --bedfile BEDFILE     a full path to bed file to process [Required]
  --outfolder OUTFOLDER
                        a full path to output log folder. [Required]
  -R, --recover         Overwrite locks to recover from previous failed run
  -N, --new-start       Overwrite all results to start a fresh run
  -D, --dirty           Don't auto-delete intermediate files
  -F, --force-follow    Always run 'follow' commands
  -T, --testmode        Only print commands, don't run
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
```

## `bedboss stat --help`
```console
usage: bedboss stat [-h] --bedfile BEDFILE --outfolder OUTFOLDER
                    [--open-signal-matrix OPEN_SIGNAL_MATRIX] [--ensdb ENSDB]
                    [--bigbed BIGBED] --bedbase-config BEDBASE_CONFIG
                    [-y SAMPLE_YAML] --genome GENOME [--no-db-commit]
                    [--just-db-commit] [-R] [-N] [-D] [-F] [-T] [--silent]
                    [--verbosity V] [--logdev]

options:
  -h, --help            show this help message and exit
  --bedfile BEDFILE     a full path to bed file to process [Required]
  --outfolder OUTFOLDER
                        Pipeline output folder [Required]
  --open-signal-matrix OPEN_SIGNAL_MATRIX
                        a full path to the openSignalMatrix required for the
                        tissue specificity plots
  --ensdb ENSDB         a full path to the ensdb gtf file required for genomes
                        not in GDdata
  --bigbed BIGBED       a full path to the bigbed files
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file [Required]
  -y SAMPLE_YAML, --sample-yaml SAMPLE_YAML
                        a yaml config file with sample attributes to pass on
                        more metadata into the database
  --genome GENOME       genome assembly of the sample [Required]
  --no-db-commit        whether the JSON commit to the database should be
                        skipped
  --just-db-commit      whether just to commit the JSON to the database
  -R, --recover         Overwrite locks to recover from previous failed run
  -N, --new-start       Overwrite all results to start a fresh run
  -D, --dirty           Don't auto-delete intermediate files
  -F, --force-follow    Always run 'follow' commands
  -T, --testmode        Only print commands, don't run
  --silent              Silence logging. Overrides verbosity.
  --verbosity V         Set logging level (1-5 or logging module level name)
  --logdev              Expand content of logging message format.
```

## `bedboss bunch --help`
```console
usage: bedboss bunch [-h] --bedbase-config BEDBASE_CONFIG --bedset-name
                     BEDSET_NAME --bedset-pep BEDSET_PEP
                     [--base-api BEDBASE_API] [--cache-path CACHE_PATH]
                     [--heavy]

options:
  -h, --help            show this help message and exit
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file [Required]
  --bedset-name BEDSET_NAME
                        a name of the bedset [Required]
  --bedset-pep BEDSET_PEP
                        bedset pep path or pephub registry path containing
                        bedset pep [Required]
  --base-api BEDBASE_API
                        Bedbase API to use. Default is https://api.bedbase.org
  --cache-path CACHE_PATH
                        Path to the cache folder. Default is ./bedabse_cache
  --heavy               whether to use heavy processing (Calculate and crate
                        plots using R script).
```

## `bedboss index --help`
```console
usage: bedboss index [-h] --bedbase-config BEDBASE_CONFIG
                     [--bedbase-api BEDBASE_API]

options:
  -h, --help            show this help message and exit
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file [Required]
  --bedbase-api BEDBASE_API
                        URL of the Bedbase API [Default:
                        https://api.bedbase.org]
```

