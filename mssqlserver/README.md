# Synthesized TDK MS SQL Server Demo

Clone this repo:
```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd tdk-demo/mssqlserver
```

## Masking of the existing data

<!-- ![masking demo](masking.gif) -->

Run TDK:
```shell
export CONFIG_FILE=config_masking.tdk.yaml
docker compose run tdk
```

Execute `control_query.sql` script on the original database:
```shell
usql ms://sa:Secret_password_1@localhost:6000/northwind -f control_query.sql
```

Execute `control_query.sql` script on the masked database:
```shell
usql ms://sa:Secret_password_1@localhost:6001/northwind -f control_query.sql
```


## Generation based on the existing data

<!-- ![generation demo](generation.gif) -->

Run TDK:
```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker compose run tdk
```

Execute `control_query.sql` script on the original database:
```shell
usql ms://sa:Secret_password_1@localhost:6000/northwind -f control_query.sql
```

Execute `control_query.sql` script on the resulting database:
```shell
usql ms://sa:Secret_password_1@localhost:6001/northwind -f control_query.sql
```
