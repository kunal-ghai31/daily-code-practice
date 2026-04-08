create database school;
use school;
create table students(
stu_id int auto_increment primary key unique,
stu_name text(50) not null,
stu_address text(200) not null,
stu_email varchar(100) unique not null,
stu_phone varchar(13) unique not null
);
SET SQL_SAFE_UPDATES = 0;
describe students;
insert into students
values ('1','aman', 'delhi', 'aman@gmail.com', '9876543210');
insert into students
values ('2','nikhil', 'delhi', 'nikhil@gmail.com', '9876543411');
insert into students
values ('3','raman', 'delhi', 'raman@gmail.com', '9123987650');
insert into students
values ('4','kian', 'noida', 'kian@gmail.com', '8142390765');
insert into students
values ('5','raj', 'noida', 'raj@gmail.com', '7098513624');
select * from students;
use school;
create table departments(
stu_id int unique auto_increment not null,
stu_department text not null,
stu_fees int not null);
insert into departments
values ('1','science','56000');
insert into departments
values ('2','science','56000');
insert into departments
values ('3','arts','42000');
insert into departments
values ('4','commerce','48000');
insert into departments
values ('5','commerce','48000');
select * from departments;
SELECT students.stu_id, departments.stu_id
FROM students
INNER JOIN departments ON students.stu_id = departments.stu_id;