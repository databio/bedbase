# BEDbase public instance

The public BEDbase instance at [bedbase.org](https://bedbase.org) hosts public BED files.

## 🛰️ Resource links

- **Documentation**: <a href="https://docs.bedbase.org/" target="_blank">https://docs.bedbase.org/</a>
- **Deployed public instance UI**: <a href="https://bedbase.org/" target="_blank">https://bedbase.org/</a>
- **Dev UI**: <a href="https://dev.bedhost.pages.dev/" target="_blank">https://dev.bedhost.pages.dev/</a>
- **API**: <a href="https://api.bedbase.org/" target="_blank">https://api.bedbase.org/</a>
- **Dev API**: <a href="https://dev.bedbase.org/" target="_blank">https://api-dev.bedbase.org/</a>

## 🔍 Finding relevant BED files

The best way to locate data is to use the search interface on the bedbase.org home page. This search interface is smart. It relies on our [Text2BED](../../geniml/tutorials/text2bednn-search-interface.md) models, which allow you to search the genome using natural language. We have previously computed embeddings for each BED file in BEDbase, and then you can search them.

## 📥 Downloading data

From the search interface, you can add results to your cart, then download all the files in your cart.

## 🗃️ BEDsets

BEDsets are collections of BED files. BEDbase holds tens of thousands of files, which span reference genome assemblies. 
You aren't likely to want to use all the data for one project. 
BEDsets provide a way to group together a subset of the files in BEDbase for a particular purpose. In the future, all users 
will be able to create their own BEDsets.

## 🧬 Reference genomes compatibility comparison

BED files in BEDbase are mapped to different reference genomes. Bedbase provides a validation of BED files to the reference genomes 
available on https://ui.refgenie.org/ . It provides an insight into which reference genome is most likely used in mapping the BED file.
More information about reference genome validation can be found [here](./reference-genome-compatibility.md).


## 📋 BED classification

BEDbase classifies BED files into different categories based on their content.
It provides user with bed compliance and data format was used in generating the BED file.
Often, BED files are not strictly following the [UCSC BED format](https://genome.ucsc.edu/FAQ/FAQformat.html#format1),
or narrowPeak/broadPeak formats. BED classification provides a way to understand the content of the BED file.
More information about BED classification can be found [here](./bed_classification.md).

## 📊 BED file statistics

BEDbase provides statistics about the BED files in the database. It includes: 
- Genomic features information
- Regions distributions over chromosomes
- GC content distribution
- Cell specific enrichment analysis
- and more.


## 💫 Similarity search

BED files page include information about most similar files based on genomic regions similarity.
It incorporates [BED-to-BED search](./bedbase-search.md) and provides insights on similarity even if 
metadata of some of the files is missing or incomplete.
