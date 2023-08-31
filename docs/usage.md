# Usage reference

BEDboss is command-line tool-warehouse of 3 pipelines for genomic interval files

BEDboss include: bedmaker, bedqc, bedstat. This pipelines can be run using next positional arguments:

- `bedbase all`:  Runs all pipelines one in order: bedmaker -> bedqc -> bedstat

- `bedbase make`:  Creates Bed and BigBed files from  other type of genomic interval files [bigwig|bedgraph|bed|bigbed|wig]

- `bedbase qc`: Runs Quality control for bed file (Works only with bed files)

- `bedbase stat`: Runs statistics for bed and bigbed files.

Here you can see the command-line usage instructions for the main bedboss command and for each subcommand:

## `bedboss --help`
```console
version: 0.1.0
usage: bedboss [-h] [--version] {all,make,qc,stat} ...

Warehouse of pipelines for BED-like files: bedmaker, bedstat, and bedqc.

positional arguments:
  {all,make,qc,stat}
    all               Run all bedboss pipelines and insert data into bedbase
    make              A pipeline to convert bed, bigbed, bigwig or bedgraph
                      files into bed and bigbed formats
    qc                Run quality control on bed file (bedqc)
    stat              A pipeline to read a file in BED format and produce
                      metadata in JSON format.

options:
  -h, --help          show this help message and exit
  --version           show program's version number and exit
```

## `bedboss all --help`
```console
usage: bedboss all [-h] -s SAMPLE_NAME -f INPUT_FILE -t INPUT_TYPE -o
                   OUTPUT_FOLDER -g GENOME [-r RFG_CONFIG]
                   [--chrom-sizes CHROM_SIZES] [-n NARROWPEAK]
                   [--standard-chrom] [--check-qc]
                   [--open-signal-matrix OPEN_SIGNAL_MATRIX] [--ensdb ENSDB]
                   --bedbase-config BEDBASE_CONFIG [-y SAMPLE_YAML]
                   [--no-db-commit] [--just-db-commit]

options:
  -h, --help            show this help message and exit
  -s SAMPLE_NAME, --sample-name SAMPLE_NAME
                        name of the sample used to systematically build the
                        output name
  -f INPUT_FILE, --input-file INPUT_FILE
                        Input file
  -t INPUT_TYPE, --input-type INPUT_TYPE
                        Input type [required] options:
                        (bigwig|bedgraph|bed|bigbed|wig)
  -o OUTPUT_FOLDER, --output_folder OUTPUT_FOLDER
                        Output folder
  -g GENOME, --genome GENOME
                        reference genome (assembly)
  -r RFG_CONFIG, --rfg-config RFG_CONFIG
                        file path to the genome config file(refgenie)
  --chrom-sizes CHROM_SIZES
                        a full path to the chrom.sizes required for the
                        bedtobigbed conversion
  -n NARROWPEAK, --narrowpeak NARROWPEAK
                        whether the regions are narrow (transcription factor
                        implies narrow, histone mark implies broad peaks)
  --standard-chrom      Standardize chromosome names. Default: False
  --check-qc            Check quality control before processing data. Default:
                        True
  --open-signal-matrix OPEN_SIGNAL_MATRIX
                        a full path to the openSignalMatrix required for the
                        tissue specificity plots
  --ensdb ENSDB         A full path to the ensdb gtf file required for genomes
                        not in GDdata
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file
  -y SAMPLE_YAML, --sample-yaml SAMPLE_YAML
                        a yaml config file with sample attributes to pass on
                        more metadata into the database
  --no-db-commit        skip the JSON commit to the database
  --just-db-commit      just commit the JSON to the database
```

## `bedboss make --help`
```console
usage: bedboss make [-h] -f INPUT_FILE [-n NARROWPEAK] -t INPUT_TYPE -g GENOME
                    -r RFG_CONFIG -o OUTPUT_BED --output-bigbed OUTPUT_BIGBED
                    -s SAMPLE_NAME [--chrom-sizes CHROM_SIZES]
                    [--standard-chrom]

options:
  -h, --help            show this help message and exit
  -f INPUT_FILE, --input-file INPUT_FILE
                        path to the input file
  -n NARROWPEAK, --narrowpeak NARROWPEAK
                        whether the regions are narrow (transcription factor
                        implies narrow, histone mark implies broad peaks)
  -t INPUT_TYPE, --input-type INPUT_TYPE
                        a bigwig or a bedgraph file that will be converted
                        into BED format
  -g GENOME, --genome GENOME
                        reference genome
  -r RFG_CONFIG, --rfg-config RFG_CONFIG
                        file path to the genome config file
  -o OUTPUT_BED, --output-bed OUTPUT_BED
                        path to the output BED files
  --output-bigbed OUTPUT_BIGBED
                        path to the folder of output bigBed files
  -s SAMPLE_NAME, --sample-name SAMPLE_NAME
                        name of the sample used to systematically build the
                        output name
  --chrom-sizes CHROM_SIZES
                        a full path to the chrom.sizes required for the
                        bedtobigbed conversion
  --standard-chrom      Standardize chromosome names. Default: False
```

## `bedboss qc --help`
```console
usage: bedboss qc [-h] --bedfile BEDFILE --outfolder OUTFOLDER

options:
  -h, --help            show this help message and exit
  --bedfile BEDFILE     a full path to bed file to process
  --outfolder OUTFOLDER
                        a full path to output log folder.
```

## `bedboss stat --help`
```console
usage: bedboss stat [-h] --bedfile BEDFILE
                    [--open-signal-matrix OPEN_SIGNAL_MATRIX] [--ensdb ENSDB]
                    [--bigbed BIGBED] [--bedbase-config BEDBASE_CONFIG]
                    [-y SAMPLE_YAML] --genome GENOME_ASSEMBLY [--no-db-commit]
                    [--just-db-commit]

options:
  -h, --help            show this help message and exit
  --bedfile BEDFILE     a full path to bed file to process
  --open-signal-matrix OPEN_SIGNAL_MATRIX
                        a full path to the openSignalMatrix required for the
                        tissue specificity plots
  --ensdb ENSDB         a full path to the ensdb gtf file required for genomes
                        not in GDdata
  --bigbed BIGBED       a full path to the bigbed files
  --bedbase-config BEDBASE_CONFIG
                        a path to the bedbase configuration file
  -y SAMPLE_YAML, --sample-yaml SAMPLE_YAML
                        a yaml config file with sample attributes to pass on
                        more metadata into the database
  --genome GENOME_ASSEMBLY
                        genome assembly of the sample
  --no-db-commit        whether the JSON commit to the database should be
                        skipped
  --just-db-commit      whether just to commit the JSON to the database
```

