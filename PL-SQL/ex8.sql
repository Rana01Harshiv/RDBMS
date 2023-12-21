-- package declarion 
create or replace package hr
as 
	procedure hire(eno in number,s in number);
	procedure fire(eno in number);
end;
/
-- ex9 is package body