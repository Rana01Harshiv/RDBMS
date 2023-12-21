create or replace trigger beuptrg 
	before update
	on dept
begin 
	dbms_output.put_line('Update successfulyyy');
end;
/