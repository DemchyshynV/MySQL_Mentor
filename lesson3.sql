create table skills
(
    id    int primary key auto_increment,
    skill varchar(20) not null
);

create table users
(
    id       int auto_increment primary key,
    username varchar(50)  not null,
    password varchar(255) not null
);

create table users_skills
(
    #     id int primary key auto_increment,
    user_id  int not null,
    skill_id int not null,
    #     primary key (id),
    foreign key (user_id) references users (id),
    foreign key (skill_id) references skills (id)
);


select p.*, s.skill
from users
         join users_skills us on users.id = us.user_id
         join skills s on s.id = us.skill_id
         join profile p on users.id = p.user_id
where username = 'Kokos_87';

create table profile
(
    id      int primary key auto_increment,
    name    varchar(25) not null,
    age     int         not null,
    user_id int         not null unique,
    foreign key (user_id) references users (id)
);