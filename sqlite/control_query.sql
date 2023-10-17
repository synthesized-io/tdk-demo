select substr(description, 0, 52) || '..' as description
     , (select count(1) from crime_scene_report) as all_scenes
     , (select count(distinct type) from crime_scene_report) as all_types
     , (select count(distinct city) from crime_scene_report) as all_cities
  from crime_scene_report
 where city = 'SQL City'
   and type = 'murder'
   and date = '20180115';
