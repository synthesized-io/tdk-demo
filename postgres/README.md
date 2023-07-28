# pagila-tdk-demo

A simple (but no less powerful) demo for data generation (masking and subsetting as well) for the legendary Pagila database schema using Synthesized TDK.

[Pagila](https://github.com/devrimgunduz/pagila) is a sample database schema that can be used in tutorials, articles, demos, etc.

[Synthesized TDK](https://docs.synthesized.io/tdk/latest/?utm_source=habr&utm_medium=devrel&utm_campaign=datagen) provides database generation and masking capabilities.


## How to start

```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo
```

### Generation of the empty database from scratch

```shell
export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
docker-compose run tdk
```

When the program completes its execution (and control returns to the command line), we will be able to connect to the output database using the exposed port `6001` and `postgres` as the values for the `user`, `password`, and `db_name` parameters, and examine our synthesized data.

Or you can connect to the output database directly in the Docker container using psql:

```shell
docker exec -it output_db sh -c \
  "psql -U postgres -d postgres -c \"select count(1) from rental\""
```

```shell
 count
--------
 20000
(1 row)
```

Alternatively, you can use the embedded [pgAdmin 4](https://www.pgadmin.org/download). Simply go to http://localhost:8888/browser and explore the two preconfigured database connections (use `postgres` as the password).

After that, you can modify an existing config or write your own `config.yaml` file and run data generation again:

```shell
export CONFIG_FILE=config.yaml
docker-compose run tdk
```

Then we can shut down the databases:

```shell
docker-compose down
```

### Generation based on the existing data

```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

### Masking of the existing data

![masking demo](masking.gif)

```shell
export CONFIG_FILE=config_masking.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Execute `control_query.sql` script on the original database:

```shell
usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 ELEANOR    | HUNT      | ELEANOR.HUNT@sakilacustomer.org |       46 | 216.54
 KARL       | SEAL      | KARL.SEAL@sakilacustomer.org    |       45 | 221.55
 CLARA      | SHAW      | CLARA.SHAW@sakilacustomer.org   |       42 | 195.58
```

Execute `control_query.sql` script on the masked database:

```shell
usql mysql://root:admin@localhost:6001/sakila -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 NVTPDAF    | VTKI      | HOEDJRR.RWAA@jczrgdfhirscic.kko |       46 | 296.06
 MGPI       | AMKL      | QYBQ.VMFS@kywmemvfqskdwg.tqx    |       45 | 297.24
 BKNOQJ     | ZWDQ      | ZFALHK.JDGW@iiczrtrkgemxtr.lmy  |       42 | 251.95
```


### Subsetting of the existing data

![subsetting demo](subsetting.gif)

```shell
export CONFIG_FILE=config_subsetting.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

## Troubleshooting and advises

In order to work comfortably, TDK requires at least 2-4 GB of memory.

So check the memory settings for your Docker:
- in case of Docker Desktop ([windows](https://docs.docker.com/desktop/settings/windows), [mac](https://docs.docker.com/desktop/settings/mac))
- in case of [classical](https://docs.docker.com/config/containers/resource_constraints) Docker
