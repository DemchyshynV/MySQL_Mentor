use user7777;

select *
from cars;

drop table users;

create table users
(
    id     int         not null auto_increment primary key,
    name   varchar(25) not null,
    age    int         not null,
    status tinyint     not null,
    gender varchar(6)  not null
);

insert into users
values (null, 'Olha', 35, 0, 'female');


select name, gender
from users;
select *
from users;
select *
from users
where name = 'oleg';
select *
from users
where name like 'o%';
select *
from users
where name like '%a';
select *
from users
where name like '%li%';
select *
from users
where name like '__e%';


select *
from users
where age != 30;


select *
from users
where age > 30;

select *
from users
where age >= 30;
select *
from users
where age < 30;

select *
from users
where age <= 30;

select * from users where age  between 20 and 30;
select * from users where age not between 20 and 30;

select * from users where age>=20 and age<=30 and name like '%l%';
select * from users where age>=20 and age<=30 or name='kokos';

select * from users where age in (25,55,4,36);

select * from users where  length(name)<4;

select * from users order by age;

select * from users limit 4 offset 12;


select min(age) as min_age from users;
select max(age) as max_age from users;
select avg(age) as avg_age from users;
select sum(age) as sum_age from users;
select count(*) as users_count from users;
select * from users where gender='female' order by age,name limit 1;

# {'min(age)':4}


select count(*) as users_count, gender from users group by gender;
select max(age) as users_count, gender from users group by gender;
select count(*), age from users group by age;

select name from users order by name desc ;


select count(*) as model_count, model from cars where year>2020 group by model having model_count>=2;
update users set age=100, name='Nijak' where age<10;

delete from users where name='Nijak';
