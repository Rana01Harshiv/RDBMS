-------------

declare 

    cursor ecur is select empno,ename,job,sal,mgr from emp;
    erec ecur%rowtype;

    vmgr emp.ename%type := 'None';

begin
    dbms_output.put_line('Empno     Ename      Job      Sal     Managername');
    open ecur;
    loop    
        fetch ecur into erec;
        exit when ecur%NOTFOUND;
            if erec.mgr is not null then
                select ename into vmgr from emp where emp.empno = erec.mgr;
            end if;
                dbms_output.put_line(erec.empno||'  '||erec.ename||'  '||erec.job||'   '||erec.sal||'   '||vmgr);
    end loop;
    close ecur;
end;
/