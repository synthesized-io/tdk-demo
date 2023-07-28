create schema faker;
create extension faker schema faker cascade;


set schema 'public';
\i /home/pagila-schema.sql

set schema 'public';
select faker.faker(array['en_US']);

\timing

\echo Generate data for "country" table ...
\i /home/sql/country.sql

\echo Generate data for "language" table ...
\i /home/sql/language.sql

\echo Generate data for "city" table ...
\i /home/sql/city.sql

\echo Generate data for "address" table ...
\i /home/sql/address.sql

\echo Generate data for "store" table ...
\i /home/sql/store.sql

\echo Generate data for "staff" table ...
\i /home/sql/staff.sql

\echo Generate data for "customer" table ...
\i /home/sql/customer.sql

\echo Generate data for "film" table ...
\i /home/sql/film.sql

\echo Generate data for "inventory" table ...
\i /home/sql/inventory.sql

\echo Generate data for "rental" table ...
\i /home/sql/rental.sql
