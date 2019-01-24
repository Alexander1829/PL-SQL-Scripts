SELECT COUNT(*) 
FROM (SELECT DISTINCT * FROM "table name"); -- Считаем количество уникальных строк в таблице

select col_1, count(1) -- col_1 и количество повторений 
from "table name"
group by col_1
having count(1) > 1;

delete from "table name" -- удаляем все дубли из таблицы
where rowid not in
(
  select ri from 
  (
    select min(rowid) as ri 
          ,col_1          
          /*...*/ 
          ,col_n 
    from  "table name"
    group by 
           col_1
          /*...*/ 
          ,col_n
  )t1); commit;
  

/*Следующий запрос тоже удаляет все дубли, но работает медленнее, в несколько раз.*/
delete from "table name"
where rowid in
(
  select rowid from
  (
    select rowid, row_number() over (partition by col_1,col_2,col_3 /*,...*/ 
                                     order by rowid) rn
    from "table name" 
  ) t
  where rn != 1
); commit;


