------------- parameterized cursor------------

declare
    cursor ecur(vmname emp.ename%type) is select empno,ename,job,sal,mgr from emp;
    erec ecur%rowtype;

    vmname emp.ename%type := 'None'; 

begin 
    dbms_output.put_line('Empno     Ename       Job     Sal     Managername');
    for i in ecur(erec.mgr)
    loop
        if i.mgr is not null then
            select ename into vmname from emp where i.mgr = emp.empno;
        end if;
        dbms_output.put_line(i.empno||'     '||i.ename||'   '||i.job||'     '||i.sal||'     '||vmname);
    end loop;
end;
/