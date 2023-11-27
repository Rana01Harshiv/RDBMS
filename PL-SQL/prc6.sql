// patterns program 
/*

****
***
**
*

*/

declare 
	row number := &row;
begin
 	for i in 1..row
	loop
		for j in i..row
		loop
			dbms_output.put('*');
		end loop;
		dbms_output.put_line('');
	end loop;
end;
/