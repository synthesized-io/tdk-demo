insert into rental(rental_date, inventory_id, customer_id, staff_id)
select current_date - (((row_number() over())::text) || ' minute')::interval
     , inventory_id
     , customer_id
     , staff_id
  from (select i.inventory_id
             , c.customer_id
             , s.staff_id 
          from inventory i tablesample bernoulli(1) 
         cross join customer c tablesample bernoulli(1)
         cross join staff s tablesample bernoulli(1)
         limit 1000000) s;
