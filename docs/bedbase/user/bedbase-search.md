# BEDbase Search

BEDbase supports three types of search methods:


---

### BED2BED Search

Upload a **BED file** as your query.  
- The file is encoded into a vector representation.  
- BEDbase compares it to stored BED file vectors.  
- The system retrieves the stored BED files **most similar** to your query.  

---

### Text2BED search

Search using a **text query** (e.g., *“heart”*). There are two modes:

#### Bi-Vector Search
1. The query text is encoded into a vector.  
2. It is matched against **metadata annotation vectors**, retrieving related terms (e.g., *“left atrium”*, *“arterial blood vessel”*).  
3. For each annotation, BEDbase uses precomputed vectors from a sample of associated BED files.  
4. These BED vectors act as queries in a **second stage** to find similar BED files.  
5. The **final ranking** combines scores from both annotation and BED file similarity.  

#### Semantic Search
- The query text is compared directly with **BED file summary vectors**.  
- The system retrieves BED files whose summaries are most similar to your query.  

---

### BEDSet Search

Search using a **text query** against **BED set summaries**.  
- The query vector is compared to stored BED set summary vectors.  
- The most similar BED sets are retrieved.  

---



