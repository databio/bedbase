# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format. 

## [0.12.0] -- 2025-12-01
### Added:
- umap calculation [API]
- BED-analyzer (qc), which is backed by gtars-wasm package [UI]
- New improved home page [UI]
- Added visualization of the UMAP, and interactive [UI]


## [0.11.0] -- 2025-09-11
### Added:
- Added umap visualizations of bed embeddings
- Added bedbase-verse metrics
- Added filtering by assay and genome in the semantic search
- Added bed file qc check before running bed to bed search

### Changed:
- Changed bivec search to text semantic search
- Multiple UI bug fix


## [0.10.0] -- 2025-04-21
### Added:
- Added usage statistics
- Added Bed file statistic page

### Changed:
- Updated bed compliance and data formats


## [0.9.0] -- 2025-01-03
### Added:
* Added a new class `CreateBEDsetRequest` in `bedhost/data_models.py` to handle BEDset creation requests.
* Introduced a new API endpoint `/v1/bed/{bed_id}/neighbours` to get nearest neighbors for a BED record in `bedhost/routers/bed_api.py`.
* Implemented a new API endpoint `/v1/bedset/create/` to create a new BEDset by providing a registry path to the PEPhub project in `bedhost/routers/bedset_api.py`.

### Changed:
* Refactored `text_to_bed_search` function to include additional logic for handling specific queries in `bedhost/routers/bed_api.py`.

### UI improvements:
* Added Most similar files table to bed page
* Improved Mobile friendly ui to both bed and bedset page
* Improved metadata tables on bed page
* Added `Download pdf` button for plots
* Improved search tables
* Added creation of bedset UI 


## [0.8.0] -- 2024-11-07

### Added:
- Added endpoint showing available genomes
- Added endpoint listing bed_ids with missing plots

## [0.7.0] -- 2024-10-23

### Added:
- New text2bed search (bivec search)
- Added track_hub endpoints and pointing link
- Added pep generating endpoint for bedsets

## [0.6.0] -- 2024-10-15

## [0.6.0] -- 2024-10-15

## [0.6.0] -- 2024-10-15

- Multiple ui improvements and fixes
- Updated bed metadata endpoint: added `annotation` to metadata return model, with standard schema
- Updated metadata in search endpoints.
- Added embed endpoint. [#136](https://github.com/databio/bedhost/issues/136)


## [0.5.0] -- 2024-06-11

- Improved Bed search (speed and quality)
- Added licenses
- UI tweaks
- Added universes and bed tokens to the database
- Added embedding endpoint

## [0.4.0] -- 2024-04-08

- Support of new bbconf.
- Updated endpoints.


## [0.3.0] -- 2023-03-01

- switch to pydantic2
- updated requirements
- updated docs


## [0.2.0] -- 2023-10-17
- remove all graphql
- remove local static hosting of UI
- update to new pipestat-based bbconf (pending)
- major refactor of API that introduces backwards-incompatible changes

## [0.1.3] -- 2023-09-01
- allow all origins

## [0.1.2] -- 2023-02-06
### change
- change `/bedset/my_bedset/file_paths`endpoint from GET to POST

## [0.1.1] -- 2021-10-30
### change
- `/bed/genomes` and `bedset/genomes`: improve speed

## [0.1.0] -- 2021-10-25
### add
- GraphQL endpoints
### change
- endpoints update due to `bbconf` and `pipestat` changes

## [0.0.6] -- 2021-05-17
### add
- Add endpoints that serve:
  - a list of genome assemblies in bedsets and bedfiles table
  - bed files by search term(s)
  - remote file path (http / s3)
  
## [0.0.5] -- 2021-04-15
### add
- Add examples of API endpoints
### fix
- resolve `/about` page not found when typing/editing url in the address bar. 

## [0.0.4] -- 2021-04-01
### add
- add endpoint for region-based query 
### fix
- constrauction of local file/img path

## [0.0.3] -- 2021-02-22
- Initial project release
