/*Создадим пакет и внём процедуру и вспомогательную функцию.  
Процедура будет выводить количество заданных букв в имени и фамилии сотруника.
Внутри процедуры вызовем вспомогательную функцию дважды.
*/

create /*or replace*/ package kk_pkg is
  function kk_f (in_str in varchar2, in_char in char) return integer;
  procedure kk_p (in_lastname in varchar2
                 ,in_firstname in varchar2
                 ,in_lastname_chr in char
                 ,in_firstname_chr in char
                 ,out_num_a_in_lastname out integer
                 ,out_num_a_in_firstname out integer);
end kk_pkg;                 
  
  
create or replace/*or replace*/ package body kk_pkg is  

  function kk_f (in_str in varchar2, in_char in char)
    return integer is
    res integer;
  begin
    res := 0;
    for l in 1..length(in_str) loop
      if substr(in_str, l, 1) = in_char then
        res := res + 1;
      end if;
    end loop;
    return res;
  end;  

  procedure kk_p (in_lastname in varchar2
                 ,in_firstname in varchar2
                 ,in_lastname_chr in char
                 ,in_firstname_chr in char
                 ,out_num_a_in_lastname out integer
                 ,out_num_a_in_firstname out integer) is
  begin
    out_num_a_in_lastname := kk_f(upper(in_lastname), in_lastname_chr);
    out_num_a_in_firstname := kk_f(upper(in_firstname), in_firstname_chr);
  end kk_p; 

end kk_pkg;


/*Проверим результат:
declare 
  n1 integer := 0;
  n2 integer := 0;
begin
  DBMS_OUTPUT.enable;
  kk_pkg.kk_p('Анатольев','Борис','А','Б',n1,n2);
  DBMS_OUTPUT.put_line ('Анатольев Борис' || ' '  || n1 || ' ' ||n2);
  kk_pkg.kk_p('Робин','Барабек','О','А',n1,n2);
  DBMS_OUTPUT.put_line ('Робин Барабек' || ' '  || n1 || ' ' ||n2);
end;
*/