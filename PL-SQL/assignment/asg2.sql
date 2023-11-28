declare
	
	vmgr emp.ename%type := 'None';

begin

	dbms_output.put_line('Empno   ename    job    salary    managername');
	for i in (select empno,ename,job,sal,mgr from emp)
	loop
		if i.mgr is not null then 
		select ename into vmgr from emp where empno = i.mgr;
		end if;
	dbms_output.put_line(i.empno||i.ename||i.job||i.sal||vmgr);
	end loop;
end;
/