-- cur_prc1 program without the use of cursor
declare
	drec dept % rowtype;
begin 
	dbms_output.put_line('Deptno'||'  '||'Dname'||'  '||'Location');
	for drec in (select * from dept) loop
		
		dbms_output.put_line(drec.deptno||'  '||drec.dname||'  '||drec.loc);
	end loop;


end;
/