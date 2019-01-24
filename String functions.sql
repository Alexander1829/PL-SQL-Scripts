select 
  substr('qwertyqwerty', 2,3)
  ,substr('qwertyqwerty', 3) 
  ,substr('qwertyqwerty', -1) 
  ,substr('qwertyqwerty', -5,3) 
  ,instr('abcdefcd','cd')
  ,instr('abcdefcd','cd',4)
  ,replace('qwertyqwqw', 'qw',1)
  ,replace('qwertyqwqw', 'qw')
  ,translate('abcdeedcba', 'bcde', '1234')
  ,reverse('Hello world!')
  ,lower('aAa')
  ,upper('aAa')
  ,lpad('abcd',10,'0')
  ,rpad('abcd',10,'0')
   
from dual;