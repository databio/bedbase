# 🔄 BEDbase loader 

BEDbase Loader is an automated system with scheduled cron jobs that continuously fetches, processes,
and integrates new BED files from public repositories into the BEDbase database.
This ensures that BEDbase stays up to date with the latest available genomic data.
BEDbase loader repository: [https://github.com/databio/bedbase-loader](https://github.com/databio/bedbase-loader)

## Key Features
- **Automated GEO Retrival**
- **Automated BED heavy processing**
- **Automated Genomes Updater**
- **Umap creator**

### 🟢 Automated GEO Retrieval

The main and most important part of the bedbase-loader is the automated retrieval of GEO data.
**Steps**:

1. Metadata is fetched from the PEPhub API (BEDbase repository: https://pephub.databio.org/bedbase).
It selects GSE projects uploaded within a given time window (e.g., the last 2 days).
2. BEDboss checks whether these projects have already been processed. If not, it proceeds to the next step.
3. Metadata for all selected projects is retrieved from PEPhub, including file URLs.
4. The files are downloaded and the metadata is inserted into the BEDbase database.
5. Finally, the project status flag is updated to "downloaded", and the project is ready for the next step — heavy processing (see below).


### 🟢 Automated BED heavy processing

Many files are downloaded from GEO during automated retrieval.
To speed up the initial download and insertion, heavy processing is skipped at this stage.

Heavy processing is performed later in AWS using AWS Fargate and an automated cron job, after the files are downloaded and stored in the database.

Docker image for heavy processing: https://github.com/databio/bedboss/blob/main/Dockerfile

### 🟢 Automated Genome Updates

The bedbase-loader includes an automated genome updater that fetches genomes from the Refgenie server.
Information about all available genomes is stored in BEDbase, allowing each BED file to be linked to the exact reference genome used to create it.

Genome updates are handled by a scheduled cron job: https://github.com/databio/bedbase-loader/blob/master/.github/workflows/update_genomes.yml

### 🟢 UMAP Creator

An important part of BEDbase is the creation of embeddings for BED files.
These embeddings enable visualization, providing insights into the data stored in BEDbase.

The bedbase package automatically creates UMAP files, which are then visualized here: [https://bedbase.org/umap](https://bedbase.org/umap)
To keep the UMAP visualization up-to-date, a scheduled cron job is used: https://github.com/databio/bedbase-loader/blob/master/.github/workflows/update_umap.yml
