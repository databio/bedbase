# Running Bedboss in Docker

To run bedboss in docker, go through the following steps:

1. Clone the bedboss repository:

    ```bash
    git clone git@github.com:databio/bedboss.git
    ```

2. Go to the bedboss directory.

3. Build the docker image:

    ```bash
    docker build -t my_bedboss .
    ```

4. source the environment variables:

    ```bash
    source production/production.env
    ```

5. Run the docker container with setting limit of the files that have to be processed:

    ```bash
    docker run --rm -it \
        --env POSTGRES_DB=$POSTGRES_DB \
        --env POSTGRES_HOST=$POSTGRES_HOST \
        --env POSTGRES_USER=$POSTGRES_USER \
        --env POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
        --env QDRANT_API_KEY=$QDRANT_API_KEY \
        --env QDRANT_API_HOST=$QDRANT_API_HOST \
        --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
        --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
        --env AWS_ENDPOINT_URL=$AWS_ENDPOINT_URL \
        --env UPLOAD_LIMIT=1 \
        -t my_bedboss
    ```

If everything is set up correctly, you should see the bedboss prompt.