alter table tblname add constraint tblname_pk primary key (id);
alter table tblname drop constraint tblname_pk; 

alter table tblname add constraint tblname_id_unique unique(id); 
--alter table tblname drop constraint tblname_id_unique; 
alter table tblname add check (column_1 > 0);

alter table tblname modify colname number(38); 
create index tblname_colname_idx on tblname(colname); 
create index tblname_idx on tblname( nvl(x,-1) );
create index tblname_idx2 on tblname(owner,object_type,object_name);
create index tblname_funcname_colname_idx on tblname(funcname(colname));
--drop index tblname_colname_idx;

alter table tblname add newcol varchar2(4000); select * from tblname;
alter table tblname modify newcol varchar2(1000); 
alter table tblname drop column newcol;
ALTER SYSTEM SET ENCRYPTION KEY identified by passwd2;
alter system set encryption wallet open identified by passwd; 
alter table tblname modify ncol encrypt; 
ALTER SYSTEM SET ENCRYPTION WALLET close IDENTIFIED BY passwd;
