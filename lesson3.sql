create table users_cars
(
    user_id int not null,
    car_id  bigint not null,
    primary key (user_id, car_id),
    foreign key (user_id) references users (id),
    foreign key (car_id) references cars (id)
);

describe cars;
describe users;


select users.*, c.model from users
                                 join users_cars uc on users.id = uc.user_id
                                 join cars c on uc.car_id = c.id
where model = 'bmw';

select users.*, c.model from users
                                 join users_cars uc on users.id = uc.user_id
                                 join cars c on uc.car_id = c.id
where name='Max';


create table user(
                     id int primary key auto_increment,
                     username varchar(20) not null ,
                     password varchar(20) not null
);

create table profile(
                        id int primary key auto_increment,
                        name varchar(20) not null ,
                        surname varchar(20) not null ,
                        age int not null ,
                        user_id int not null unique ,
                        foreign key (user_id) references user(id)
);


alter table profile add asdfg varchar(30);