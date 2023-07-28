insert into city(city, country_id)
select faker.unique_city()
     , country_id
  from country
 cross join generate_series(1, 1000)
 where random() > 0.9;
