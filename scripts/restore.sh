#!/bin/bash
docker run --rm \
	--name pgtest \
	-v $PWD/.secrets/general.json:/secrets/general.json \
	-v $PWD/postgres.conf:/etc/postgresql/postgresql.conf \
	-v $PWD/pgbackrest.conf:/etc/pgbackrest.conf \
	-v $PWD/docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d/ \
	-v $PWD/data:/var/lib/postgresql/data \
	-e GOOGLE_APPLICATION_CREDENTIALS=/secrets/general.json \
       	nuxion/postgresql:14.5 pgbackrest --stanza=main restore --log-level-console=info
