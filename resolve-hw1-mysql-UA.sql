# знайти всі машини старші за 2000 р.
select * from cars where year > 2000;
# знайти всі машини молодші 2015 р.
select * from cars where year < 2015;
# знайти всі машини 2008, 2009, 2010 років
select * from cars where year in(2008,2009,2010);
# знайти всі машини не з цих років 2008, 2009, 2010
select * from cars where year not in(2008,2009,2010);
# знайти всі машини де year==price
select * from cars where year = price;
# знайти всі машини bmw старші за 2014 р.
select * from cars where model='bmw' and year > 2014;
# знайти всі машини audi молодші 2014 р.
select * from cars where model='audi' and year < 2014;
# знайти перші 5 машин
select * from cars limit 5;
# знайти останні 5 машин
select * from cars order by id desc limit 5;
# знайти середнє арифметичне цін машини KIA
select avg(price), model from cars where model='kia';
# знайти середнє арифметичне цін для кожної марки машин окремо
select avg(price), model from cars group by model;
# підрахувати кількість кожної марки
select count(*), model from cars group by model;
# знайти марку машин кількість яких найбільше
select count(*) as count, model from cars group by model order by count desc limit 1;
# знайти марку машини в назві яких друга та передостання буква "a"
select * from cars where model like '_a%a_';
# знайти всі машини назва моделі яких більше за 8 символів
select * from cars where length(model)>8;


# ***знайти машини ціна котрих більше ніж ціна середнього арифметичного всіх машин
select * from cars where price > (select avg(price) from cars)
