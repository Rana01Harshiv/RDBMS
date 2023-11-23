--matches the user input deptno value and return that value
-- you can run the multiple plsql file in one file 
DECLARE 
    vdeptno dept.deptno%type := &vdeptno;
    vdname dept.dname%type;
    vloc dept.loc%type;
BEGIN
    SELECT deptno, dname, loc INTO vdeptno, vdname, vloc FROM dept where deptno = vdeptno;
    DBMS_OUTPUT.PUT_LINE(vdeptno || '  ' || vdname || '  ' || vloc);
END;
/




declare 
	vdeptno dept.deptno%type := &vdeptno;
	vdname dept.dname%type;
	vloc dept.loc%type;

begin
	select deptno,dname,loc	into vdeptno,vdname,vloc from dept where deptno = vdeptno;
	dbms_output.put_line('DEPTNO'||'    '||'DEPARTMENT NAME'||'    '||'LOCATION');
	dbms_output.put_line(vdeptno||'  '||vdname||'  '||vloc);
end;
/
