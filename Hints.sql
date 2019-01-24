/*хинты для ускорения запросов. Смотрим план и радуемся.*/
SELECT /*+ FIRST_ROWS(20) */ * ---Оптимизирует запрос для выборки первых строк
  FROM bigtab
  WHERE bigtab.id != 10;
 
--Join по хэшу
select /*+ USE_HASH(t2 t1) */ * 
from bigtab4 t1 
join bigtab t2 on t2.id = t1.id;
  
--Медленный запрос. Стоимость запроса = 1888.
select *
from bigtab4 t1 
where id = 1000;

--Создадим индекс
create index bigtab4_id_idx on bigtab4(id);

--Теперь стоимость запроса = 7.
select /*+ Index(t1 bigtab4_id_idx) */ *
from bigtab4 t1 
where id = 1000;

