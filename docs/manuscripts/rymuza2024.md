# Methods for constructing and evaluating consensus genomic interval sets

Paper: [Manuscript at bioRxiv](http://dx.doi.org/10.1101/2023.08.03.551899) 


## Abstract

The amount of genomic region data continues to increase. Integrating across diverse genomic region sets requires consensus regions, which enable comparing regions across experiments, but also by necessity lose precision in region definitions. We require methods to assess this loss of precision and build optimal consensus region sets.

Here, we introduce the concept of *flexible intervals* and propose 3 novel methods for building consensus region sets, or universes: a coverage cutoff method, a likelihood method, and a Hidden Markov Model. We then propose 3 novel measures for evaluating how well a proposed universe fits a collection of region sets: a base-level overlap score, a region boundary distance score, and a likelihood score. We apply our methods and evaluation approaches to several collections of region sets and show how these methods can be used to evaluate fit of universes and build optimal universes. We describe scenarios where the common approach of merging regions to create consensus leads to undesirable outcomes and provide principled alternatives that provide interoperability of interval data while minimizing loss of resolution.

## Relevant tutorials

This paper published 2 types of method: 1. Methods to *construct* a universe, and 2. Methods to *evaluate* a universe.

### 1. Constructing a universe

You can construct a universe either on the command line, or using geniml as a library:

- [Create consensus peaks with CLI](../geniml/tutorials/create-consensus-peaks.md)
- [Create consensus peaks with Python](../geniml/code/create-consensus-peaks-python.md)

### 2. Evaluating a universe

The main methods are implemented in the `assess-universe` model with tutorial:

- [Assess universe fit tutorial](../geniml/tutorials/assess-universe.md)