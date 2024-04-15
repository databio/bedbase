# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

# [0.5.1] - 2024-04-09
## Changed

- updated qdrant uploader
- bedset bedfile list query improvement
- other minor fixes in uploading

# [0.5.0] - 2024-04-08
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
