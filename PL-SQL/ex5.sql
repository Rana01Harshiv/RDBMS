create or replace trigger betrg
	before insert 
	on emp for each row
begin 
	insert into dept(deptno,dname,loc) values(:new.deptno,:new.dname,:new.loc);
end;
/