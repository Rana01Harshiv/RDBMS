-----------------function

create or replace function emp_check
(vempno IN emp.empno%type)
return boolean 
is
cnt number;

begin
    select count(*) into cnt from emp where empno = vempno;
    if cnt > 0 then
        return TRUE;
    else 
        return FALSE;
    end if;
end;
/

---- the rest code is execute on q2_1.sql file 
--- this is just function code 