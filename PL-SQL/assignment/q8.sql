----------

declare
    
    cursor ecur is select e.empno,e.ename,e.deptno,d.dname dename from emp e,dept d where e.deptno = d.deptno; 
    erec ecur%rowtype;

    cursor ccur(vempno emp.empno%type) is select custid,name,city,repid from customer where repid = vempno;
    crec ccur%rowtype;

    cursor ocr(vcustid customer.custid%type) is select ordid,orderdate,total,custid from ord where custid = vcustid;
    orec ocr%rowtype;
    cnt number;
    tot number;

begin
    
    for i in ecur
    loop
        select count(*) into cnt from customer where repid = i.empno;
        
        if(cnt != 0) then
            
            dbms_output.put_line('Empno:    Ename:    Deptno:    Dname:   ');
            dbms_output.put_line(i.empno||'     '||i.ename||'       '||i.deptno||'       '||i.dename);

        for j in ccur(erec.empno)
        loop

            dbms_output.put_line('Custid:        Custname:      City:     ');
            dbms_output.put_line(j.custid||'         '||j.name||'        '||j.city);
            dbms_output.put_line('ordid:        orderdate:      ordamt:     ');
            select sum(total) into tot from ord where custid = j.custid;

            for m in ocr(orec.custid)
            loop
                dbms_output.put_line(m.ordid||'     '||m.orderdate||'   '||m.total);
            end loop;
                dbms_output.put_line('Total amount: '||tot);
        end loop;
        end if;
    end loop;
end;
/