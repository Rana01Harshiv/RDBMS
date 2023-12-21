declare 
	a number;
	b number;
	c number;
	one_divide exception;
 
begin
	a:= &a;
	b:= &b;
	if b=1 then
		raise one_divide;
	end if;
	c:=a/b;
	dbms_output.put_line(c);
exception
	when zero_divide then
		dbms_output.put_line('zero divied');
	when one_divide then
		dbms_output.put_line('one divied');
	when others then
		dbms_output.put_line(sqlerrm);


end;
/