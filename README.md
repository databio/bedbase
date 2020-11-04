# Bedbase

## Introduction

![Test BEDBASE stack](https://github.com/databio/bedbase/workflows/Test%20BEDBASE%20stack/badge.svg)

A project to aggregate, analyze, and serve genomic regions better (*aka* BED files).

## Tutorial

There's a tutorial for bedbase in the [docs_jupyter](/docs_jupyter) folder.


## Components

- [bedmaker](http://github.com/databio/bedmaker): a pipeline to convert non-bed files into bed files
- [bedstat](http://github.com/databio/bedstat): a pipeline to calculate stats for a bed file
- [bedbuncher](http://github.com/databio/bedbuncher): a pipeline to create bedsets
- [bbconf](http://github.com/databio/bbconf): bedbase configuration
- [bedhost](http://github.com/databio/bedhost): a FastAPI application that hosts the web interface to the database
- [bedhost-ui](http://github.com/databio/bedhost-ui):source files for bedhost user interface built with React
- [bedbase.org repository](https://github.com/databio/bedbase.org): Repository for deploying the bedhost container to AWS.
- [all_geo_beds](all_geo_beds): a subfolder, is the scripts to download all bed files on GEO using geofetch and build a backend to host the metadata using bedstat

## URLs

- bedbase.org - bedhost API server
- data.bedbase.org - file server that backs bedbase.org

