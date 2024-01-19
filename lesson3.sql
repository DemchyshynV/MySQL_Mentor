create table users_cars
(
    user_id int,
    car_id  bigint,
    primary key (user_id, car_id),
    foreign key (user_id) references users (id),
    foreign key (car_id) references cars (id)

);


select users.name, c.*
from users
         join users_cars uc on users.id = uc.user_id
         join ajaj.cars c on c.id = uc.car_id
where name = 'natali';


create table auth_user
(
    id       int primary key auto_increment,
    username varchar(255) not null,
    password varchar(255) not null,
    user_id  int          not null unique,
    foreign key (user_id) references users (id)
);

select *
from users
         join auth_user au on users.id = au.user_id;



select sum(Sum) as sum, idDepartment, DepartmentCity
from department
    join ajaj.client c on department.idDepartment = c.Department_idDepartment
    join ajaj.application a on c.idClient = a.Client_idClient
group by idDepartment order by Sum desc limit 1;