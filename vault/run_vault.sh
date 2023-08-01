while ! $(vault status &> /dev/null); \
  do echo "Trying to connect to vault"; sleep 2; done
sleep 2
vault login ${VAULT_DEV_ROOT_TOKEN_ID}
vault auth enable approle
vault kv put secret/postgres-source-simple-user \
  username=simple_pg_user password=postgres
vault kv put secret/postgres-target-simple-user \
  username=simple_pg_user password=postgres
vault secrets enable database
vault write database/config/postgres_source \
    plugin_name=postgresql-database-plugin \
    connection_url="postgresql://{{username}}:{{password}}@input_db:5432/postgres" \
    allowed_roles="postgres-source-static-role,postgres-source-dynamic-role" \
    username="postgres" \
    password="postgres"
vault write database/config/postgres_target \
    plugin_name=postgresql-database-plugin \
    connection_url="postgresql://{{username}}:{{password}}@output_db:5432/postgres" \
    allowed_roles="postgres-target-static-role,postgres-target-dynamic-role" \
    username="postgres" \
    password="postgres"
vault write database/static-roles/postgres-source-static-role \
    db_name=postgres_source \
    username="static_vault_pg_user" \
    rotation_period=86400
vault write database/static-roles/postgres-target-static-role \
    db_name=postgres_target \
    username="static_vault_pg_user" \
    rotation_period=86400
vault write database/roles/postgres-source-dynamic-role \
    db_name="postgres_source" \
    creation_statements=" \
      create role \"{{name}}\" with login password '{{password}}' valid until '{{expiration}}'; \
      grant connect on database postgres to \"{{name}}\"; \
      grant usage on schema foo TO \"{{name}}\"; \
      grant select on all tables in schema \"foo\" to \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="24h"
vault write database/roles/postgres-target-dynamic-role \
    db_name="postgres_target" \
    creation_statements=" \
      create role \"{{name}}\" with login password '{{password}}' valid until '{{expiration}}'; \
      grant create on database postgres to \"{{name}}\"; \
      grant usage, create on schema foo TO \"{{name}}\"; \
      grant truncate, select, insert on all tables in schema \"foo\" to \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="24h"
