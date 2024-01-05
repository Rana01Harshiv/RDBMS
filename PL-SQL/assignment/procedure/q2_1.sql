---

declare
    e_exists boolean;
    eid emp.empno%type := &eid;
begin

    e_exists := emp_check(eid);
    if e_exists then
        dbms_output.put_line('Employee is Exists');

    else
        dbms_output.put_line('Employes is not Exists');
    end if;

end;
/