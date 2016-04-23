drop function if exists longdescription(text);
create or replace function longdescription(text)
--returns table(Description text, Result text, Argument text, Source text) as
returns table("Name" name, "Result type" text, "Argument type" text, "Source" text, "Description" text) as
$$
SELECT
  p.proname as "Name",
  pg_catalog.pg_get_function_result(p.oid) as "Result",
  pg_catalog.pg_get_function_arguments(p.oid) as "Argument",
   p.prosrc as "Source",
  pg_catalog.obj_description(p.oid, 'pg_proc') as "Description"
FROM pg_catalog.pg_proc p
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
     LEFT JOIN pg_catalog.pg_language l ON l.oid = p.prolang
WHERE p.proname = $1;
$$

language sql;

select * from longdescription('valid');
