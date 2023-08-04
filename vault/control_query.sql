select user_name, count(1) 
  from foo.test_table
 group by user_name;
