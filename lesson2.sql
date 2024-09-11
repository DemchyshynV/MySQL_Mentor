use lkjh;
select distinct name, age from users;

select avg(age), sum(age) from users;

select avg(age) from users
union
select sum(age) from users;

select id, price, price*2 as doublePrice from cars;

select concat('My name is ',name, ' I`m ', age, 'gender - ',gender) as strings from users;
select * from users where concat('My name is ',name, ' I`m ', age, 'gender - ',gender)='My name is Max I`m 16gender - male';

select * from users where name < 'max';

select * from users where age = id+17;

select lower(name) from users;
select upper(name) from users;


select * from application
join client  on client.idClient = application.Client_idClient
where FirstName='Roman';

select client.*, application.CreditState from application
join client  on client.idClient = application.Client_idClient
where FirstName='Roman';

select a.*, client.FirstName, d.DepartmentCity from client
join lkjh.application a on client.idClient = a.Client_idClient
join lkjh.department d on d.idDepartment = client.Department_idDepartment;

create table cities(
  id int primary key auto_increment,
  city varchar(20) not null
);

create table users(
  id int primary key auto_increment,
  name varchar(20) not null ,
  age int not null ,
  city_id int null ,
  foreign key (city_id) references cities(id)
);


select users.*, c.city from users
join cities c on c.id = users.city_id
where city='lviv';

select * from users
join cities c on c.id = users.city_id;

select * from users left join cities as c on c.id = users.city_id;
select * from users right join  cities as c on c.id = users.city_id;


select model from cars group by model order by count(*) desc limit 1;

select max(price), count(*), model from cars group by model;

select count(*) from cars GROUP BY model;

