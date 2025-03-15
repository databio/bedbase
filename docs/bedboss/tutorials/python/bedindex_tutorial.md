### Indexing to qdrant database

### 1. Create bedbase config file

How to create a BEDbase configuration file is described in the [configuration section](../../../bedbase/how-to-configure.md).


### 2. Run bedboss index

#### From command line
```bash
bedboss reindex --bedbase-config path/to/bedbase_config.yaml
```

After running this command all files that are in the database and weren't indexed will be indexed to qdrant database.


#### From within Python
```python
from bedboss.qdrant_index.qdrant_index import add_to_qdrant

add_to_qdrant(config=bedbase_config)
```