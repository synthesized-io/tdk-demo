# TDK SQLite Demo

[SQL Murder Mystery](https://mystery.knightlab.com) is an interactive online game that allows users to learn and practice SQL skills while solving a murder mystery. With the help of TDK, we will enhance your investigation in SQL City, making it even more interesting and sophisticated.

To start our investigation, we should review a crime scene report. Specifically, we need to create a SELECT query from the `crime_scene_report` table to retrieve the necessary information. Currently, there are 1228 records in this table. Additionally, by using TDK, we can generate additional records to enhance the complexity and engagement of our investigation.

So, first, let's create a copy of a SQL Murder Mystery database using the [KEEP(https://docs.synthesized.io/tdk/latest/user_guide/tutorial/masking)] mode of TDK. Make sure that we have 1228 records in the crime_scene_report table in the new database:

```shell
export CONFIG_FILE=config_keep.tdk.yaml
docker-compose run tdk
```

```shell
usql -q sqlite3://output/output.db -f control_query.sql

 count(*)
----------
     1228
```

Next, we can multiply the crime_scene_report table by 10x using the [GENERATION](https://docs.synthesized.io/tdk/latest/user_guide/tutorial/generation) mode of TDK. This will result in having 12280 records in the crime_scene_report table and make our investigation more intriguing:

```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker-compose run tdk
```

```shell
usql -q sqlite3://output/output.db -f control_query.sql

 count(*)
----------
    12280
```
