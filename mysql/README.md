# TDK MySQL Demo

[Sakila](https://dev.mysql.com/doc/sakila/en) is a sample database schema that can be used in MySQL tutorials, articles, demos, etc.

```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo/mysql
```


## Masking of the existing data

![masking demo](masking.gif)

Run TDK using Docker image:
```shell
export CONFIG_FILE=config_masking.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Or run TDK CLI directly:
```shell
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_masking.tdk.yaml
```

Check the ORIGINAL database with [`control sql-query`](control_query.sql):
```shell
usql mysql://root:admin@localhost:6000/sakila -f control_query.sql
```

Check the RESULTED database with [`control sql-query`](control_query.sql):
```shell
usql mysql://root:admin@localhost:6001/sakila -f control_query.sql
```


## Subsetting of the existing data

![subsetting demo](subsetting.gif)

Run TDK using Docker image:
```shell
export CONFIG_FILE=config_subsetting.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Or run TDK CLI directly:
```shell
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_subsetting.tdk.yaml
```

Check the ORIGINAL database with [`control sql-query`](control_query.sql):
```shell
usql mysql://root:admin@localhost:6000/sakila -f control_query.sql
```

Check the RESULTED database with [`control sql-query`](control_query.sql):
```shell
usql mysql://root:admin@localhost:6001/sakila -f control_query.sql
```
