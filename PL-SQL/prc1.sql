declare 
	cnt number:= &cnt;	
	nm varchar2(20) := '&nm'; 	-- String must be enclosed in '' brackets
begin
	dbms_output.put_line('hello world');
	dbms_output.put_line('number is: '||cnt ||'  '||'name is: '||nm);
end;
/