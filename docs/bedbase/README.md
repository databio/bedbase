![Test BEDBASE stack](https://github.com/databio/bedbase/workflows/Test%20BEDBASE%20stack/badge.svg)

# BEDbase


BEDbase is a unifying platform for aggregating, analyzing and serving genomic region data as BED files. Input files are processed by a series of Python pipelines. The output of these pipelines is displayed through a RESTful API where users can access BED files along with useful statistics and plots. A project to aggregate, analyze, and serve genomic regions better (*aka* BED files).

## Services

- API, production: <https://api.bedbase.org/>
- API, dev: <https://api-dev.bedbase.org/>
- Front-end, production: <https://bedbase.org> (alias <https://bedhost-ui.pages.dev/>)
- Front-end, dev: <https://dev.bedbase.org>
- Object store, production: <https://data2.bedbase.org/> - base URL for cloudflare/backblaze

## Tutorial

There's a tutorial for bedbase in the [docs_jupyter](/docs_jupyter) folder (probably outdated).

## Components

- [bedboss](https://github.com/databio/bedboss): Main BEDbase processing pipeline, combining bedqc, bedmaker, bedstat, and bedbuncher
- [bbconf](http://github.com/databio/bbconf): BEDbase configuration
- [bedhost](http://github.com/databio/bedhost): FastAPI application with API for accessing data
- [bedhost-ui](http://github.com/databio/bedhost-ui): Front-end user interface built with React
- [bedbase.org repository](https://github.com/databio/bedbase.org): Repository for deploying the bedhost container to AWS.
- [all_geo_beds](all_geo_beds): A subfolder, is the scripts to download all bed files on GEO using geofetch and build a backend to host the metadata using bedstat
- [geniml](https://github.com/databio/geniml): Machine learning for genomic intervals
