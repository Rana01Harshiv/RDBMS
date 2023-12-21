declare
	veno number;
	vname varchar2(20);
	vmgr varchar2(10);
begin 
	dbms_output.put_line('empno'||'ename'||'managername');
	for i in (select e.empno veno,e.ename vname,e1.mgr vmgr from emp e ,emp e1 where e.mgr = e1.empno)
	loop
		dbms_output.put_line(i.veno||i.vname||i.vmgr);
	end loop;


end;
/