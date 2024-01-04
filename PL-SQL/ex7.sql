-- procedure programm
-- parameter (in,out,in out)

create or replace 
	procedure raise_sal(e in number,amt in number,s out number)
	is
begin
	update emp set sal = sal +amt 
	where empno = e;
	commit;
	select sal into s from emp where empno = e;
end;
/
-- excution part
--for this program taking the one varible in pl-sql promopt
--after that 

--varibale k number
--execute raise_sal(7788,2000,:k);
--select * from emp;
