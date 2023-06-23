create table users
(
    id       int primary key auto_increment,
    username varchar(20) not null,
    password varchar(20) not null
);

create table profile
(
    id      int primary key auto_increment,
    name    varchar(20) not null,
    surname varchar(20) not null,
    age     int         not null,
    user_id int         not null unique,
    foreign key (user_id) references users (id)
);

select *
from users
         join profile p on users.id = p.user_id;



create table users_cars
(
    user_id int    not null,
    car_id  bigint not null,
    primary key (user_id, car_id),
    foreign key (user_id) references users (id),
    foreign key (car_id) references cars (id)
);


select users.*, p.*
from users
         join profile p on users.id = p.user_id
         join users_cars uc on users.id = uc.user_id
         join cars c on c.id = uc.car_id
where model='Peugeot';

insert into users_cars values (2,63);




