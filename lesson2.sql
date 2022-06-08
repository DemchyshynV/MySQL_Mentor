distinct
union

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
