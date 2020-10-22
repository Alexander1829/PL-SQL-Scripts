GRANT select ON scheme1.tab1 TO scheme2; 
GRANT insert, update, delete ON scheme1.tab1 TO scheme2; 
REVOKE insert, update, delete ON scheme1.tab1 FROM scheme2; /*Забрать права*/
GRANT alter ON scheme1.tab1 TO scheme2; 
GRANT all ON scheme1.tab1 TO scheme2; 
GRANT execute ON scheme1.pkg1 TO scheme2;
GRANT create database link TO scheme2; 

---------------
CREATE USER otheruser IDENTIFIED BY unknown_pwd;
GRANT create session TO otheruser;
CREATE USER poweruser IDENTIFIED BY known_pwd;
GRANT create session TO poweruser;
GRANT create database link TO poweruser WITH ADMIN OPTION;
GRANT create any procedure TO poweruser;
GRANT drop any procedure TO poweruser;
GRANT execute any procedure TO poweruser;
