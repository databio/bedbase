<p align="center">
<h1><img align="center" src="../img/bedbase_logo.svg" class="img-header" height="100"></h1>
</p>

BEDbase is a unifying platform for aggregating, analyzing and serving genomic region data as BED files. Input files are processed by a series of Python pipelines. The output of these pipelines is displayed through a RESTful API where users can access BED files along with useful statistics and plots.

## 🛰️ Services

---
**Deployed public instance**: <a href="https://bedbase.org/" target="_blank">https://bedbase.org/</a>

**API**: <a href="https://api.bedbase.org/" target="_blank">https://api.bedbase.org/</a>

**API dev**: <a href="https://dev.bedbase.org/" target="_blank">https://api-dev.bedbase.org/</a>

**UI**: <a href="https://bedbase.org/" target="_blank">https://bedbase.org/</a>

**UI dev**: <a href="https://dev.bedhost.pages.dev/" target="_blank">https://dev.bedhost.pages.dev/</a>

**Source Code**: <a href="https://github.com/databio/bedhost/" target="_blank">https://github.com/databio/bedhost/</a>

**Object store, production** <https://data2.bedbase.org/> - base URL for cloudflare/backblaze

## 🗃️ Components

- [bedboss](https://github.com/databio/bedboss): Main BEDbase processing pipeline and managing tool, combining bedmaker, bedstat, bedbuncher, and other pipelines
- [bbconf](http://github.com/databio/bbconf): BEDbase configuration package (core of the BEDbase stack)
- [bedhost](http://github.com/databio/bedhost): FastAPI application with API for accessing data
- [bedhost-ui](http://github.com/databio/bedhost): Front-end user interface built with React
- [bedbase.org repository](https://github.com/databio/bedbase.org): Repository for deploying the bedhost container to AWS.
- [all_geo_beds](all_geo_beds): A subfolder, is the scripts to download all bed files on GEO using geofetch and build a backend to host the metadata using bedstat
- [geniml](https://github.com/databio/geniml): Machine learning for genomic intervals
