create or replace function calc(no1 number,no2 number,op char)
	return number
is
begin
	if(ch=='+') then
		return(a+b);
	elsif(ch=='-') then
		return (a-b);
	elsif(ch =='*') then
		return (a*b);
	else
		return (a/b);
	end if;
end;
/
--select calc(10,90,'+') from dual;