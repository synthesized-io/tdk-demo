insert into customer(store_id, first_name, last_name, email, address_id, activebool)
select store_id
     , faker.first_name()
     , faker.last_name()
     , faker.email()
     , address_id
     , case when random() > 0.5 then true else false end
  from (select a.address_id
             , s.store_id
          from store s tablesample bernoulli(1)
         cross join address a tablesample bernoulli(1)
         limit 500000) s;
