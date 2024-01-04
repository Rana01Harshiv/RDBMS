-- display all of the employess

declare
    mname emp.ename%type := 'None';
begin

    dbms_output.put_line('Empno     Ename   Job     Sal     Managername');
    for i in (select empno,ename,job,sal,mgr from emp)
    loop
        if i.mgr is not null then
            select ename into mname from emp where emp.empno = i.mgr;
        end if;
        dbms_output.put_line(i.empno||'     '||i.ename||'   '||i.job||'     '||i.sal||'     '||mname);
    end loop;
end;
/



---------------by using cursor------------------

declare
    mname emp.ename%type := 'None';
    cursor ecur is select empno,ename,job,sal,mgr from emp;
    erec ecur%rowtype;
begin 
    dbms_output.put_line('Empno     Ename   Job     Sal     Managername');
    open ecur;
    loop    
        fetch ecur into erec;
        exit when ecur%NOTFOUND;
            if erec.mgr is not null then
                select ename into mname from emp where emp.empno = erec.mgr;
            end if;

            dbms_output.put_line(erec.empno||'  '||erec.ename||'    '||erec.job||'  '||erec.sal||'   '||mname);
    end loop;
    close ecur;
end;
/