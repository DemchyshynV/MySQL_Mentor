distinct
union

desc cars;
select price, year, price*2 doublePrice, price*year from cars;
select concat(id, ' ', name,' ', gender) from users;
select concat('asd', ' hsdhdh') from dual;
select * from users where concat('Ms ', name,' ', gender) = 'Ms Olha Female';
select * from users where age = 2+14;
select * from users where name > 'max';
select * from users order by 3 desc ;
select upper(name) from users;

select *
from client c
         join department d on d.idDepartment = c.Department_idDepartment;


create table cities
(
    id   int primary key not null,
    city varchar(20)     not null
);

create table users
(
    id      int primary key not null auto_increment,
    name    varchar(20)     not null,
    age     int             not null,
    city_id int             null,
    foreign key (city_id) references cities (id)

);

show tables;


select *
from cities;

select *
from users;

select *
from users
         join cities c on c.id = users.city_id;

select *
from users
         left join cities c on c.id = users.city_id;

select *
from users
         right join cities c on c.id = users.city_id;
