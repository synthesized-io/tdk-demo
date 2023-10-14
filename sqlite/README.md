


```shell
export CONFIG_FILE=config_keep.tdk.yaml
docker-compose run tdk
```

```shell
usql sqlite3://sql-murder-mystery.db -f control_query.sql
```

```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker-compose run tdk
```

```shell
usql sqlite3://sql-murder-mystery.db -f control_query.sql
```
