use user987789;

select * from users;
select id, name from users;

select * from users where name = 'oleg';
select * from users where name != 'oleg';
select * from users where name like 'oleg';
select * from users where name like 'o%';
select * from users where name like '%o%';
select * from users where name like '__e%';

select * from users where age = 30;
select * from users where age != 30;
select * from users where age between 20 and 30;
select * from users where age not between 20 and 30;
select * from users where age>=20 and age<=30;
select * from users where age=16 and name like '_a%';
select * from users where age in (20, 25, 16, 11, 2, 36, 88, 45);
select * from users where age not in (20, 25, 16, 11, 2, 36, 88, 45);

select * from users where length(name) = 4;

select * from users where age>20 order by name;
select * from users where age>20 order by name asc ;
select * from users where age>20 order by name desc ;
select * from users where age>20 order by age desc ;
select * from users where age>20 order by age ;
select * from users order by age limit 3;
select * from users order by age ;

# max()
#    min()
#       avg()
#          count()
#               sum()

select min(age) as  minAge from users;
select max(age) as  maxAge from users;
select sum(age) as  sumAge from users;
select avg(age) as  avgAge from users;
select count(*) as  countUsers from users;

select min(age) as minAge, gender from users where  age<=25 group by gender;
select count(age) as minAge, gender from users where  age<=25 group by gender;

select count(*) as count, model from cars where year > 2020 group by model having count>=2;
select count(*) as count, model from cars where model='bmw' or model='audi' group by model;
select count(*) as count, model from cars where model in ('bmw', 'audi', 'aka') group by model;

drop table users;

create table users(
                      id int primary key auto_increment,
                      name varchar(20) not null ,
                      age int not null
);

insert into users(name) values ('Marina');
insert into users values (null, 'Oleg', 20);

delete from users where id in (1,3,4);

update users set name='Masha' where id=33;