# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

### [0.12.0] - 2025-09-11
### Added:
- New qdrant semantic search
- Added more plots to bedbase summary page
- New reference genome compatibility that supports new refgenie
- Genomes table, with ability of automatic updates from refgenie
- Added filter in search (Assay and genome)

### Changed:
- Improved reindexing methods

### Fixed:
- Issues in bedfile update method

### [0.11.4] - 2025-06-01
### Fixed:
- SQL search


### [0.11.3] - 2025-05-27
### Fixed:
- Usage tracker
- Order of comprehensive stats

### Added:
- Platform usage stats method
- Concise option in stats method


### [0.11.2] - 2025-06-22
### Added:
- Statistics about bed files grouped by organism

### [0.11.1] - 2025-05-22
### Fixed:
- Bedbuncher bug


## [0.11.0] - 2025-04-21
###  Added: 
- Added usage tracking and statistics
- Added platform comprehensive statistics
- Updated database to a new database schema
- Added new items for bed compliance
- Added head of bed file as a new column in bed table
- Added file digest column to the file table 
- Changed global sample and project source to be an array instead of string


## [0.10.4] - 2025-01-21

### Fixed:
- Changes boto3 [#78](https://github.com/databio/bbconf/issues/78)


## [0.10.3] - 2025-01-16

### Added:
- Added config analyzer
- Added new methods `get_missing_stats` and `get_missing_files` to retrieve lists of bed files that are missing statistics and files, respectively.

### Fixed:
- Fixed bugs in updating bed files


## [0.10.2] - 2025-01-09

### Changed:
- Updated version of zarr


## [0.10.1] - 2025-01-07

### Changed:
- Updated `geo_gsm_status` and `geo_gse_status` tables to include additional information.


## [0.10.0] - 2025-01-03

### Added:

* Added a new method `get_neighbours` in `bbconf/modules/bedfiles.py` to retrieve the nearest neighbors of a bed file from Qdrant.
* Added a new method `sql_search` in `bbconf/modules/bedfiles.py` for performing SQL exact searches on bed files.
* Added a new method `get_track_hub_file` in `bbconf/modules/bedsets.py` to generate track hub files for bedsets.
* Added `processed` for uploading bed files and bedsets
* Added `update` bedfile method

### Changed:
* Updated exception handling in the `create` method of `bbconf/modules/bedsets.py` to provide more specific error messages.

## [0.9.0] - 2024-11-07

### Changed
- Fixed bug with uploading tss dist plot

### Added
- Added annotations to bedsets (author, source)
- get_genome_list method to bedfiles, that lists all available genomes
- Added method that lists all missing plots for bedfiles (get_missing_plots)


## [0.8.0] - 2024-10-23
## Added:
- New text2vec search (bivec search)
- Added get_pep to bedset methods

## [0.7.1] - 2024-10-15

### Added:
- Added table with standardized bed annotation
- Added table with bed reference genome prediction values.

### Changed:
- Updated requirements

## [0.7.0] - 2024-09-20
### Added 
- Table and methods for reference genome validator
- Table with standard metadata schema
- Bed file opening improvements

## [0.6.1] - 2024-08-21
### Added 

- DB tables for GEO uploader status

## [0.6.0] - 2024-05-01
### Added

- Added tokenized files and universes.
- Added bed embedding get endpoint to the API #50
- Fixed test speed #48
- Added license for the bed files #51
- Added payloads to qdrant 
- Fixed search, and query results info
- Many other small bug fixes


## [0.5.1] - 2024-04-09
### Changed

- updated qdrant uploader
- bedset bedfile list query improvement
- other minor fixes in uploading

## [0.5.0] - 2024-04-08
### Changed

- Rebuild bbconf
- Introduced new DB schema
- Added bbagent that will be used to interact with the database
- Updated config schema
- Added new functionality to the bbagent
- New tests


## [0.4.2] - 2024-03-12
### Change
- Updated logger
- Updated requirements
- Added `upload_status` column to the `bedfile` table


## [0.4.1] - 2024-01-01
### Fix
- Requirements


## [0.4.0] - 2023-12-18
### Change
- bbconf to use pipestat v0.6.0 and SQLModel
- Fixed tests

### Added
- `qdrant` search, insert and update functionality
- functions that return results in the DRS format for both bed and bedhost. [DRS](https://ga4gh.github.io/data-repository-service-schemas/preview/release/drs-1.2.0/docs/)

## [0.3.0] - 2022-08-18
### Change
- update select_bedfiles_for_distance
- update database table schema

## [0.2.1] - 2021-11-11
### Fix
- attempt to fix database connection error

## [0.2.0] - 2021-10-25
**This release introduces backwards incompatible changes** 
### Changed
- switched to object-relational mapping approach (ORM) for database interface


## [0.1.1] - 2021-04-15
### Added
- added new fields in the bedfiles and bedsets schema

## [0.1.0] - 2021-02-22
**This release introduces backwards incompatible changes**
### Changed
- `BedBaseConf` backend (database) to [PostgreSQL](https://www.postgresql.org/)
- complete `BedBaseConf` class redesign

## [0.0.2] - 2020-05-28
### Added
- index deleting methods:
	- `delete_bedsets_index`
	- `delete_bedfiles_index`
- multiple new keys constants

### Changed
- make `search_bedfiles` and `search_bedsets` methods return all hits by default instead of just 10. Parametrize it.
- added more arguments to `insert_bedfiles_data` and `insert_bedsets_data` method interfaces: `doc_id` and `force_update`
- Elasticsearch documents are inserted into the indices more securily, `insert_*` methods prevent documents duplication


## [0.0.1] - 2020-02-05
### Added
- initial project release