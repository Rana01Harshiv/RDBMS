
declare 

    vempno emp.empno%type := &vempno; -- user input
    vname emp.ename%type;
    vjob emp.job%type;
    cnt number;

begin

    select count(*) into cnt from emp where empno = vempno;

    if(cnt = 0) then
        dbms_output.put_line('User is not found');
    else 
        select ename,job into vname,vjob from emp where empno = vempno;
        dbms_output.put_line('Empno: '||vempno || ' Name: ' || vname || ' Job: '|| vjob );
    end if;

end;
/

----------------------------------- Same program by using cursor--------------------

declare
    vempno1 emp.empno%type := &vempno1;  -- user input
    cursor ecur is select empno,ename,job from emp where empno = vempno1;
    erec ecur%rowtype;

begin
    open ecur;
    loop    
        fetch ecur into erec;
        exit when ecur % NOTFOUND;
            dbms_output.put_line('Empno: '||erec.empno||' Ename: '||erec.ename || ' Job: '||erec.job );    
    end loop;
    close ecur;
end;
/