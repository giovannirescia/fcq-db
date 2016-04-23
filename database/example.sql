drop schema if exists chapter6 cascade;
create schema if not exists chapter6;
set schema 'chapter6';

drop table if exists alocation;
create table if not exists alocation (
location_id integer primary key not null,
aname text,
atype text);

drop table if exists registry;
create table if not exists registry (
sample_id serial primary key not null,
registered timestamp,
parent_sample_id integer references registry(sample_id));

drop table if exists chemist;
create table if not exists chemist (
chemist_id integer primary key not null,
aname text);

drop table if exists checkout;
create table if not exists checkout (
sample_id integer references registry(sample_id),
location_id integer references alocation(location_id),
chemist_id integer references chemist(chemist_id),
checked_out timestamp);


drop table if exists chem_structure;
create table if not exists chem_structure (
compound_id integer primary key not null,
smiles text,
mw real);

drop table if exists composition;
create table if not exists composition (
sample_id integer not null references registry on delete restrict,
compound_id integer not null references	chem_structure on delete cascade,
primary key (sample_id, compound_id));

/*for data types of table <test_table> */
/*select column_name, data_type from information_schema.columns where table_name = 'test_table';*/
