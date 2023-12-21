declare 
	v_name try1.name%type;
begin
	select name into v_name from try1 where no = 3;
	dbms_output.put_line('name of the cricketer is: ' || v_name);
end;
/