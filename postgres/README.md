# TDK PostgreSQL Demo

[Pagila](https://github.com/devrimgunduz/pagila) is a PostgreSQL version of the well-known MySQL [Sakila](https://dev.mysql.com/doc/sakila/en) sample database.

Clone this repo:
```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo/postgres
```


## Generation based on the empty schema

![generation from scratch demo](generation_from_scratch.gif)

Run TDK:
```shell
export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
docker-compose down; docker-compose run tdk
```

Execute [`control_query.sql`](control_query.sql) script on the original database and ensure that there is no data:
```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql
```

Execute the `control_query.sql` script on the resulting database to ensure that we have realistic and beautiful data:
```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql
```


## Generation based on the existing data

![generation demo](generation.gif)

Run TDK:
```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker-compose down; docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Execute `control_query.sql` script on the original database:
```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql
```

Execute `control_query.sql` script on the resulting database:
```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql
```


## Masking of the existing data

![masking demo](masking.gif)

Run TDK:
```shell
export CONFIG_FILE=config_masking.tdk.yaml
docker-compose down; docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Execute `control_query.sql` script on the original database:
```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql
```

Execute `control_query.sql` script on the masked database:
```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql
```


## Subsetting of the existing data

![subsetting demo](subsetting.gif)

Run TDK:
```shell
export CONFIG_FILE=config_subsetting.tdk.yaml
docker-compose down; docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Execute `control_query.sql` script on the original database:
```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql
```

Execute `control_query.sql` script on the resulted database:
```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql
```


## Advanced

Alternatively, you can use the embedded [pgAdmin 4](https://www.pgadmin.org/download). Simply go to http://localhost:8888/browser and explore the two preconfigured database connections (use `postgres` as the password).
