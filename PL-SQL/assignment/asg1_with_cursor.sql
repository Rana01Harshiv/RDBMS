declare
	vempno emp.empno % type := &vempno;      --take the input from the user 
	cursor ecur is select empno,ename,job from emp where empno = vempno;
	erec ecur%rowtype;
begin
	open ecur;
	loop
		fetch ecur into erec;
		exit when ecur % NOTFOUND;
			dbms_output.put_line('------Employee Deatils: -------');

			dbms_output.put_line('Empno:'||erec.empno);

			dbms_output.put_line('Name:'||erec.ename);

			dbms_output.put_line('Job:'||erec.job);
	end loop;
	close ecur;

end;
/