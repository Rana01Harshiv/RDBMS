create or replace trigger bi_try1
before insert on try1
for each row 
--enable
declare 
	v_user varchar2(20);
begin 
	select user into v_user from try1;
	dbms_output.put_line('you entered a line ' || v_user);
end;
/