# select distinct name from users;

create table cities
(
    id   int auto_increment primary key,
    city varchar(20) not null
);

create table users
(
    id      int auto_increment primary key,
    name    varchar(20) not null,
    age     int         not null,
    city_id int         null,
    foreign key (city_id) references cities (id)
);


select *
from cities;
select *
from users;

select users.*, city
from users
         right join cities c on c.id = users.city_id;

select *
from users
         join cities c on c.id = users.city_id;

select *
from users
         left join cities c on c.id = users.city_id;

select *
from users
         right join cities c on c.id = users.city_id;


update users join cities c on c.id = users.city_id
set city_id=1
where city = 'kyiv';

delete users
from users
         join cities c on c.id = users.city_id
where city = 'rivne';
delete
from users
where city_id = 2;

delete
from cities
where city = 'lviv';


select *
from application
         join client c on c.idClient = application.Client_idClient
         join department d on d.idDepartment = c.Department_idDepartment;


# select city
# from cities
#          join users u on cities.id = u.city_id
# where age = (select min(age)
#              from users
#                       join cities c on c.id = users.city_id
#              where city = 'kyiv');

select *
from users
         right join cities c on c.id = users.city_id;

select * from users where age in (select age
                                  from users
                                           join cities c on c.id = users.city_id
                                  where city='kyiv')
