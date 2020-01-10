# Bedbase

A project to aggregate, analyze, and serve genomic regions better (*aka* BED files).

Components:

 - [bedhost](http://github.com/databio/bedhost): a FastAPI application that hosts the web interface to the database
 - [bedstat](http://github.com/databio/bedstat): a pipeline to calculate stats for a bed file
 - [bedbuncher](http://github.com/databio/bedbuncher): a pipeline to create bedsets
 - [bedmaker](http://github.com/databio/bedmaker): a pipeline to convert non-bed files into bed files
 - [bbbe](bbbe): bedbase backend (bbbe), a subfolder, is the scripts to download all bed files on GEO using geofetch and build a backend to host the metadata using bedstat
