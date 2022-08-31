show databases;
create database testdb2222;
use testdb2222;
show tables;
create table users
(
    id     int          not null auto_increment,
    name   varchar(100) not null,
    age    int          not null,
    gender varchar(6)   not null,
    primary key (id)
);

select *
from users;
insert into users
values (null, 'Max', 13, 'male');

use my_test_db1;

select id, name, age
from users;

select *
from users
where name = 'oleg';

select *
from users
where name like 'o%';

select *
from users
where name like '%o%';

select *
from users
where name like '__e%';

select *
from users
where age = 30;

select *
from users
where age != 30;

select *
from users
where age between 20 and 30;

select *
from users
where age not between 20 and 30; // not

select *
from users
where age >= 20
  and age <= 30;

select *
from users
where age >= 20 and age <= 30
   or name = 'max';

select *
from users
where age in (20, 25, 30);

select *
from users
where age not in (20, 25, 30);

select *
from users
where length(name) = 4;

select *
from users
order by age asc;

select *
from users
order by age desc;

select *
from users
limit 2;

select *
from users
limit 2 offset 2;

select min(age)
from users;

select max(age)
from users;

select max(age) as max_age
from users;

select max(age), gender as max_age
from users
group by gender;

select AVG(age), gender as max_age
from users
group by gender;

select count(id)
from users;

select sum(age)
from users;

select count(*)as count, model from cars where year>2020 group by model having count>=2;

delete
from users
where id = 2;

update users
set age=2
where id = 1;
# min()
# max()
# avg()
# sum()
# count()
