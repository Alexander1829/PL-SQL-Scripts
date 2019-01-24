/*Задача: Распределения данных по условию. Разложить четные и нечетные значения ID таблицы temp_test_clients 
в две другие таблицы такой же структуры как изначальная*/
create table temp_test_clients (id integer);

insert into  temp_test_clients (id) values (0);
insert into  temp_test_clients (id) values (1);
insert into  temp_test_clients (id) values (2);
insert into  temp_test_clients (id) values (3);
insert into  temp_test_clients (id) values (4);

create table temp_test_clients_1 as select * from temp_test_clients where 1=0;
create table temp_test_clients_2 as select * from temp_test_clients where 1=0;

begin
  for z in (select id from temp_test_clients) loop
    if mod(z.id,2) = 1 then
      insert into temp_test_clients_1 (id) values (z.id);
    else
      insert into temp_test_clients_2 (id) values (z.id);
    end if;
  end loop;
end;  
  
/* 
Проверяем результат
select * from temp_test_clients_1;
select * from temp_test_clients_2;
*/