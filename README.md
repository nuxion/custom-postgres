# PostgreSQL docker image

This is a custom image builder for postgresql based on the official image from https://hub.docker.com/_/postgres

It's allow to use pgbackrest as a way to make backups and restore. 

It's configurated for GCS but could be used for azure and aws too. 

## Variables

- `BUCKET`: bucket name, it should be only the name without gs:// nor slashes, ej: `export BUCKET=my-bucket`
- `STANZA_NAME`: it's a reference name used by pgbackrest. It also will be used to store backups in the bucket. 

## Some notes

After see some examples it's very easy to follow the official documentation, but knowdledge related to postgresql is required. 


**restore process**

Restore and common start of a container should be different steps/containers 
sharing both the same `PGDATA` volume because the restore action could not be performed with postgresql running and the container doesn't work without postgres running.

The example included in [scripts/restore.sh](scripts/restore.sh) it's for a full restore backup. For PITR (point-in-time-recovery) restores check the official docs of pgbackrest, it's well documented. 


**pgbackrest vs barman**

Both were evaluated, besides barman seems to be better for stream wal replication (less probability of data loss), pgbackrest was easier to configurate than barman. 
As workaround to prevent data loss a passive postgres replica could be configurated. Also pgbackrest documentation is more complete. 

**python**

Don't worry for the `pyproject.toml` file, it's was used to test barman which requires python, itsn't needed for pgbackrest. 


## References

- https://bun.uptrace.dev/postgres/pgbackrest-s3-backups.html#incremental-backup
- https://pgbackrest.org/user-guide.html
- https://github.com/postgis/docker-postgis
- https://github.com/cloudnative-pg/postgres-containers/blob/main/Debian/14/Dockerfile
