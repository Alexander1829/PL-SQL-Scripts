CREATE OR REPLACE TRIGGER SCH1.TABLE1_BIR 
BEFORE INSERT ON SCH1.TABLE1 
FOR EACH ROW
BEGIN
  SELECT SEQ_TABLE1.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;

--DROP SEQUENCE SCH1.SEQ_TABLE1;
CREATE SEQUENCE SCH1.SEQ_TABLE1
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER
  NOKEEP
  GLOBAL;



create table kk_rate
(
   rate_date date
  ,currency_code integer
  ,rate number(6,2)  
);
insert into kk_rate values (to_date('22.03.2017','dd.mm.yyyy'), 840, 62.43);
insert into kk_rate values (to_date('23.03.2017','dd.mm.yyyy'), 840, 62.35);
insert into kk_rate values (to_date('22.03.2017','dd.mm.yyyy'), 978, 71.87);
insert into kk_rate values (to_date('22.03.2017','dd.mm.yyyy'), 978, 71.81);

insert into kk_payment values (to_date('23.03.2017','dd.mm.yyyy'), 840, 100,null );
--truncate table kk_payment ; truncate table kk_rate ;
--select * from kk_payment ; select * from kk_rate ;

create table kk_payment
(
   payment_date date
  ,currency_code integer
  ,payment_sum_in_currency number(6,2)
  ,payment_sum_in_rub number(6,2)  
);

create or replace/*or replace*/ trigger kk_trig_biu_kk_payment
  after insert on kk_payment
  for each row
DECLARE
    p_payment_sum_in_rub number(6,2);
begin
    SELECT :new.payment_sum_in_currency * rate
      INTO p_payment_sum_in_rub 
      FROM kk_rate
     WHERE rate_date = :new.payment_date and currency_code = :new.currency_code;

    
    UPDATE kk_payment
       SET payment_sum_in_rub = p_payment_sum_in_rub
     WHERE payment_date = :new.payment_date and currency_code = :new.currency_code;-- and payment_sum_in_currency = :new.payment_sum_in_currency;
END;
    
    
