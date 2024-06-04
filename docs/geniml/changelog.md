# Changelog

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html) and [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format. 

## [0.4.0] -- 2024-06-04

- Added bed tokens caching to bbclient [bbclient] Add tokenized file cache and download [#153](https://github.com/databio/geniml_dev/issues/153)
- Added pyBiocFileCache for bedfiles to support R caching [bbclient] Integrate bedbase caching with R [#151](https://github.com/databio/geniml_dev/issues/151)
- Added support of Python3.12
- Optimized encoding of regions for Region2Vec models
- Added updates to the new Atacformer
- Renamed tokenizers to TreeTokenizer and AnnDataTokenizer
- Bump genimtools which includes performance upgrades and stability updates to the tokenizers

## [0.3.0] -- 2024-04-04

- Added S3 uploading to bbclient
- Added and cleaned tests
- Added bed2bed search interface

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
