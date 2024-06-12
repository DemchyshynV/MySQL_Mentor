select distinct name, age
from users;

select avg(age), sum(age)
from users;

select avg(age)
from users
union
select sum(age)
from users;

select id, price, price * 2 as doublePrice
from cars;

select concat('My name is ', name, ' I`m ', age, ' gender - ', gender) as string
from users;

# My name is Oleg I`m 20 gender - male

select *
from users
where concat('My name is ', name, ' I`m ', age, ' gender - ', gender) = 'My name is Oleg I`m 20 gender - male';

select *
from users
where age = id + 18;

select *
from users
where name > 'max';

select id, lower(name)
from users;
select id, upper(name)
from users;

select c.*, a.Sum
from client as c
         join application as a on c.idClient = a.Client_idClient
         join department as d on d.idDepartment = c.Department_idDepartment
where Sum > 4000;

drop table users;

create table cities
(
    id   int primary key auto_increment,
    city varchar(20) not null
);

create table users
(
    id      int primary key auto_increment,
    name    varchar(20) not null,
    age     int         not null,
    city_id int         null,
    foreign key (city_id) references cities (id)
);

select * from users join cities c on c.id = users.city_id;

select users.id, users.name, users.age, c.city
from users
         join cities c on c.id = users.city_id;
select users.*, c.city
from users
         join cities c on c.id = users.city_id
where city = 'kyiv';

select * from users left join cities c on c.id = users.city_id;
select * from users right join cities c on c.id = users.city_id;

select avg(price) from cars;

select * from cars where price > (select avg(price) from cars);

select age from users;

select * from client where Age in (select age from users);

select count(*) as count, model from cars group by model order by count desc limit 1;