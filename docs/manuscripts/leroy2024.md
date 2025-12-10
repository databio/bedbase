# Fast clustering and cell-type annotation of scATAC data using pre-trained embeddings

Paper: [Manuscript at bioRxiv](http://dx.doi.org/10.1101/2023.08.01.551452) 


## Abstract

**Motivation** Data from the single-cell assay for transposase-accessible chromatin using sequencing (scATAC-seq) is now widely available. One major computational challenge is dealing with high dimensionality and inherent sparsity, which is typically addressed by producing lower-dimensional representations of single cells for downstream clustering tasks. Current approaches produce such individual cell embeddings directly through a one-step learning process. Here, we propose an alternative approach by building embedding models pre-trained on reference data. We argue that this provides a more flexible analysis workflow that also has computational performance advantages through transfer learning.

**Results** We implemented our approach in scEmbed, an unsupervised machine learning framework that learns low-dimensional embeddings of genomic regulatory regions to represent and analyze scATAC-seq data. scEmbed performs well in terms of clustering ability and has the key advantage of learning patterns of region co-occurrence that can be transferred to other, unseen datasets. Moreover, pre-trained models on reference data can be exploited to build fast and accurate cell-type annotation systems without the need for other data modalities. scEmbed is implemented in Python and it is available to download from GitHub. We also make our pre-trained models available on huggingface for public use.

## Relevant tutorials

Analysis from the paper is described in these tutorials: 

- [Train single-cell embeddings](../geniml/tutorials/train-scembed-model.md)
- [Populate a vector store](../geniml/tutorials/load-qdrant-with-cell-embeddings.md)
- [Predict cell-types using KNN](../geniml/tutorials/cell-type-annotation-with-knn.md)