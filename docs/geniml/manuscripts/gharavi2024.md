# Joint representation learning for retrieval and annotation of genomic interval sets

Paper: [Manuscript at *Bioengineering*](https://dx.doi.org/10.3390/bioengineering11030263) 

## Abstract

As available genomic interval data increase in scale, we require fast systems to search them. A common approach is simple string matching to compare a search term to metadata, but this is limited by incomplete or inaccurate annotations. An alternative is to compare data directly through genomic region overlap analysis, but this approach leads to challenges like sparsity, high dimensionality, and computational expense. We require novel methods to quickly and flexibly query large, messy genomic interval databases. Here, we develop a genomic interval search system using representation learning. We train numerical embeddings for a collection of region sets simultaneously with their metadata labels, capturing similarity between region sets and their metadata in a low-dimensional space. Using these learned co-embeddings, we develop a system that solves three related information retrieval tasks using embedding distance computations: retrieving region sets related to a user query string, suggesting new labels for database region sets, and retrieving database region sets similar to a query region set. We evaluate these use cases and show that jointly learned representations of region sets and metadata are a promising approach for fast, flexible, and accurate genomic region information retrieval.

## Relevant tutorials

This paper trained BEDspace models (using StarSpace with BED files). See these tutorials:

- [How to use BEDSpace to jointly embed regions and metadata](../tutorials/bedspace.md)

