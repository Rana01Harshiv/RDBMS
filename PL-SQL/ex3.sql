create or replace trigger emptrg before insert on dept
begin
	dbms_output.put_line('Record Insert');
end;
/ 