#!/bin/bash
envsubst > $PWD/pgbackrest.tpl.conf > $PWD/pgbackrest.conf
docker run --rm -it \
	--name pgtest \
	-v $PWD/.secrets/general.json:/secrets/general.json \
	-v $PWD/postgres.conf:/etc/postgresql/postgresql.conf \
	-v $PWD/pgbackrest.conf:/etc/pgbackrest.conf \
	-v $PWD/docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d/ \
	-v $PWD/data:/var/lib/postgresql/data \
	-e GOOGLE_APPLICATION_CREDENTIALS=/secrets/key.json \
	-e POSTGRES_PASSWORD=changeme \
	-e STANZA_NAME=STANZA_NAME \
       	nuxion/postgresql:14.5  postgres -c 'config_file=/etc/postgresql/postgresql.conf'
