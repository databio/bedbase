# BEDbase Search



BEDbase supports three types of search methods:

### 🟢 Text2BED search

Text2BED search allows you to find relevant BED files using natural language queries.
This search is a first tab in the search page, and is a default search.

To use the search, provide **text query** (e.g., *“heart”*, or  *“k562”*) and click _search_.

At this moment, we are using semantic search. Compared to traditional keyword-based search, semantic search understands the meaning behind your query, allowing for more relevant results.
Most of the available platforms (GEO, ENCODE, etc) use traditional search, that limits findability.

How does it work?
1. The query text is encoded into a vector using a pre-trained language model.  
2. This vector is compared against precomputed vectors for all BED files in the database.  
3. The system retrieves and ranks BED files based on similarity to your query vector.

Example of the search page: [https://bedbase.org/search?q=USF2](https://bedbase.org/search?q=USF2)

Additionally, we have provided filters to narrow down your search results. You can filter by: 
- Assay type (e.g., ChIP-seq, ATAC-seq)
- Reference genome (e.g., hg19, hg38, mm10)


<!--
#### Semantic Search
- The query text is compared directly with **BED file summary vectors**.  
- The system retrieves BED files whose summaries are most similar to your query.  


#### Bi-Vector Search
1. The query text is encoded into a vector.  
2. It is matched against **metadata annotation vectors**, retrieving related terms (e.g., *“left atrium”*, *“arterial blood vessel”*).  
3. For each annotation, BEDbase uses precomputed vectors from a sample of associated BED files.  
4. These BED vectors act as queries in a **second stage** to find similar BED files.  
5. The **final ranking** combines scores from both annotation and BED file similarity.  
---
-->

\* We are actively working on improving the search experience. We are developing Bi-Vector search, 
which will combine metadata and BED content for more accurate results. Stay tuned for updates!

### 🟢 BED2BED Search 
_(Available only for hg38)_

BED to BED search allows you to find relevant BED files using your own BED file as a query.

It is a powerful way to find similar files to compare with your own data. This search can be used as a quality control step
of your own data, finding functional similarities to prove the correctness of your data,
or just to find similar datasets for your analysis.

To use the search, go to the second tab of the search page, and
upload your BED file. This bed file should be less than 20MB and should be a valid BED format.
BED-like file can be both gzipped or unzipped, we will handle both formats. 😃

After file has been uploaded, we are running quality control steps to make sure the file is valid.

How does it work? 
1. BED-like has been uploaded to the server.
2. The file is encoded into a vector representation.  
3. BEDbase compares it to stored BED file vectors.  
4. The system retrieves the stored BED files **most similar** to your query.  

---

### 🟢 BEDSet Search

Third type of search is BEDset search.
This search is a  string matching search. It is looking for exact matches of BEDset names, descriptions, and summaries.
BEDset search is in the third tab of the search page.
In the future, we will add semantic search for BEDsets.

---
