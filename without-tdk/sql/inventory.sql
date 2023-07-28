insert into inventory(film_id, store_id)
select f.film_id
     , s.store_id 
  from film f tablesample bernoulli(1)
 cross join store s tablesample bernoulli(1) 
 order by random()
 limit 200000;
