# TDK PostgreSQL Demo

[Pagila](https://github.com/devrimgunduz/pagila) is a PostgreSQL version of the well-known MySQL [Sakila](https://dev.mysql.com/doc/sakila/en) sample database.


```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo/postgres
```


## Generation based on the empty schema

![generation from scratch demo](generation_from_scratch.gif)

Run TDK using Docker image:
```shell
export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
docker-compose run tdk
```

Or run TDK CLI directly:
```shell
docker-compose -f docker-compose.yaml run databases
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_generation_from_scratch.tdk.yaml
```

When the program completes its execution (and control returns to the command line), we will be able to connect to the output database using the exposed port `6001` and `postgres` as the values for the `user`, `password`, and `db_name` parameters, and examine our synthesized data.

Or you can connect to the output database directly in the Docker container using psql:

```shell
docker exec -it output_db sh -c \
  "psql -U postgres -d postgres -c \"select count(1) from rental\""

 count
--------
 20000
(1 row)
```

Alternatively, you can use the embedded [pgAdmin 4](https://www.pgadmin.org/download). Simply go to http://localhost:8888/browser and explore the two preconfigured database connections (use `postgres` as the password).

But we prefer [usql](https://github.com/xo/usql) for interacting with different types of databases.

Execute [`control_query.sql`](control_query.sql) script on the original database and ensure that there is no data:

```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql

(0 rows)
```

Execute the `control_query.sql` script on the resulting database to ensure that we have realistic and beautiful data:

```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql

 first_name | last_name |              email               | payments | amount  
------------+-----------+----------------------------------+----------+---------
 Ok         | McKenzie  | mckenzie6536@gusikowskiolson.com |        2 | 354.34 
 Shay       | Waters    | waters4146@wildermangroup.com    |        2 | 1179.42 
 Tuan       | Kohler    | kohler7036@kulaskling.com        |        2 | 401.85 
(3 rows)
```

After that, you can modify an existing config or write your own `config.yaml` file and run data generation again:

```shell
export CONFIG_FILE=config.yaml
docker-compose run tdk
```

Then we can shut down the databases:

```shell
docker-compose down
```


## Generation based on the existing data

![generation demo](generation.gif)

Run TDK using Docker image:
```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Or run TDK CLI directly:
```shell
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_generation.tdk.yaml
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

Execute `control_query.sql` script on the original database:

```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 ELEANOR    | HUNT      | ELEANOR.HUNT@sakilacustomer.org |       46 | 216.54
 KARL       | SEAL      | KARL.SEAL@sakilacustomer.org    |       45 | 221.55
 CLARA      | SHAW      | CLARA.SHAW@sakilacustomer.org   |       42 | 195.58
(3 rows)
```

Execute `control_query.sql` script on the masked database:

```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql

 first_name | last_name |              email              | payments | amount 
------------+-----------+---------------------------------+----------+--------
 NVTPDAF    | VTKI      | HOEDJRR.RWAA@jczrgdfhirscic.kko |       46 | 296.23 
 MGPI       | AMKL      | QYBQ.VMFS@kywmemvfqskdwg.tqx    |       45 | 297.42 
 BKNOQJ     | ZWDQ      | ZFALHK.JDGW@iiczrtrkgemxtr.lmy  |       42 | 252.13
(3 rows)
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

Execute `control_query.sql` script on the original database:

```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 ELEANOR    | HUNT      | ELEANOR.HUNT@sakilacustomer.org |       46 | 216.54
 KARL       | SEAL      | KARL.SEAL@sakilacustomer.org    |       45 | 221.55
 CLARA      | SHAW      | CLARA.SHAW@sakilacustomer.org   |       42 | 195.58
(3 rows)
```

Execute `control_query.sql` script on the masked database:

```shell
usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql

 first_name | last_name |              email               | payments | amount 
------------+-----------+----------------------------------+----------+--------
 JUSTIN     | NGO       | JUSTIN.NGO@sakilacustomer.org    |        8 | 23.92 
 CLYDE      | TOBIAS    | CLYDE.TOBIAS@sakilacustomer.org  |        7 | 29.93 
 THEODORE   | CULP      | THEODORE.CULP@sakilacustomer.org |        7 | 28.93 
(3 rows)
```
