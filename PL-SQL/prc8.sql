variable v_bind1 varchar2(10);
exec :v_bind1 := 'rana';
begin
	:v_bind1 := 'harshiv';
	dbms_output.put_line(:v_bind1);
end;
/

set autoprint on;
variable v_bind2 varchar2(10);
exec :v_bind2 := 'virat';
 