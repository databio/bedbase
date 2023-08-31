# How to create bedbase database

To run bedstat, bedbuncher and bedmbed we need to create postgres database.

We are initiating postgres db in docker.
If you don't have docker installed, you can install it with `sudo apt-get update && apt-get install docker-engine -y`.

Now, create a persistent volume to house PostgreSQL data:

```bash
docker volume create postgres-data
```

```bash
docker run -d --name bedbase-postgres -p 5432:5432 -e POSTGRES_PASSWORD=bedbasepassword -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres -v postgres-data:/var/lib/postgresql/data postgres:13
```

Now we have created docker and can run pipelines.
