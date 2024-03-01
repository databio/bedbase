# How to create BEDbase database

To run bedboss and upload data to the database we need to create postgres database, or use existing one.

---
### To create local database:
We are initiating postgres db in docker.
If you don't have docker installed, you can install it with 
```bash
sudo apt-get update && apt-get install docker-engine -y
```

Now, create a persistent volume to house PostgreSQL data:

```bash
docker volume create postgres-data
```

```bash
docker run -d --name bedbase-postgres -p 5432:5432 \
  -e POSTGRES_PASSWORD=bedbasepassword \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_DB=postgres \
  -v postgres-data:/var/lib/postgresql/data \
  postgres:13
```

Now we have created docker and can run pipelines.
To connect to the database, change your credentials in the `bedbase_config.yaml` file.
