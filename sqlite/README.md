# TDK SQLite Demo

[SQL Murder Mystery](https://mystery.knightlab.com) is an interactive online game that allows users to learn and practice SQL skills while solving a murder mystery. With the help of TDK, we will enhance your investigation in SQL City, making it even more interesting and sophisticated.

To start our investigation, we should review a crime scene report. Specifically, we need to create a SELECT query from the `crime_scene_report` table to retrieve the necessary information. Currently, there are 1228 records in this table. Additionally, by using TDK, we can generate additional records to enhance the complexity and engagement of our investigation.

So, first, let's create a copy of a SQL Murder Mystery database using the [KEEP](https://docs.synthesized.io/tdk/latest/user_guide/tutorial/masking) mode of TDK. Ensure that there are still 1228 crime scenes, 9 unique types of crime, 377 unique cities where crimes have been reported, and the specific crime scene where the investigated murder was conducted:

```shell
export CONFIG_FILE=config_keep.tdk.yaml
docker-compose run tdk

usql -q sqlite3://sql-murder-mystery.db -f control_query.sql

                      description                      | all_scenes | all_types | all_cities
-------------------------------------------------------+------------+-----------+------------
 Security footage shows that there were 2 witnesses... |       1228 |         9 |        377
```

Next, we can expand the `crime_scene_report` table by 10 times using the [GENERATION](https://docs.synthesized.io/tdk/latest/user_guide/tutorial/generation) mode of TDK. This expansion will introduce a new crime type (`cyber crimes`) and add new cities. You can refer to the corresponding [config file](config_generation.tdk.yaml) for more details:

```shell
export CONFIG_FILE=config_generation.tdk.yaml
docker-compose run tdk

usql -q sqlite3://output/output.db -f control_query.sql

                      description                      | all_scenes | all_types | all_cities
-------------------------------------------------------+------------+-----------+------------
 Security footage shows that there were 2 witnesses... |      13508 |        10 |      11935
```

As a result, the number of crime scenes will increase to 13508, with 12280 new crime scenes. Additionally, there will be 10 different types of crime and 11935 different cities. Furthermore, the `crime_scene_report` table still contains the records of the concrete investigated crime scenes. This expansion will add to the intrigue of our investigation.

Happy investigating further! We also have a small notice: "The Butler Didn't Do It" :smirk:
