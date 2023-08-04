create schema foo;

CREATE USER simple_pg_user WITH PASSWORD 'postgres';
ALTER USER simple_pg_user WITH SUPERUSER;

CREATE USER static_vault_pg_user WITH PASSWORD 'foo';
ALTER USER static_vault_pg_user WITH SUPERUSER;
