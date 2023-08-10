with projects as (
  select p.respemp 
       , listagg(p.projname , ', ') as projects
       , count(1) as projects_count
    from project p
   group by p.respemp)
select title, projects
  from (select e.empno || ': ' || e.firstnme || ' ' || e.lastname as title
             , p.projects
             , p.projects_count
             , rank() over(order by projects_count desc) as projects_rank
          from projects as p
          join employee e on e.empno = p.respemp) e
 where projects_rank <= 3;
