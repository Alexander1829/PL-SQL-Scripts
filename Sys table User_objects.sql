--Таблицы с общей информацией по базе

select * from  user_objects   
where months_between(sysdate, last_ddl_time) < 6
order by LAST_DDL_TIME desc; 

select * from  user_tab_partitions; 

select * from user_cons_columns; 
