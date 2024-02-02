# How to create bedbase config file (for bedstat)

### Bedbase config file is yaml file with 4 parts:
- path to output files 
- database credentials 
- server information 
- remote info

### Example:
```yaml
path:
  pipeline_output_path: $BEDBOSS_OUTPUT_PATH  # do not change it
  bedstat_dir: bedstat_output
  remote_url_base: null
  bedbuncher_dir: bedbucher_output
  #  region2vec: "add/path/here"
  #  vec2vec: "add/path/here"
database:
  host: $DB_HOST_URL
  port: $POSTGRES_PORT
  password: $POSTGRES_PASSWORD
  user: $POSTGRES_USER
  name: $POSTGRES_DB
  dialect: postgresql
  driver: psycopg2
server:
  host: 0.0.0.0
  port: 8000
qdrant:
  host: localhost
  port: 6333
  api_key: None
  collection: bedbase
remotes:
  http:
    prefix: https://data.bedbase.org/
    description: HTTP compatible path
  s3:
    prefix: s3://data.bedbase.org/
    description: S3 compatible path
```

### Download example bedbase configuration file here: <a href="../bedbase_configuration.yaml" download>Example bedbase configuration file</a>

.