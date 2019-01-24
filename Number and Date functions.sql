/*Функции по работе с числами*/
select
     round(3.5)     --4
    ,round(3.1415,2)--3.14
    ,round(3.1415,3)--3.142
    ,trunc(3.5)     --3 
    ,trunc(3.1415,3)--3.141
    ,ceil(3.1415)   --4 --целая часть +1
from dual;

--Alter session set nls_date_format='DD-MON-YYYY'
/*Функции по работе с датами*/
select
     sysdate + 1
    ,sysdate - 1.5
    ,sysdate + 1/24/60
    ,trunc(sysdate)
    ,trunc(sysdate, 'yyyy')
    ,trunc(sysdate, 'mm')
    ,trunc(sysdate, 'dd')
    ,to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss')

    ,to_char(sysdate, 'MON')
    ,to_char(sysdate, 'MONTH')
    ,to_char(sysdate, 'dd-mon-yyyy', 'NLS_DATE_LANGUAGE=''AMERICAN''')
    ,to_char(sysdate, 'dd-mon-yyyy', 'NLS_DATE_LANGUAGE=''RUSSIAN''')
    ,add_months(sysdate,1) 
    ,months_between(to_date('30.11.2017', 'dd.mm.yyyy'),to_date('31.01.2017', 'dd.mm.yyyy')) 
from dual;

