SELECT
  p.proname as "Name",
  pg_catalog.pg_get_function_result(p.oid) as "Result data type",
  pg_catalog.pg_get_function_arguments(p.oid) as "Argument data types",
  p.prosrc as "Source code",
  pg_catalog.obj_description(p.oid, 'pg_proc') as "Description"
FROM pg_catalog.pg_proc p
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
     LEFT JOIN pg_catalog.pg_language l ON l.oid = p.prolang
WHERE p.proname ~ '^(valid)$'
  AND n.nspname ~ '^(ob)$'
ORDER BY 1, 2, 4;
;

select pg_catalog.obj_description(p.oid) as "Description" from pg_catalog.pg_proc p where p.proname = 'valid';


create or replace function shortdescription(text) returns table(Description text) as $$select pg_catalog.obj_description(p.oid, 'pg_proc') as "Description" from pg_catalog.pg_proc p where p.proname = $1;$$ language sql;

/*
create or replace function longdescription(text) returns table(Description text) as $$
SELECT
  p.proname as "Name",
  pg_catalog.pg_get_function_result(p.oid) as "Result data type",
  pg_catalog.pg_get_function_arguments(p.oid) as "Argument data types",
  p.prosrc as "Source code",
  pg_catalog.obj_description(p.oid, 'pg_proc') as "Description"
FROM pg_catalog.pg_proc p
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
     LEFT JOIN pg_catalog.pg_language l ON l.oid = p.prolang
WHERE p.proname ~ $1;
$$ language sql;
*/
