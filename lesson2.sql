use userrrr;
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

insert into cities
values (null, 'Rivne');

insert into users
values (null, 'Petro', 18, null);


select *
from users;
select *
from cities;

select *
from users
         join cities on cities.id = users.city_id;
select users.id, name, age, city
from users
         join cities on cities.id = users.city_id;
select users.*, city
from users
         join cities on cities.id = users.city_id;

select *
from users
         left join cities c on c.id = users.city_id;
select *
from users
         right join cities c on c.id = users.city_id;

select users.*
from users
         join cities c on c.id = users.city_id
where city = 'lviv';


select city
from users
         join cities c on c.id = users.city_id
where users.id = 3;


select *
from client
         join userrrr.application a on client.idClient = a.Client_idClient
         join userrrr.department d on d.idDepartment = client.Department_idDepartment;


select distinct name from users;

(select * from users order by age desc limit 1) union (select * from users order by age limit 1);




select * from cities where id in (select city_id from users where name in ('karina','max', 'tolik'));
select * from cities where id in (1,2);


select count(*) as count, model from cars group by model order by count desc limit 1;


