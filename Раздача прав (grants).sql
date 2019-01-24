/*Раздача прав доступа к объектам текущей схемы для других пользователей*/

Grant select on scheme1.tab1 to scheme2; /*Дать права на SELECT из таблицы TAB1*/
Grant insert, update, delete on scheme1.tab1 to scheme2; /*Дать права на insert, update, delete таблицы TAB1*/
Revoke insert, update, delete on scheme1.tab1 from scheme2; /*Забрать права на insert, update, delete таблицы TAB1*/
Grant alter on scheme1.tab1 to scheme2; /*Дать права на alter таблицы TAB1*/
Grant all on scheme1.tab1 to scheme2; /*Дать все права на таблицу TAB1*/
Grant execute on scheme1.pkg1 to scheme2; /*Дать права на выполнение PKG1*/
Grant create database link to scheme2; /*Дать права на создание ссылки на схему*/

