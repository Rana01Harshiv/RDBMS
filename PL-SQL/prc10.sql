create or replace trigger bu_try1 
before update on try1 
for each row 
--enable 
declare 
	v_user varchar2(20); 
begin 
	select user into v_user from try1; 
	dbms_output.put_line('you updated a line ' || v_user); 
end; 
/