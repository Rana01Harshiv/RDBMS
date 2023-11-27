--cursor programs 

declare
	CURSOR dcur is select * from dept; 
	 --fetch the records in the cursor 
	drec dcur % rowtype;
begin 
	open dcur;
	dbms_output.put_line('Deptno'||'  '||'Dname'||'  '||'Location');
	loop
		fetch dcur into drec;
		exit when dcur % NOTFOUND;
	dbms_output.put_line(drec.deptno||drec.dname||drec.loc);
	end loop;
	close dcur;
end;
/