# How to create bedbase config file

BEDbase config file serves as a configuration file for the BEDbase server to provide credentials and paths to the required resources.

### How to create a bedbase config file

There are two ways to create a bedbase config file: </br>
1. Create a new file and copy the content from the example below. </br>
2. Use [BEDboss](../bedboss/README.md) command:
```bash
bedboss init-config --outfolder path/to/outfolder
```

### How to check if the config file is correct:
Use [BEDboss](../bedboss/README.md) command:
```bash
bedboss verify-config --config path/to/config.yaml
```

### Example of the config file:
```yaml
path:
  remote_url_base: http://data.bedbase.org/
  region2vec: databio/r2v-encode-hg38
  vec2vec: databio/v2v-geo-hg38
  text2vec: sentence-transformers/all-MiniLM-L6-v2
database:
  host: $POSTGRES_HOST
  port: 5432
  password: $POSTGRES_PASSWORD
  user: $POSTGRES_USER
  database: bedbase2
qdrant:
  host: $QDRANT_HOST
  port: 6333
  api_key: $QDRANT_API_KEY
  collection: bedbase2
server:
  host: 0.0.0.0
  port: 8000
s3:
  endpoint_url: $AWS_ENDPOINT_URL
  aws_access_key_id: $AWS_ACCESS_KEY_ID
  aws_secret_access_key: $AWS_SECRET_ACCESS_KEY
  bucket: bedbase
phc:
  namespace: databio
  name: bedbase_all
  tag: default
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
