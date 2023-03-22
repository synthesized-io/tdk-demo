# tdk-docker-demo

A simple (but no less powerful) demo for data generation for the legendary Pagila database schema using Synthesized TDK.

[Pagila](https://github.com/devrimgunduz/pagila) is a sample database schema that can be used in tutorials, articles, demos, etc.

[Synthesized TDK](https://docs.synthesized.io/tdk/latest/?utm_source=habr&utm_medium=devrel&utm_campaign=datagen) provides database generation and masking capabilities.


## How to start

```
git clone https://github.com/synthesized-io/tdk-docker-demo
cd tdk-docker-demo
docker-compose run tdk
```

When the program completes its execution (and control returns to the command line), we will be able to connect to the output database using the exposed port `6001` and `postgres` as the values for the `user`, `password`, and `db_name` parameters, and examine our synthesized data. Or you can connect to the output database directly in the Docker container using psql:
```
docker exec -it output_db sh -c \
  "psql -U postgres -d postgres -c \"select count(1) from rental\""
```

```
 count
--------
 100000
(1 row)
```

After that, we can modify the `config.yaml` file and run data generation again:
```
docker-compose run tdk
```

Then we can shut down the databases:
```
docker-compose down
```
