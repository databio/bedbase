# Deploying bedbase.org

This repository deploys the API for bedbase. It will run these services:

1. production API: https://api.bedbase.org/
2. dev API: https://api-dev.bedbase.org/

This repo will deploy a new service by following these steps:

1. Build an image by packaging the bedhost image (from dockerhub) with the bbconf file in this repository.
2. Push that image to AWS.
3. Deploy it to yeti cluster with aws task def.

## Build the container

Here we use the `databio/bedhost` container on dockerhub, and just add the configuration file in this repo to it, so build is super fast.

```
docker build -t databio/bedhost-configured -f Dockerfiles/primary.Dockerfile .
```

Or for dev:

```
docker build -t databio/bedhost-configured-dev -f Dockerfiles/dev1.Dockerfile .
```

## Run it locally to test

First, source the .env file to set env vars in the calling environment.
Then, use `--env-file` to pass those env vars through to the container

```
source environment/production.env
docker run --rm --network="host" \
  --env-file environment/docker.env \
  databio/bedhost-configured-dev
```

Here's another example for running the container:

```
docker run --rm --init -p 8000:8000 --name bedstat-rest-server \
  --network="host" \
  --volume ~/code/bedbase.org/config/api.bedbase.org.yaml:/bedbase.yaml \
  --env-file ../bedbase.org/environment/docker.env \
  --env BEDBASE_CONFIG=/bedbase.yaml \
  databio/bedhost  uvicorn bedhost.main:app --reload
```

## Building the Amazon-tagged version

You could build and push to ECR like this if you need it... but the github action will do this for you.

Authenticate with AWS ECR:
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 235728444054.dkr.ecr.us-east-1.amazonaws.com
```

Build/tag/push image:
```
docker build -t 235728444054.dkr.ecr.us-east-1.amazonaws.com/bedhost -f Dockerfiles/primary.Dockerfile .
docker push 235728444054.dkr.ecr.us-east-1.amazonaws.com/bedhost
```
