-- Вычистить таблицу от дублирующихся строк - оставить только уникальные
DELETE FROM "table_name" 
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


--Добавление внешнего ключа
--Добавить внешний ключ к таблице CS_PR_TRANSPORT Т1
ALTER TABLE SCHEM.TBL ADD (
--Название ключа
  CONSTRAINT TBL_FK 
--поле COLUMN_1 в TBL, может быть НЕ уникальным 
  FOREIGN KEY (COLUMN_1) 
--поле ID в SCHEM.TBL2 Т2 первичный ключ => уникальное   
  REFERENCES SCHEM.TBL2 (ID)
  ENABLE VALIDATE);

-- Инфо о нужной таблице
-- Например количество строк, чтобы не делать SELECT count(1) 
SELECT num_rows FROM all_tables WHERE table_name = 'NSM_MONTH_TRANSACTIONS'
