# Methods for evaluating unsupervised vector representations of genomic regions

Paper: [Manuscript at bioRxiv](http://dx.doi.org/10.1101/2023.08.28.555137) 


## Abstract

Representation learning models have become a mainstay of modern genomics. These models are trained to yield vector representations, or embeddings, of various biological entities, such as cells, genes, individuals, or genomic regions. Recent applications of unsupervised embedding approaches have been shown to learn relationships among genomic regions that define functional elements in a genome. Unsupervised representation learning of genomic regions is free of the supervision from curated metadata and can condense rich biological knowledge from publicly available data to region embeddings. However, there exists no method for evaluating the quality of these embeddings in the absence of metadata, making it difficult to assess the reliability of analyses based on the embeddings, and to tune model training to yield optimal results. To bridge this gap, we propose four evaluation metrics: the cluster tendency score (CTS), the reconstruction score (RCS), the genome distance scaling score (GDSS), and the neighborhood preserving score (NPS). The CTS and RCS statistically quantify how well region embeddings can be clustered and how well the embeddings preserve information in training data. The GDSS and NPS exploit the biological tendency of regions close in genomic space to have similar biological functions; they measure how much such information is captured by individual region embeddings in a set. We demonstrate the utility of these statistical and biological scores for evaluating unsupervised genomic region embeddings and provide guidelines for learning reliable embeddings.

## Relevant tutorials

Analysis from the paper is described in these tutorials: 

- [How to evalute embeddings](../geniml/tutorials/evaluation.md)
