select * from  user_objects  -- Смотрим таблицу user_objects со всеми DDL изменениями пользователя
where months_between(sysdate, last_ddl_time) < 6
order by LAST_DDL_TIME desc; 

select * from  user_tab_partitions; -- Смотрим имеющиеся партиции

select * from user_cons_columns; -- Все constraints