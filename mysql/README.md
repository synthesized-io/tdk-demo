# TDK MySQL Demo

[Sakila](https://dev.mysql.com/doc/sakila/en) is a sample database schema that can be used in MySQL tutorials, articles, demos, etc.

```shell
git clone https://github.com/synthesized-io/pagila-tdk-demo
cd pagila-tdk-demo/mysql
```


## Masking of the existing data

![masking demo](masking.gif)

Run TDK using Docker image:
```shell
export CONFIG_FILE=config_masking.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Or run TDK CLI directly:
```shell
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_masking.tdk.yaml
```

Execute [`control_query.sql`](control_query.sql) script on the original database:

```shell
usql mysql://root:admin@localhost:6000/sakila -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 ELEANOR    | HUNT      | ELEANOR.HUNT@sakilacustomer.org |       46 | 216.54
 KARL       | SEAL      | KARL.SEAL@sakilacustomer.org    |       45 | 221.55
 CLARA      | SHAW      | CLARA.SHAW@sakilacustomer.org   |       42 | 195.58
```

Execute [`control_query.sql`](control_query.sql) script on the masked database:

```shell
usql mysql://root:admin@localhost:6001/sakila -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 NVTPDAF    | VTKI      | HOEDJRR.RWAA@jczrgdfhirscic.kko |       46 | 296.06
 MGPI       | AMKL      | QYBQ.VMFS@kywmemvfqskdwg.tqx    |       45 | 297.24
 BKNOQJ     | ZWDQ      | ZFALHK.JDGW@iiczrtrkgemxtr.lmy  |       42 | 251.95
```


## Subsetting of the existing data

![subsetting demo](subsetting.gif)

Run TDK using Docker image:
```shell
export CONFIG_FILE=config_subsetting.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

Or run TDK CLI directly:
```shell
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_subsetting.tdk.yaml
```

Execute [`control_query.sql`](control_query.sql) script on the original database:

```shell
usql mysql://root:admin@localhost:6000/sakila -f control_query.sql

 first_name | last_name |              email              | payments | amount
------------+-----------+---------------------------------+----------+--------
 ELEANOR    | HUNT      | ELEANOR.HUNT@sakilacustomer.org |       46 | 216.54
 KARL       | SEAL      | KARL.SEAL@sakilacustomer.org    |       45 | 221.55
 CLARA      | SHAW      | CLARA.SHAW@sakilacustomer.org   |       42 | 195.58
```

Execute [`control_query.sql`](control_query.sql) script on the resulting database:

```shell
usql mysql://root:admin@localhost:6001/sakila -f control_query.sql

 first_name | last_name |                 email                 | payments | amount
------------+-----------+---------------------------------------+----------+--------
 STEPHANIE  | MITCHELL  | STEPHANIE.MITCHELL@sakilacustomer.org |        9 | 42.91
 AMBER      | DIXON     | AMBER.DIXON@sakilacustomer.org        |        8 | 32.92
 RHONDA     | KENNEDY   | RHONDA.KENNEDY@sakilacustomer.org     |        8 | 51.92
```
