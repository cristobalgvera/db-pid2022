# Database Backups

In order to accomplish a database backup using PostgreSQL, use the following command:

```bash
pg_dump postgresql://[USER]:[PASSWORD]@[HOST]:[PORT]/[DB_NAME] -n [SCHEMA] > [FILE_NAME].sql

# For example
pg_dump postgresql://postgres:[PASSWORD]@localhost:5432/postgres -n public > backup.sql
```

To restore the database use the following command:

```bash
psql postgresql://[USER]:[PASSWORD]@[HOST]:[PORT]/[DB_NAME] < [FILE_NAME].sql

# For example
psql postgresql://postgres:[PASSWORD]@localhost:5432/postgres < backup.sql
```

Those backup files can be saved in lot of formats, including compressed versions.

## Utility scripts

Inside of the backup folder are a `backup.sh` script that can be executed
in the Docker container's bash. It will create a backup file of the current
database information.

## Docker

It's possible to use a Docker instance in order to avoid the need to install
PostgreSQL inside your machine

To use it, set the environments and then run the following commands:

```bash
# Launch the container
cd postgres
docker compose up -d --build

# Get into the container
docker compose exec postgres bash

# Run the CMS' script
cd /backups/cms
sh backup.sh
```
