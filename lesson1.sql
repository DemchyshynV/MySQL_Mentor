use asdasd;

show databases;

select * from cars;
select id, model, year from cars;

select * from users where name = 'OLEG';
select * from users where name != 'OLEG';
select * from users where name like 'o%' ;
select * from users where name like '%o%' ;
select * from users where name like '__e%' ;

select * from users where age = 30;
select * from users where age != 30;
select * from users where age between 20 and 30;
select * from users where age not between 20 and 30;

select * from users where age >=20 and age<=30;
select * from users where age >=20 or age<=30;

select * from users where age=16 and name like '_a%';

select * from users where age in (20,25,30,45,14);
select * from users where age not in (20,25,30,45,14);

select * from users where length(name) = 4;

select * from users order by name asc;
select * from users order by name;
select * from users order by name desc ;
select * from users order by age desc ;

select * from users order by age desc limit 2 offset 6;


#
# max()
# min()
#    avg()
#       count()
#            sum()

select min(age) as minAge from users;
select max(age) as maxAge from users;
select sum(age) as sumOfAge from users;
select avg(age) as avgOfAge from users;
select count(*) as count from users;

select count(*), gender from users where age<=25 group by gender;


select count(*) as count, model from cars where year>2020 group by model having count>=2;

# {'min(age)':4}


create table users
(
    id int primary key auto_increment,
    name varchar(20) not null ,
    age int not null
);

insert into users values (null, 'Max', 15);
select * from users;

delete  from users where id=6;

update users set name='Karina' where id=5;