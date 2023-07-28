# :factory: pagila-data-generation :movie_camera:

A set of SQL scripts for random data generation for the [Pagila](https://github.com/devrimgunduz/pagila) database.


## Purpose

We really like Pagila’s advanced database schema and high-quality data. However, the largest Pagila tables contain only around 16,000 rows. But sometimes, we need more (much more), so we created this set of SQL-scripts (based on PostgreSQL magic and the amazing [PostgreSQL Faker](https://gitlab.com/dalibo/postgresql_faker) extension) to generate a huge number of rows.

If you have any ideas, feel free to create a [PR](https://github.com/mgramin/pagila-data-generation/pulls) or open an [issue](https://github.com/mgramin/pagila-data-generation/issues).


## Run data generation

Just run in your terminal:
```
git clone https://github.com/mgramin/pagila-data-generation.git
cd pagila-data-generation
docker-compose up
```

And delight the process:
```
Timing is on.
Generate data for "country" table ...
INSERT 0 200
Time: 5.455 ms
Generate data for "language" table ...
INSERT 0 100
Time: 2.885 ms
Generate data for "city" table ...
INSERT 0 19966
Time: 2176.080 ms (00:02.176)
Generate data for "address" table ...
INSERT 0 199809
Time: 56927.373 ms (00:56.927)
Generate data for "store" table ...
INSERT 0 199809
Time: 1009.853 ms (00:01.010)
Generate data for "staff" table ...
INSERT 0 500000
Time: 181709.507 ms (03:01.710)
Generate data for "customer" table ...
INSERT 0 500000
Time: 137106.194 ms (02:17.106)
Generate data for "film" table ...
INSERT 0 10000
Time: 2796.677 ms (00:02.797)
Generate data for "inventory" table ...
INSERT 0 184616
Time: 1708.883 ms (00:01.709)
Generate data for "rental" table ...
INSERT 0 1000000
Time: 12943.481 ms (00:12.943)
```


## SQL scripts conventions

- Try to keep to the [axis](https://gramin.pro/posts/rivers-and-axis) when formatting
