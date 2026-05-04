use school;
create table staff(
S_id text(100),
name text (100),
address text (100)
);
set global local_infile = 1;
describe staff;
 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data.csv'
 into table staff
fields terminated by ','
lines terminated by '\n';
SHOW VARIABLES LIKE "secure_file_priv";
select * from staff;
truncate staff;