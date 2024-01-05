-------parameterized cursor--------------
declare
    cursor dcur(vdeptno dept.deptno%type) is select * from dept;
    drec dcur%rowtype;

    cursor ecur(vdeptno emp.deptno%type) is select empno,ename,job,sal,deptno from emp;
    erec ecur%rowtype;
    cnt number;
    maxi number;
    mini number;
    total number;
begin 
    dbms_output.put_line('--------------------------------');

    for i in dcur(drec.deptno)
    loop
        dbms_output.put_line('Deptno        Dname       Loc');
        select count(*) into cnt from emp where emp.deptno = i.deptno;
        if(cnt!=0) then
            select max(sal),min(sal),sum(sal) into maxi,mini,total from emp where emp.deptno = i.deptno; 
            dbms_output.put_line(i.deptno||'     '||i.dname||'    '||i.loc);
            dbms_output.put_line('--------------------------------');
            dbms_output.put_line('Empno     Ename       Job     Sal     ');
    
    for j in ecur(erec.deptno)
    loop    
        if(j.deptno = i.deptno) then 
            dbms_output.put_line(j.empno||'     '||j.ename||'   '||j.job||'     '||j.sal);
        end if;
    end loop;
    
        dbms_output.put_line('--------------------------------');
        dbms_output.put_line('Maximum: '||maxi);
        dbms_output.put_line('Minimum: '||mini);
        dbms_output.put_line('Total: '||total);
        dbms_output.put_line('--------------------------------');


        end if;
        
    end loop;



end;
/