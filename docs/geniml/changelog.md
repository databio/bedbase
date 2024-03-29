# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format. 

## [0.2.1] -- 2024-03-25

- Added S3 uploading to bbclient
- Added and cleaned tests

## [0.2.0] -- 2024-02-20

- Fixed a bug with pydantic
- Integrate `lightning` for easier training of models with SLURM and the [DDP framework](https://pytorch.org/tutorials/intermediate/ddp_tutorial.html)
- New datasets for streaming `.gtok` files to models
- New tutorials for updated ScEmbed
- Start working on `Atacformer`

## [0.1.0] -- 2023-12-18

- First official released version of geniml
- Integrated bedshift 1.1.1 into geniml (excluding intersection support)


## [bedshift 1.1.1] - 2021-04-15

- Updated documentation
- Fixed dependencies packaging for building documentation

## [bedshift 1.1.0] - 2021-04-02

- Added ability to specify chrom sizes file, or refgenie genome.
- Add perturbation will create regions proportional to chromosome size
- Improve performance of perturbations
- Add --dropfile, --addfile, and --shiftfile options
- Add --add_valid option
- Add --yaml-config option
- Improved testing framework
- Improved logging messages

## [bedshift 1.0.0] - 2020-05-20

- Add, shift, drop, cut, and merge perturbations.
- Basic documentation
- Basic tests
