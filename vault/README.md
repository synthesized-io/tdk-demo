# tdk-vault-demo

Run Vault server and databases:
```shell
docker-compose run databases
``` 

### 1. Run TDK with simple Vault secrets

```shell
export INVENTORY_FILE=inventory_simple_secret.yaml
docker-compose run tdk
```

### 2. Run TDK with static database roles

```shell
export INVENTORY_FILE=inventory_static_users.yaml
docker-compose run tdk
```

### 3. Run TDK with dynamic database roles

```shell
export INVENTORY_FILE=inventory_dynamic_users.yaml
docker-compose run tdk
```


## Check results

Execute `control_query.sql` script on the original database:
```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql
```

Execute `control_query.sql` script on the resulted database:
```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql
```
