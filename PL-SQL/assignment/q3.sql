------------------------------
 
declare
    cnt number;
    mini number;
    maxi number;
    tot number;
begin

    for i in(select deptno,dname,loc from dept)
    loop
        select max(sal),min(sal),sum(sal) into maxi,mini,tot from emp where emp.deptno = i.deptno;

        dbms_output.put_line('-----------------------------------');
        dbms_output.put_line('Deptno    Dname    Location');
        dbms_output.put_line(i.deptno||'    '||i.dname||'   '||i.loc);
        dbms_output.put_line('-----------------------------------');

        dbms_output.put_line('Empno    Ename    Job     Sal    Deptno');

        for j in (select empno,ename,job,sal,deptno from emp)
        loop
        
        select count(*) into cnt from emp where j.deptno = i.deptno;
            if(cnt>0) then
                dbms_output.put_line(j.empno||' '||j.ename||'  '||j.job||'  '||j.sal||'     '||j.deptno);
            end if;

        end loop;
        dbms_output.put_line('-----------------------------------');

        dbms_output.put_line('Total salary: '||tot);
        dbms_output.put_line('Maximum salary: '||maxi);
        dbms_output.put_line('Minimum salary: '||mini);
        dbms_output.put_line('-----------------------------------');


    end loop;

end;
/

-------------------------by using cursor----------------------


declare
    cursor ecur is select empno,ename,job,sal,deptno from emp;
    erec ecur%rowtype;
    cursor dcur is select deptno,dname,loc from dept;
    drec dcur%rowtype;
    cnt number;
    maxi number;
    mini number;
    total number;
begin 
    open dcur;
    loop    

        fetch dcur into drec;
        exit when dcur%NOTFOUND;
            select count(*) into cnt from emp where deptno = drec.deptno;
            if(cnt != 0) then
                select max(sal),min(sal),sum(sal) into maxi,mini,total from emp where deptno = drec.deptno;
                dbms_output.put_line('-----------------------------------');
                dbms_output.put_line('Deptno    Dname   Location');
                dbms_output.put_line(drec.deptno||' '||drec.dname||'  '||drec.loc);

                dbms_output.put_line('-----------------------------------');
                dbms_output.put_line('Empno     Ename       Job     Sal     Deptno');

        open ecur;
        loop    
            fetch ecur into erec;
            exit when ecur%NOTFOUND;
                if(erec.deptno = drec.deptno) then
                    dbms_output.put_line(erec.empno||'   '||erec.ename||'    '||erec.job||'  '||erec.sal||'  '||erec.deptno);
                end if;
        end loop;
        close ecur;
        dbms_output.put_line('-----------------------------------');
        dbms_output.put_line('highest: '||maxi);
        dbms_output.put_line('lowest: '||mini);
        dbms_output.put_line('total: '||total);
        dbms_output.put_line('-----------------------------------');

        end if;
    end loop;
    close dcur;
end;
/