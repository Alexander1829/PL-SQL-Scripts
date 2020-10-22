DELETE FROM "table_name" -- быстро вычистить таблицу от дублирующихся строк
WHERE rowid not in
(
  SELECT ri FROM 
  (
    SELECT min(rowid) as ri 
          ,col_1          
          /*...*/ 
          ,col_n 
    FROM  "table_name"
    GROUP BY 
           col_1
          /*...*/ 
          ,col_n
  )t1); 
--COMMIT;
