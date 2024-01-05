-----------------

declare
    
    cursor ecur is select empno,ename,job,sal,deptno from emp;
    erec ecur%rowtype;
    
    cursor dcur is select deptno,dname,loc from dept;
    drec dcur%rowtype;
    maxi number;
    mini number;
    total number;
    cnt number;

begin 
    open dcur;
    loop    
        fetch dcur into drec;
        exit when dcur%NOTFOUND;
            select count(*) into cnt from emp where emp.deptno = drec.deptno;
            select max(sal),min(sal),sum(sal) into maxi,mini,total from emp where emp.deptno = drec.deptno; 
            if(cnt != 0) then 
                dbms_output.put_line('------------------------');
                dbms_output.put_line('Deptno    Dname   Loc');
                dbms_output.put_line(drec.deptno||'   '||drec.dname||'   '||drec.loc);
                dbms_output.put_line('------------------------');

                dbms_output.put_line('Empno     Ename   Job     Sal ');
            open ecur;
            loop
                fetch ecur into erec;
                exit when ecur%NOTFOUND;
                    if (erec.deptno = drec.deptno)then
                        dbms_output.put_line(erec.empno||'  '||erec.ename||'     '||erec.job||'      '||erec.sal);
                    end if;
            end loop;
            close ecur;
            dbms_output.put_line('------------------------');
            dbms_output.put_line('Total: '||total);
            dbms_output.put_line('Maximum: '||maxi);
            dbms_output.put_line('Minimum: '||mini);
            dbms_output.put_line('------------------------');
            
            end if;
    end loop;
    close dcur;
end;
/