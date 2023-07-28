insert into language(name)
select faker.unique_language_name()
  from generate_series(1, 100) as id;
