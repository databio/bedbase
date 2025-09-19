# How to create UMAP embeddings from indexed BED files

To create UMAP embeddings from indexed BED files in the BEDbase database, you can use the `bedboss download-umap` command. 
This command generates UMAP embeddings for visualizing the relationships between different BED files based on their genomic regions.

#### Key features of the `bedboss download-umap` command:
- User can specify the number of dimensions to return (2 or 3).
- If user selected 2 dimensions, script can generate a umap plot.
- If user choose to generate a plot, user can specify what metadata column to color the points by.

!!! example
    Let's say we want to create a 2D UMAP embedding of the top 10 assays and top 10 cell lines from our BEDbase database, 
    and generate a plot colored by assay type. We can run the following command:

    ```bash
    bedboss download-umap --config <path_to_bedbase_config>  \
        --output-file umap_embeddings.csv \
        --n-components 2 --plot-name umap_plot.png  \
        --plot-label assay --top-assays 10 --top-cell-lines 10
    ```



???- "Full bedboss download-umap help""
    ```text
    
     bedboss download-umap --help
                                                                                                                                                                                                                                    
     Usage: bedboss download-umap [OPTIONS]                                                                                                                                                                                             
                                                                                                                                                                                                                                        
     Download UMAP                                                                                                                                                                                                                      
                                                                                                                                                                                                                                        
    ╭─ Options ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
    │ *  --config                TEXT     Path to the bedbase config file [default: None] [required]                                                                                                                                   │
    │ *  --output-file           TEXT     Path to the output file where UMAP embeddings will be saved [default: None] [required]                                                                                                       │
    │    --n-components          INTEGER  Number of UMAP components [default: 3]                                                                                                                                                       │
    │    --plot-name             TEXT     Name of the plot file [default: None]                                                                                                                                                        │
    │    --plot-label            TEXT     Label for the plot [default: None]                                                                                                                                                           │
    │    --top-assays            INTEGER  Number of top assays to include [default: 15]                                                                                                                                                │
    │    --top-cell-lines        INTEGER  Number of top cell lines to include [default: 15]                                                                                                                                            │
    │    --help                           Show this message and exit.                                                                                                                                                                  │
    ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
    ```