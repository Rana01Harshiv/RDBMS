create or replace
    procedure add_dept
    (vdno in dept.deptno%type,
    vdname in dept.dname%type,
    vdloc in dept.loc%type)
    is
begin
    insert into dept values(vdno,vdname,vdloc);
    dbms_output.put_line('Values added successfulyy in dept');
end;
/