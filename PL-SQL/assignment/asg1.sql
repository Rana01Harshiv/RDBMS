declare
	vempno emp.empno%type := &vempno;
	vename emp.ename%type; 
	vejob emp.job%type;
begin 
	
	select ename,job into vename,vejob from emp where empno = vempno;
		dbms_output.put_line('Employee Details: ');
		dbms_output.put_line('Name:'||vename);
		dbms_output.put_line('Job:'||vejob);
end;
/