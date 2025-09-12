# 🔄 BEDbase loader 

BEDbase loader is an automated tool and cron job that continuously fetches, processes, and integrates new BED files from public repositories into the BEDbase database. This ensures that BEDbase remains up-to-date with the latest genomic data available.

BEDbase loader repository: [https://github.com/databio/bedbase-loader](https://github.com/databio/bedbase-loader)

## Key Features
- **Automated GEO Retrival**
- **Automated BED heavy processing**
- **Automated Genomes Updater**
- **Umap creator**

### Automated GEO Retrieval

Main and the most important part of the bedbase-loader is automated retrieval of the GEO data. 
**Steps**:
1. First, it is done by fetching metadata from PEPhub API, from bedbase repository: [https://pephub.databio.org/bedbase](https://pephub.databio.org/bedbase). And selects GSE projects that were uploaded in certain period of time (e.g. last 2 days).
2. After list of GSE projects is fetched, BEDboss checks if this projects were already processed. If not, it is going to the next step.
3. Then, it is fetching metadata for all the projects from PEPhub, including urls to the files.
4. Next, files are being downloaded and metadata is inserted into the BEDbase database.
5. Finally, the status flag is updated to "downloaded" and the project is ready for the next step - heavy processing (Next section).


### Automated BED heavy processing

A lot of files are downloaded from GEO using automated GEO retrival.
But to speed up downloading and inserting time we are skipping heavy processing on the initial step.
Heavy processing is happening in AWS using AWS Fargate and automated cron job, after the files are downloaded and inserted into the database.
Docker image for heavy processing: [https://github.com/databio/bedboss/blob/main/Dockerfile](https://github.com/databio/bedboss/blob/main/Dockerfile)


### Automated Genomes Updater

BEDbase loader includes automated genomes updater that is fetching genomes from Refgenie server.
We are storing information about all genomes available on the Refgenie server to make links between BED file stored in the BEDbase
and the exact reference genome used to create this BED file.
To automatically update genomes we are using cron job located here: https://github.com/databio/bedbase-loader/blob/master/.github/workflows/update_genomes.yml


### Umap Creator

One of the important parts of the BEDbase is embeddings of the BED files.
Visualization of the embedding provides insights into the data stored in the BEDbase.
To create embeddings we are using BEDbase package, it automatically creates umap file, that later is visualized here: [https://bedbase.org/umap](https://bedbase.org/umap)
To provide up-to-date umap we are using cron job located here: https://github.com/databio/bedbase-loader/blob/master/.github/workflows/update_umap.yml
