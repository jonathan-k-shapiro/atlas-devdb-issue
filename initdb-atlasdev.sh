set -e

cd /mnt/scripts

echo "putting pg_hba in place"
cp /mnt/pg_hba/pg_hba.conf /var/lib/postgresql/data
psql -q -U postgres -c "SELECT pg_reload_conf()"

echo "creating users and database"
psql -q -U postgres -d postgres -v ON_ERROR_STOP=1 -f ./create_users_and_db_atlasdev.sql

echo "creating schema and extensions"
psql -q -U postgres -d mydb -v ON_ERROR_STOP=1 -f ./schema_and_extensions_atlasdev.sql