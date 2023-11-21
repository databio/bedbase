# Bedbase

## Introduction

![Test BEDBASE stack](https://github.com/databio/bedbase/workflows/Test%20BEDBASE%20stack/badge.svg)

A project to aggregate, analyze, and serve genomic regions better (*aka* BED files).

## Tutorial

There's a tutorial for bedbase in the [docs_jupyter](/docs_jupyter) folder.


## Components

- ~~[bedqc](https://github.com/databio/bedqc): a pipeline for QC of BED files.~~ moved to bedboss
- ~~[bedmaker](http://github.com/databio/bedmaker): a pipeline to convert non-bed files into bed files~~ moved to bedboss
- ~~[bedstat](http://github.com/databio/bedstat): a pipeline to calculate stats for a bed file~~ moved to bedboss
- ~~[bedbuncher](http://github.com/databio/bedbuncher): a pipeline to create bedsets~~ moved to bedboss
- ~~[bedembed](https://github.com/databio/bedembed): a pipeline to create bed file embeddings~~ now part of geniml
- [bedboss](https://github.com/databio/bedboss): main bedbase processing pipeline, combining bedqc, bedmaker,and  bedstat
- [bbconf](http://github.com/databio/bbconf): bedbase configuration
- [bedhost](http://github.com/databio/bedhost): FastAPI application with API for accessing data
- [bedhost-ui](http://github.com/databio/bedhost-ui): front-end user interface built with React
- [bedbase.org repository](https://github.com/databio/bedbase.org): Repository for deploying the bedhost container to AWS.
- [all_geo_beds](all_geo_beds): a subfolder, is the scripts to download all bed files on GEO using geofetch and build a backend to host the metadata using bedstat

Not part of bedbase, but used by it:

- [geniml](https://github.com/databio/geniml):

## URLs

- bedbase.org - bedhost API server
- data.bedbase.org - file server that backs bedbase.org

