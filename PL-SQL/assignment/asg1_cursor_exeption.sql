declare
	vempno emp.empno % type := &vempno;
	cursor ecur is select empno,ename,job from emp where empno = vempno;
	erec ecur%rowtype;
begin
	open ecur;
	loop
		fetch ecur into erec;
		exit when ecur%notfound;
			dbms_output.put_line('------Employyee Deatils-----');
	
			dbms_output.put_line('Empno: '||erec.empno);
			dbms_output.put_line('Ename: '||erec.ename);
			dbms_output.put_line('Job: '||erec.job);


	end loop;
	close ecur;

	EXCEPTION 
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('-----No Records found----');


end;
/