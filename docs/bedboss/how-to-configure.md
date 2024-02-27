# How to create bedbase config file (for bedstat)

### Bedbase config file is yaml file with 4 parts:
- path to output files
- database credentials 
- qdrant credentials (can be skipped for if indexing is not needed)
- server information 
- remote info (can be skipped for bedboss)

### Example:
```yaml
path:
  remote_url_base: http://data.bedbase.org/
  pipeline_output_path: /data/outputs
  bedstat_dir: outputs/bedstat_output
  bedbuncher_dir: outputs/bedbuncher_output
  region2vec: databio/r2v-ChIP-atlas-hg38
  vec2vec: databio/v2v-MiniLM-v2-ATAC-hg38
  text2vec: sentence-transformers/all-MiniLM-L6-v2
database:
  host: $POSTGRES_HOST
  port: 5432
  password: $POSTGRES_PASSWORD
  user: $POSTGRES_USER
  name: bedbase
  dialect: postgresql
  driver: psycopg
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
    prefix: http://data.bedbase.org/
    description: HTTP compatible path
  s3:
    prefix: s3://data.bedbase.org/
    description: S3 compatible path
access_methods:
  http:
    type: "https"
    description: HTTP compatible path
    prefix: https://data2.bedbase.org/
  s3:
    type: "s3"
    description: S3 compatible path
    prefix: s3://data2.bedbase.org/
  local:
    type: "https"
    description: How to serve local files.
    prefix: /static/
```

Download example bedbase configuration file here: <a href="../bedbase_configuration.yaml" download>Example bedbase configuration file</a>

.