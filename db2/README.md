# TDK DB2 LUW Demo

Spin up databases:
```shell
docker-compose up input_db output_db -d
```

Set up the TDK license key:
```shell
export SYNTHESIZED_KEY=kDpeQB...
```

Run sql-query on the source DB:
```sql
ALTER TABLE DB2INST1.CL_SCHED DROP COLUMN "STARTING";
ALTER TABLE DB2INST1.CL_SCHED DROP COLUMN "ENDING";
```

Run transformations in masking mode:
```shell
docker-compose run tdk
```
