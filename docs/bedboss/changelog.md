# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

# [0.5.0] - 2025-01-16

## Added

- Added open_chromatin plot back into processing.
- Added gtrs dependency, that calculates gc content.
- Added skipper that automatically skips samples in pep that were already processed.
- Added lite functionality to main functions that allows to run uploading without using any heavy processing.
- Added function that will reprocess files, if they were unprocessed in the bedbase.
- Added function that predicts genome if genome wasn't provided.

## Fixes
- Important speed improvements.
- Improved requirements checker.
- Minor bug fixes.

# [0.4.1] - 2024-09-20
## Added
- Standardization of peps using bedbase bedms schema
- Reference validator module

## Fixed
- Pipeline failures (due to pipeline manager)
- Failure in cleaning temp files


# [0.4.0] - 2024-08-26
## Added
- Added bbuploader (GEO uploader)

# [0.3.0] - 2024-08-21
## Added
- Added classifier
- Added create universe uploader
- Added tokenization and token uploader

## Changes
- Updated efficiency of CLI help


# [0.2.1] - 2024-04-09
## Changed
- small naming tweaks

## Added
- added requirement check to cli


# [0.2.0] - 2024-04-08
## Changed
- moved all uploading functionality to the `bbconf` package

## Added
- added commands for indexing bedfiles
- added commands for deleting bedfiles and bedsets


## [0.1.0] - 2024-01-26
### Added
- Initial alpha release
