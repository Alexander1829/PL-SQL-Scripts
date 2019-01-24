/*MERGE данных о клиентах. Хотим смерджить в таблицу kk_clients табличку kk_clients_delta*/
Create table kk_clients (id integer, name varchar2(60), passport char(11));
Create table kk_clients_delta (id integer, firstname varchar2(30), lastname varchar2(30), passport char(11));

insert into kk_clients (id, name, passport) values  (1, 'Козлов Сергей', '1234 567890'); 
insert into kk_clients (id, name, passport) values  (2, 'Стервятников Евгений', '2345 678901');
insert into kk_clients (id, name, passport) values  (3, 'Баранов Илья', '3456 789012');
insert into kk_clients (id, name, passport) values  (4, 'Шакалов Григорий', '4567 890123');
insert into kk_clients (id, name, passport) values  (5, 'Крысин Роман', '5678 901234');
insert into kk_clients (id, name, passport) values  (6, 'Змеев Игорь', '6789 012345');
insert into kk_clients (id, name, passport) values  (7, 'Свиньин Абрам', '7890 123456');
insert into kk_clients (id, name, passport) values  (8, 'Пиявкин Ираклий', '8901 234567');
insert into kk_clients (id, name, passport) values  (9, 'Червяков Иосиф', '9012 345678');
insert into kk_clients (id, name, passport) values  (10, 'Трутнев Абдулла', '0123 456789');

insert into kk_clients_delta values (7, 'Свиньин', 'Абрам', '9876 543210');
insert into kk_clients_delta values (10, 'Трутнев', 'Владимир', '8765 432109');
insert into kk_clients_delta values (11, 'Рыропротьев', 'Станислав', '7654 321098');


merge into kk_clients dest
using (select * from kk_clients_delta) src
  on (dest.id = src.id)
  when matched then
    update 
    set dest.name = src.firstname ||' '|| src.lastname,
        dest.passport = src.passport
  when not matched then
    insert values (src.id, src.firstname ||' '|| src.lastname, src.passport);
    
/*
Посмотрим результат:
Select * from kk_clients; 

*/    