# Synthesized TDK Oracle Demo

[Sakila for Oracle](https://github.com/jOOQ/sakila/tree/main/oracle-sakila-dba) is an Oracle port of the legendary MySQL [Sakila](https://dev.mysql.com/doc/sakila/en) sample database.

```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo/oracle
```


## Masking of the existing data

Set up the TDK license key:
```shell
export SYNTHESIZED_KEY=kDpeQB...
```
> **Note**
>
> [Please contact us to obtain an enterprise license key.](https://www.synthesized.io/contact-sales)

Spin up Oracle databases:
```shell
docker compose run databases
```

Run TDK:
```shell
docker compose run tdk
```

## Export to PostgreSQL

Run `ora2pg` to export the masked Oracle database to set of PostgreSQL sql-files:
```shell
docker compose run ora2pg
```

Run the PostgreSQL database:
```shell
docker compose up postgres_masked -d
```
