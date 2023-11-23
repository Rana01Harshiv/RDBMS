-- if-else expression 
declare 
	n1 number := &n1;
	n2 number := &n2;
	n3 number := &n3;
begin 
	
	if(n1>n2 AND n1>n3) then
		dbms_output.put_line('number1: '||n1||' is biggeer ');
	elsif(n2>n3) then
		dbms_output.put_line('number2: '||n2 || ' is bigger ');
	else
		dbms_output.put_line('number3: '||n3 || ' is bigger ');
	
	END IF;
end;
/