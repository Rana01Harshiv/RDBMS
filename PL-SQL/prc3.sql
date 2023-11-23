-- without declaring the varibales direct use define the variables
declare
	drec dept%rowtype;

begin
	select * into drec from dept where deptno = &deptno;

	dbms_output.put_line('Deptno'||'     '||'Dname'||'     '||'Location');
	dbms_output.put_line(drec.deptno||'  '||drec.dname||'   '||drec.loc); 
end;
/