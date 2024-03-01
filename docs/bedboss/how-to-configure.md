# How to create bedbase config file

### Bedbase config file is yaml file with 4 parts:
- paths and vector models
- relational database credentials
- qdrant credentials
- server information
- remote info

### Example:
```yaml
path:
  remote_url_base: http://data.bedbase.org/
  pipeline_output_path: /data/outputs
  bedstat_dir: outputs/bedstat_output
  bedbuncher_dir: outputs/bedbuncher_output
  region2vec: databio/r2v-ChIP-atlas-hg38-v2
  vec2vec: databio/v2v-MiniLM-v2-ATAC-hg38
  text2vec: sentence-transformers/all-MiniLM-L6-v2
database:
  host: $POSTGRES_HOST
  port: 5432
  password: $POSTGRES_PASSWORD
  user: $POSTGRES_USER
  name: bedbase
  bed_table: bedfiles
  bedset_table: bedsets
  relationship_table: bedset_bedfiles
  dialect: postgresql
  driver: psycopg2
qdrant:
  host: $QDRANT_HOST
  port: 6333
  api_key: $QDRANT_API_KEY
  collection: bedbase
server:
  host: 0.0.0.0
  port: 8000
remotes:
  http:
    prefix: https://data2.bedbase.org/
    description: HTTP compatible path
  s3:
    prefix: s3://data2.bedbase.org/
    description: S3 compatible path
```