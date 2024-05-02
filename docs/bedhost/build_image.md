# Build the container locally

Running with `uvicorn` provides auto-reload. To configure, this assumes you have previously set up `databio/secrets`. 

1. Source `.env` file to populate the environment variables referenced in the configuration file.
2. Start `bedhost` using `uvicorn` and pass the configuration file via the `BEDBASE_CONFIG` env var.


```console
source ../bedbase.org/environment/production.env
BEDBASE_CONFIG=../bedbase.org/config/api.bedbase.org.yaml uvicorn bedhost.main:app --reload
```

You can change the database you're connecting to by using a different config file:
- Using a local config: `BEDBASE_CONFIG=../bbconf/tests/data/config.yaml uvicorn bedhost.main:app --reload`
- With new database: `BEDBASE_CONFIG=../bedbase.org/config/bedbase2.yaml uvicorn bedhost.main:app --reload`

Now, you can access the service at [http://127.0.0.1:8000](http://127.0.0.1:8000). Example endpoints:
- http://127.0.0.1:8000/v1/bed/bbad85f21962bb8d972444f7f9a3a932/metadata?full=true
- http://127.0.0.1:8000/v1/bed/bbad85f21962bb8d972444f7f9a3a932/metadata/plots?full=true
- http://127.0.0.1:8000/v1/objects/bed.bbad85f21962bb8d972444f7f9a3a932.chrombins
- http://127.0.0.1:8000/v1/bed/list?limit=10&offset=0


## Running the server in Docker

### Building image

- Primary image: `docker build -t databio/bedhost -f .Dockerfile .`
- Dev image `docker build -t databio/bedhost:dev -f dev.Dockerfile .`
- Test image: `docker build -t databio/bedhost:dev -f test.Dockerfile .`

Existing images can be found [at dockerhub](https://hub.docker.com/r/databio/bedhost).


## Deploying updates automatically

- [Deploying bedbase](./deployment.md).