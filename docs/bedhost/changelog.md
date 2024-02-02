# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format. 

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
- `/bed/genomes` and `bedset/genomes`: impove speed

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
