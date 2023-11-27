// check the number is prime or not 
declare
	n1 number := &n1;
	cnt number := 0;
begin
	for i in 1..n1
	loop
		if(mod(n1, i) = 0) then
			cnt := cnt +1;
		end if;
	end loop;

	if(cnt = 2) then
		dbms_output.put_line('Prime number');
	else
		dbms_output.put_line('Not Prime number');
	end if;
end;
/