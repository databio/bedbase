### Indexing to qdrant database

### 1. Create bedbase config file
### 2. Run bedboss index

#### From command line
```bash
bedboss index --bedbase-config path/to/bedbase_config.yaml
```

After running this comman all files that are in the database and weren't indexed will be indexed to qdrant database.


#### From within Python
```python
from bedboss.qdrant_index import add_to_qdrant

add_to_qdrant(
    bedbase_config="path/to/bedbase_config.yaml"
)
```