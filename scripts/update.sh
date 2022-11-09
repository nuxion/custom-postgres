#!/bin/bash
GROUP=$(id -gn)
docker run -v $PWD:/workspace --rm nuxion/reqbuild
chown ${USER}:${GROUP} requirements.txt
sed -i '/psycopg/{:a;N;/barman/!ba};/via barman/d' requirements.txt

