# TDK Oracle Demo

[Sakila for Oracle](https://github.com/jOOQ/sakila/tree/main/oracle-sakila-dba) is an Oracle port of the legendary MySQL [Sakila](https://dev.mysql.com/doc/sakila/en) sample database.

```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo/oracle
```


## Masking of the existing data

Set up the license key:
```shell
export SYNTHESIZED_KEY=kDpeQB...
```

Spin up Oracle databases:
```shell
docker-compose up oracle_source oracle_target -d
```

Run TDK:
```shell
docker-compose run tdk
```

## Export to PostgreSQL

Run `ora2pg` to export the masked Oracle database to set of PostgreSQL sql-files:
```shell
docker-compose run ora2pg
```

Run the PostgreSQL database:
```shell
docker-compose up postgres_masked -d
```


## Knowing problems

- get rid of `last_update` columns in the cofiguration file
- truncate shcema with recursive FKs
- mask the `film.description` column
