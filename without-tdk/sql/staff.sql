insert into staff(first_name, last_name, address_id, email, store_id, active, username, password)
select faker.first_name()
     , faker.last_name()
     , address_id
     , faker.email()
     , store_id
     , case when random() > 0.5 then true else false end
     , faker.user_name()
     , faker.password()
  from (select a.address_id
             , s.store_id
          from store s tablesample bernoulli(1)
         cross join address a tablesample bernoulli(1)
         limit 500000) s;
