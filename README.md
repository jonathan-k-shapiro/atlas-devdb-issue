# atlas-devdb-issue

Trying to build a minimal reproducer of the bug that my team has been experiencing
after upgrading atlasgo from v0.28 to v0.32.

## Steps to reproduce

1. Build a docker image for postgres with `docker build -t repro-pg -f Dockerfile.repro-pg .`
2. Bring up our setup in docker compose with `docker compose up --build -d`
3. Run `atlas migrate diff --env host`  THIS IS WHERE YOU SHOULD SEE AN ERROR!
4. Capture postgres logs with `docker compose logs atlasdev > atlasdev.log`

## The error you should see

```
Error: sql/migrate: read migration directory state: sql/migrate: executing statement "CREATE DOMAIN \"myschema\".\"verification_status\" AS text CONSTRAINT \"verification_status_check\" CHECK (VALUE = ANY (ARRAY['verified'::text, 'unverified'::text]));" from version "20250312222029": pq: type "verification_status" already exists
```

## What we see when we inspect the postgres logs for `atlasdev`

We see Atlas running through the migration two times separated by what seems to be a "cleanup phase". 

The cleanup phase consists of the statement

```
2025-03-17 23:08:02.522 UTC [34] LOG:  statement: DROP TABLE IF EXISTS "myschema"."users" CASCADE
```

The above statement is insufficient to clean up everything that was created in our migration. In particular in our case, it does not remove the domain that is created in `migrations/20250312222029_add_verified_column.sql`. That is why, we think, this error occurs. In earlier failed attempts to reproduce the error (with a simpler setup) we observed Atlas dropping the entire schema in the "cleanup phase" with `DROP SCHEMA myschema CASCADE`. We do not understand what about our setup prevents such a straightforward cleanup from happening.