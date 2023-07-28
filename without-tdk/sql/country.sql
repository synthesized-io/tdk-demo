insert into country(country)
select faker.unique_country()
  from generate_series(1, 200) as id;
