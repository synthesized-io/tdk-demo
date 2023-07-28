insert into film (title, language_id, original_language_id)
select format('Midnight in  %s', faker.unique_city())
     , (select l.language_id from "language" l order by random() + f/1e39 limit 1)
     , (select l.language_id from "language" l order by random() + f/1e39 limit 1)
  from generate_series(1, 10000) f(f);
