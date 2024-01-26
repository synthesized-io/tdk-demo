# Synthesized TDK DB2 LUW Demo

Spin up databases:
```shell
docker compose up input_db output_db -d
```

Set up the TDK license key:
```shell
export SYNTHESIZED_KEY=kDpeQB...
```
> **Note**
>
> [Please contact us to obtain an enterprise license key.](https://www.synthesized.io/contact-sales)


Run sql-query on the source DB:
```sql
ALTER TABLE DB2INST1.CL_SCHED DROP COLUMN "STARTING";
ALTER TABLE DB2INST1.CL_SCHED DROP COLUMN "ENDING";
```

Run transformations in masking mode:
```shell
docker compose run tdk
```
