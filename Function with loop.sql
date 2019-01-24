/* Задача: Требуется подсчитать количество вхождений подстроки в строку? */
create /*or replace*/ function f_count_substr (in_string in varchar2
                                          ,in_substring in varchar2) 
return integer is
  v_result integer := 0;
  v_str varchar2(4000);
begin
  v_str := in_string;
  while instr(v_str, in_substring) > 0 loop
    v_result := v_result + 1;
    v_str := substr(v_str,
                    instr(v_str,in_substring) + length(in_substring));
  end loop;
  return v_result;
end f_count_substr; 

/* Протестируем результат
select f_count_substr('перерезать', 'ере'),
       f_count_substr('скакалка', 'ка')
from dual;
*/