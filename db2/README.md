# TDK DB2 Demo

Spin up databses:
```shell
docker-compose up input_db output_db -d
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
