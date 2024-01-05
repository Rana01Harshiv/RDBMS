---------normal data display for particular department and thier respective employees
/*

create or replace procedure dept_emp_info
is
vmgr emp.ename%type;
cnt number;

begin

    for drec in (select * from dept)
    loop
        select count(*) into cnt from emp where emp.deptno = drec.deptno;
        if(cnt != 0) then

            dbms_output.put_line('----------------------------------');
            dbms_output.put_line('Deptno        Dname       Location');
            dbms_output.put_line(drec.deptno||'        '||drec.dname||'       '||drec.loc);
            dbms_output.put_line('----------------------------------');
            dbms_output.put_line('Empno     Ename       Job     Salary');

        for erec in (select empno,ename,job,sal from emp where deptno = drec.deptno)
        loop
            dbms_output.put_line(erec.empno||'     '||erec.ename||'      '||erec.job||'      '||erec.sal);
        end loop;
        end if;
    end loop;

end;
/

*/


--- display with proper aligment and show maximum minimum

create or replace procedure dept_emp_info
(vdeptno IN dept.deptno%type)
is
cnt number;
maxi number;
mini number;
total number;

begin
    select count(*) into cnt from dept where deptno = vdeptno;
    if (cnt >0) then
        dbms_output.put_line('Deptno        Dname       Location');
        
        for i in (select * from dept where deptno = vdeptno)
        loop
            select max(sal),min(sal),sum(sal) into maxi,mini,total from emp where deptno = vdeptno;
            dbms_output.put_line(i.deptno||'    '||i.dname||'   '||i.loc);
            dbms_output.put_line('--------------------------------------');
            dbms_output.put_line('Empno      Ename       Job         Salary');
        for j in (select empno,ename,job ,sal from emp where deptno = vdeptno)
        loop
            dbms_output.put_line(j.empno||'     '||j.ename||'       '||j.job||'     '||j.sal);
        end loop;
        dbms_output.put_line('--------------------------------------');
        dbms_output.put_line('Maximum: '||maxi);
        dbms_output.put_line('Minimum: '||mini);
        dbms_output.put_line('Total: '||total);
        dbms_output.put_line('--------------------------------------');

        end loop;

    end if;
end;
/