-- package

create or replace package hr
as 
	procedure hire(eno in number,s in number)
is 
begin
	insert into emp (empno,sal) values(eno,s);
	commit;
	end hire;
	procedure fire(eno in number)
is 
begin
	delete from emp where empno = eno;
	end fire;
end;
/

-- execute hr.hire(1100,'harshiv',80000);
-- execute hr.fire(1100);