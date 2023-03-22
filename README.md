# tdk-docker-demo

A very simple (but no less powerful) demo to data generation for a legendary Pagila DB schema using TDK.

[Pagila](https://github.com/devrimgunduz/pagila) is a example database provided a standard schema that can be used for examples in books, tutorials, articles, samples, etc.

[TDK](https://docs.synthesized.io/tdk/latest/?utm_source=habr&utm_medium=devrel&utm_campaign=datagen) is a DevOps' best friend for database masking and generation.


## How to start

```
git clone https://github.com/synthesized-io/tdk-docker-demo
cd tdk-docker-demo
docker-compose run tdk
```

When the program completes its execution (and control returns to the command line) we be able to connect to the output DB (using `6001` exposed port and `postgres` as a value for `user`, `password` and `db_name` parameters) and examine our sythsized data. Or you can connect to the output DB directly in the docker container using psql:
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

After that, we can mofigy the `config.yaml` file and run data generation again:
```
docker-compose run tdk
```

Then we can shut down the databases:
```
docker-compose down
```
