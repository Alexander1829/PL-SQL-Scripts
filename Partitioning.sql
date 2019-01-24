CREATE TABLE emp2
 ( empno int,
 ename varchar2(20)
 )
 PARTITION BY HASH (empno)
 ( partition part_1 tablespace p1,
 partition part_2 tablespace p2
 ) 
 
 create tablespace tde_test datafile  size 1m
 
 create tablespace  tde_test TEMPFILE 
 
 create table t2
  ( id varchar2(30) primary key,
  ssn varchar2(11),
  address varchar2(80),
  credit_card varchar2(30)
  )
  tablespace in_the_clear; 
  
 create tablespace in_the_clear datafile '/tmp/in_the_clear.dbf' size 1m 
 
 
  CREATE TABLE emp2 ( empno int, ename varchar2(20) ) PARTITION BY HASH (empno) ( partition part_1 tablespace p1, partition part_2 tablespace p2 ) 
  
  