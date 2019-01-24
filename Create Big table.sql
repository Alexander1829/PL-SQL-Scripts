-- Различные варианты создания больших тестовых таблиц.
create table bigtab
as
select rownum id, a.*
  from all_objects a
 where 1=0;
alter table bigtab nologging;

declare
    l_cnt  number;
    l_rows number := 1000000;
begin    
    insert /*+ append*/
    into bigtab
    select rownum, a.*
      from all_objects a;
    l_cnt := sql%rowcount;
    commit; 

--l_cnt := sql%rowcount;
    -- Generate Rows
    while (l_cnt < l_rows)
    loop
        insert /*+ APPEND */ into bigtab (id,
               OWNER, OBJECT_NAME, SUBOBJECT_NAME,
               OBJECT_ID, DATA_OBJECT_ID,
               OBJECT_TYPE, CREATED, LAST_DDL_TIME,
               TIMESTAMP, STATUS, TEMPORARY,
               GENERATED, SECONDARY, namespace)
        select rownum+l_cnt,
               OWNER, OBJECT_NAME, SUBOBJECT_NAME,
               OBJECT_ID, DATA_OBJECT_ID,
               OBJECT_TYPE, CREATED, LAST_DDL_TIME,
               TIMESTAMP, STATUS, TEMPORARY,
               GENERATED, SECONDARY, namespace
          from bigtab
         where rownum <= l_rows-l_cnt;
        l_cnt := l_cnt + sql%rowcount;
        commit;
    end loop;
end;

--select count(1) from bigtab;

----------------------------------------
CREATE TABLE bigtab2 (
   id         NUMBER,
   weight     NUMBER,
   adate      DATE
);

INSERT INTO bigtab2 (id, weight, adate)
SELECT MOD(ROWNUM,1000),
       DBMS_RANDOM.RANDOM,
       SYSDATE-1000+DBMS_RANDOM.VALUE(0,1000)
 FROM all_objects;
 
 
---------------------------------------- 
create table bigtab3 (
    id      number(12,6),
    v1      varchar2(10),
    padding varchar2(50)
)
nologging   -- just to save a bit of time
/

insert /*+ append ordered full(s1) use_nl(s2) */
into bigtab3
select
        3000 + trunc((rownum-1)/500,6),
        to_char(rownum),
        rpad('x',50,'x')
from
        all_objects s1,      -- you’ll need the privilege
        all_objects s2
where
        rownum <= 1000000
/
commit; 

----------------------------------------

--A Table with Date's which can be used for Partition Tests .This code is from http://www.oracle-base.com

CREATE TABLE bigtab4 (
  id            NUMBER(10),
  created_date  DATE,
  lookup_id     NUMBER(10),
  data          VARCHAR2(50)
);

DECLARE
  l_lookup_id    NUMBER(10);
  l_create_date  DATE;
BEGIN
  FOR i IN 1 .. 1000000 LOOP
    IF MOD(i, 3) = 0 THEN
      l_create_date := ADD_MONTHS(SYSDATE, -24);
      l_lookup_id   := 2;
    ELSIF MOD(i, 2) = 0 THEN
      l_create_date := ADD_MONTHS(SYSDATE, -12);
      l_lookup_id   := 1;
    ELSE
      l_create_date := SYSDATE;
      l_lookup_id   := 3;
    END IF;

    INSERT INTO bigtab4 (id, created_date, lookup_id, data)
    VALUES (i, l_create_date, l_lookup_id, 'This is some data for ' || i);
  END LOOP;
  COMMIT;
END;
