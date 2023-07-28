insert into address (address, address2, district, city_id, postal_code, phone)
select faker.address()
     , faker.address()
     , faker.state()
     , c.city_id
     , faker.postalcode()
     , faker.phone_number()
  from (select city_id
          from city
             , generate_series(1, 20)
         where random() > 0.5) c;
