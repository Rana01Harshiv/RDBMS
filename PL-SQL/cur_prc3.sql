declare
	cursor ecur1 is select empno,ename,e.deptno,dname from emp e , dept d where e.deptno = d.deptno;
	drec ecur1%rowtype;
begin 
	open ecur1;
		dbms_output.put_line('Empno'||'  '||'Ename'||'  '||'Deptno'||'  '||'Dname');
	loop
		fetch ecur1 into drec;
		exit when ecur1 % NOTFOUND;
		dbms_output.put_line(drec.empno||'  '||drec.ename||'  '||drec.deptno||'  '||drec.dname);
	end loop;
	close ecur1;
end;
/