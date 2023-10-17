select c.first_name
     , c.last_name
     , c.email 
     , count(1) as payments
     , sum(p.amount) as amount
     , (select count(1) from payment p) as total_payments
     , (select sum(p.amount) from payment p) as total_amount
  from payment p
  join customer c using (customer_id)
 group by c.customer_id 
 order by 4 desc
 limit 3;
