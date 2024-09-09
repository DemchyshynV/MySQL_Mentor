show databases;
use lkjh;

select * from cars;
select id, model from cars;
select * from users where name = 'OleG';
select * from users where name !='OleG';
select * from users where name like 'o%';
select * from users where name like '%o%';
select * from users where name like '%a';
select * from users where name like '__e%';

select * from users where age = 30;
select * from users where age != 30;
select * from users where age between 20 and 30;
select * from users where age not between 20 and 30;
select * from users where age>=20 and age<=30;
select * from users where age>=20 and age<=30 and gender ='male' or age=33;
select * from users where age in (25, 33, 36, 18, 16, 100);
select * from users where age not in (25, 33, 36, 18, 16, 100);


select * from users where length(name)<4;


select * from users order by id ;
select * from users where age> 20 order by id ;

select * from users limit 5 offset 15;

select * from users order by age, name desc ;


# max()
#    min()
#       avg()
#          count()
#               sum()

select min(age) as minAge from users;
select max(age) as maxAge from users;
select avg(age) as avgAge from users;
select sum(age) as sumAge from users;
select count(*) as sumAge from users where age>20;


select min(age), gender from users where age>25 group by gender;
select max(age), gender from users where age>25 group by gender;
select * from users where age> (select avg(age) from users where age>25 and gender='male' group by gender)
select count(*), gender from users where age>25 group by gender having count(*)>2;



drop table users;

create table users(
                      id int primary key auto_increment,
                      name varchar(20) not null ,
                      age int not null
);

insert into users (name, age) values ('Kiril', 15);

update users set name='Orest' where id=2;

delete from users where id in (1,3,4)