# 1. Найти всех клиентов, чье имя меньше 6 символов
select *
from client
where length(FirstName) < 6;
# 2. Выбрать львовские отделения банка.
select *
from department
where DepartmentCity = 'lviv';
# 3. Выбрать клиентов с высшим образованием и по сортировать их по фамилии.
select *
from client
where Education = 'high'
order by LastName;
# 4. Выполнить сортировку в обратном порядке над таблицей Заявка и вывести 5 последних записи.
select *
from application
order by idApplication desc
limit 5;
# 5. Вывести всех клиентов, чья фамилия заканчивается на OV или OVA.
select *
from client
where LastName like '%ov'
   or LastName like '%ova';
# 6. Вывести клиентов банка, которые обслуживаются киевскими отделениями.
select idClient, FirstName, LastName, DepartmentCity
from client
         join department d on d.idDepartment = client.Department_idDepartment
where DepartmentCity = 'Kyiv';
# 7. Найти все имена клиентов без повторов.
select distinct FirstName
from client;
# 8. Вывести данные про клиентов, которые имеют кредиты больше чем 5000 гривен.
select distinct client.*
from client
         join application a on client.idClient = a.Client_idClient
where Sum > 5000;
# 9. Посчитать количество клиентов всех отделений и только львовских отделений.
select count(*) as all_lviv
from client
         join department d on d.idDepartment = client.Department_idDepartment;

select count(*)
from client
         join department d2 on d2.idDepartment = client.Department_idDepartment
where DepartmentCity = 'lviv';
# or
select (select count(*)
        from client
                 join department d on d.idDepartment = client.Department_idDepartment) as all_count,
       (select count(*)
        from client
                 join department d on d.idDepartment = client.Department_idDepartment
        where DepartmentCity = 'lviv') as lviv_count;
# 10. Найти кредиты, которые имеют самую большую сумму для каждого клиента отдельно.
select max(Sum) as max_credit, client.*
from client
         join application a on client.idClient = a.Client_idClient
group by idClient;
# 11. Посчитать количество заявок на кредит для каждого клиента.
select count(*), idClient, FirstName, LastName
from client
         join application a on client.idClient = a.Client_idClient
group by idClient;
# 12. Найти наибольший и наименьший кредиты.
select min(Sum) as min, max(Sum) as max
from application;
# 13. Подсчитать количество кредитов для клиентов, которые имеют высшее образование.
select count(*), idClient, FirstName, LastName, Education
from client
         join application a on client.idClient = a.Client_idClient
where Education = 'high'
group by idClient;
#14. Вывести данные про клиента, у которого наибольшая средняя сумма кредитов.
select avg(Sum) as avg, client.*
from client
         join application a on client.idClient = a.Client_idClient
group by idClient
order by avg desc
limit 1;
# 15. Вывести отделение, которое выдало в кредити больше всего денег.
select sum(Sum) as sum, idDepartment, DepartmentCity
from department
         join client c on department.idDepartment = c.Department_idDepartment
         join application a on c.idClient = a.Client_idClient
group by idDepartment
order by sum desc
limit 1;
# 16. Вывести отделение, которое выдало самый большой кредит.
select max(Sum) as max_sum, department.*
from department
         join client c on department.idDepartment = c.Department_idDepartment
         join application a on c.idClient = a.Client_idClient
group by idDepartment
order by max_sum desc
limit 1;
# 17. Все клиентам, которые имею высшее образование, установить все их кредити в размене 6000грн.
update application join client c on c.idClient = application.Client_idClient
set Sum=6000
where Education = 'high';
# 18. Всех клиентов киевских отделений пересилить в Киев.
update client join department d on d.idDepartment = client.Department_idDepartment
set City='Kyiv'
where DepartmentCity = 'kyiv';

# 19. Удалить все возвращенные кредити.
delete application
from application
where CreditState = 'Returned';
# 20. Удалить кредити клиентов, у которых вторая буква фамилии гласная.
delete application
from application
         join client c on c.idClient = application.Client_idClient
where
        LastName like '_e%' or
        LastName like '_y%' or
        LastName like '_u%' or
        LastName like '_o%' or
        LastName like '_a%';

#or

delete application
from application
         join client c on c.idClient = application.Client_idClient
where LastName regexp '^.[eyuoa].*';
# 21. Найти львовские отделения, которые выдали кредитов на общую сумму больше чем 5000
select sum(Sum) as sum, DepartmentCity,idDepartment
from department
         join client c on department.idDepartment = c.Department_idDepartment
         join application a on c.idClient = a.Client_idClient
where DepartmentCity = 'lviv'
group by idDepartment
having sum(Sum) > 5000;
# 22. Найти клиентов, которые погасили кредиты на сумму больше чем 5000
select idClient, FirstName, LastName, CreditState, Sum
from client
         join application a on client.idClient = a.Client_idClient
where CreditState = 'Returned'
  and Sum > 5000;
# 23. Найти наибольший невозвращенный кредит.
select application.*
from application
where CreditState = 'Not returned'
order by Sum desc
limit 1;
# 24. Найти клиента с наименьшей суммой кредита
select client.*, Sum
from client
         join application a on client.idClient = a.Client_idClient
order by Sum
limit 1;
# 25. Найти кредиты, сумма которых больше за среднее арифметическое всех кредитов.
select *
from application
where Sum > (select avg(Sum) from application);
# 26. Найти клиентов с того же самого города, что и клиент который взял наибольшее количество кредитов.
select *
from client
where City = (
    select c.City
    from client c
             join application a on c.idclient = a.client_idclient
    group by idclient
    order by count(*) desc
    limit 1
);
# 27. Найти город клиента с самим большим количеством кредитов.
select c.City
from client c
         join application a on c.idclient = a.client_idclient
group by idclient
order by count(*) desc
limit 1;
