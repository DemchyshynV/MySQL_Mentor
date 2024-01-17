use ajaj;

create table cities(
                       id int primary key auto_increment,
                       city varchar(25) not null
);


# create table users(
                        #     id int primary key auto_increment,
                        #     name varchar(20) not null ,
                        #     age int not null ,
                        #     city_id int null ,
                        #     foreign key (city_id) references cities(id)
                            # );


select * from users;
select * from cities;

select users.id, name, age, city from users join cities on cities.id = users.city_id;
select users.*, city from users join cities on cities.id = users.city_id;

select * from cities c join users u on c.id = u.city_id;


select * from cities c left join users u on c.id = u.city_id;
select * from cities c join users u on c.id = u.age;

select users.id, name, age, city from users join cities c on c.id = users.city_id where city='kyiv';

select * from client
                  join ajaj.application a on client.idClient = a.Client_idClient
                  join ajaj.department d on client.Department_idDepartment = d.idDepartment;


# select distinct name from users;
#
# select sum(age) from users
                           # union
  # select max(age) from users;

select * from cars where price in (select age from users where gender='male');


select count(*) as count, cars.model from cars group by model order by count desc limit 1;

select * from cars where price > (select  avg(cars.price) from cars);
