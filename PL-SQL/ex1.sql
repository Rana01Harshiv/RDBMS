declare
	vno number(4);
	vname varchar2(10);
	vdeg varchar2(10);
	cnt number;
begin
	vno := &enterempno;
	select count(*) into cnt from emp where empno = vno;
	if(cnt = 0)then
		dbms_output.put_line('User not found');
	else
		select ename,job into vname,vdeg from emp where empno = vno;
		dbms_output.put_line('ename: '||vname||'job: '||vdeg);
	end if;
end;
/