create table users_cars
(
    user_id int    not null,
    car_id  bigint not null,
    primary key (user_id, car_id),
    foreign key (user_id) references users (id),
    foreign key (car_id) references cars (id)
);

describe cars;

select users.*
from users
         join users_cars uc on users.id = uc.user_id
         join asdasd.cars c on c.id = uc.car_id
where model = 'peugeot';

select cars.*, u.name
from cars
         join asdasd.users_cars uc on cars.id = uc.car_id
         join asdasd.users u on u.id = uc.user_id
where name = 'oleg';

create table auth_user
(
    id       int         not null auto_increment primary key,
    username varchar(20) not null,
    password varchar(20) not null,
    user_id  int         not null unique,
    foreign key (user_id) references users (id)
);

select *
from users
         left join asdasd.auth_user au on users.id = au.user_id;

select cars.*, u.name, au.*
from cars
         join asdasd.users_cars uc on cars.id = uc.car_id
         join asdasd.users u on u.id = uc.user_id
         join asdasd.auth_user au on u.id = au.user_id
where name = 'oleg';