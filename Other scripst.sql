-- Вычистить таблицу от дублирующихся строк - оставить только уникальные
DELETE FROM t 
WHERE rowid not in
(
  SELECT ri FROM 
  (
    SELECT min(rowid) as ri 
          ,col_1          
          /*...*/ 
          ,col_n 
    FROM  t
    GROUP BY 
           col_1
          /*...*/ 
          ,col_n
  )t1); 
--COMMIT;


-- Инфо о нужной таблице
-- Например количество строк, чтобы не делать SELECT count(1), можно найти в табл. all_tables
SELECT num_rows FROM all_tables WHERE table_name = 'MOBILE_MONTH_TRANSACTIONS'
