# All GEO BEDs

The goal of this project is to download all BED files currently hosted in GEO, so that we can eventually analyze and integrate them into a useful database and to demonstrate the power of region set enrichment analysis.

## Get a list of accessions

First we need a list of accessions that contain BED files. Search for "BED" in GEO DataSets, restrict to a species (human in this first example), and you will retrieve a list of more than 38,000 accessions that have BED-formatted data. You can save these results to file from the NCBI interface, which I have done: The GEO_BED file contains the search result of searching for "BED" in GEO, which returns a list of all GEO accessions that have BED as attached data sets.

These files have been placed in `$PROCESSED/bbbe`

```
cd $PROCESSED/bbbe
```

You can pull out just the accessions like this:

```
grep Accession GEO_BED_191202.txt | cut -d' ' -f2 | cut -f1 > GEO_GSM_191202.txt
```

This file is a list of GSE accession, with one row per accession. For a test, let's just choose the first 100 accessions:

```
head GEO_GSM_191202.txt -n 1000 > geo_bed_test.txt
```



## Grab metadata

Now, use geofetch to grab all the SOFT-formatted metadata:

For just the test samples:

```
geofetch -i geo_bed_test.txt --just-metadata
```

For everything:

```
geofetch -i GEO_GSM_191202.txt --just-metadata
```

## Grab actual data

For test examples

```
geofetch -i geo_bed_test.txt -p -g /project/shefflab/data/geo/geo_bed_test/ --filter '.*(bed|bigBed|narrowPeak).*'
```

```
geofetch -i GEO_GSM_191202.txt -p -g /project/shefflab/data/geo/geo_bed_test/
```

or, more completely:

```
geofetch -i /project/shefflab/bbbe/GEO_GSM_191202.txt -p -g /project/shefflab/data/geo/geo_bed_test/ --filter '.*(bed|bigBed|narrowPeak).*'
```


```
cd 
geofetch -i /project/shefflab/bbbe/GEO_GSM_191202.txt -p -g /project/shefflab/data/geo/geo_bed_test/ --filter '.*(bed|bigBed|narrowPeak).*'
```


## Syncing

Grab RAW.tar files from project backup to yeti. Remove the `-n` and the `| wc` to run for real.

Test:
```
rsync -rvn --include '*RAW.tar' --include='*/' --exclude="*" --ignore-existing /ext/qumulo/data/geo/geo_bed_test/ /ext/yeti/data/geo/geo_bed_test/  | wc
```

Run:
```
rsync -rv --include '*RAW.tar' --include='*/' --exclude="*" --ignore-existing /ext/qumulo/data/geo/geo
_bed_test/ /ext/yeti/data/geo/geo_bed_test/
```

Sync all non-RAW.tar files from yeti to project

Test:
```
rsync -rvn --exclude '*RAW.tar' --ignore-existing /ext/yeti/data/geo/geo_bed_test/ /project/shefflab/data/geo/geo_bed_test/ | wc
```

Run:
```
rsync -rv --exclude '*RAW.tar' --ignore-existing /ext/yeti/data/geo/geo_bed_test/ /project/shefflab/data/geo/geo_bed_test/
```

