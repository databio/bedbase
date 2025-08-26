# How to Reindex the BEDbase Database

BEDbase uses two main vector collections:

- **bed_collection**: Stores all genomic regions from the BED files for the hg38 reference genome.
- **text_collection**: Stores text embeddings for all BED files based on their metadata.

Information about whether a file is present in the vector database is stored together with its metadata in the relational database.
This setup allows us to easily track which files are indexed in the vector database.


To reindex the database, BEDboss provides two commands:

- 🟢 reindex: Reindex all the available hg38 files in qdrant database.                                                                                                                        │
- 🟢 reindex-text: Reindex the semantic (text) search.


!!! example

    Exapme of reindexing the entire database:

    ```bash
    bedboss reindex --bedbase-config <path_to_bedbase_config> --purge
    ```

    ❗ Purge option will set all files in the database as not indexed, and reindex all files from the database.
    ❗ If purge will be set to false, only files that are not indexed will be indexed.

???- "Full bedboss reindex help"
    ```text
    
    bedboss reindex --help
                                                                                                                                                                                                                                    
     Usage: bedboss reindex [OPTIONS]                                                                                                                                                                                                   
                                                                                                                                                                                                                                        
     Reindex the bedbase database and insert all files to the qdrant database.                                                                                                                                                          
                                                                                                                                                                                                                                        
    ╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
    │ *  --bedbase-config                  TEXT     Path to the bedbase config file [default: None] [required]                                                                                                                         │
    │    --purge             --no-purge             Purge existing index before reindexing [default: no-purge]                                                                                                                         │
    │    --batch                           INTEGER  Number of items to upload in one batch [default: 1000]                                                                                                                             │
    │    --help                                     Show this message and exit.                                                                                                                                                        │
    ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
    ```

    ```text
    
     bedboss reindex-text --help
                                                                                                                                                                                                                                        
     Usage: bedboss reindex-text [OPTIONS]                                                                                                                                                                                              
                                                                                                                                                                                                                                        
     Reindex semantic (text) search.                                                                                                                                                                                                    
                                                                                                                                                                                                                                        
    ╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
    │ *  --bedbase-config                  TEXT     Path to the bedbase config file [default: None] [required]                                                                                                                         │
    │    --purge             --no-purge             Purge existing index before reindexing [default: no-purge]                                                                                                                         │
    │    --batch                           INTEGER  Number of items to upload in one batch [default: 1000]                                                                                                                             │
    │    --help                                     Show this message and exit.                                                                                                                                                        │
    ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
    ```