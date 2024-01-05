----------
----wrong code right is below this
/*

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

*/


DECLARE

    CURSOR emp_cur IS
        SELECT e.empno, e.ename, e.deptno, d.dname AS dename
        FROM emp e, dept d
        WHERE e.deptno = d.deptno;

    emp_rec emp_cur%ROWTYPE;

    CURSOR cust_cur (v_empno emp.empno%TYPE) IS
        SELECT c.custid, c.name, c.city
        FROM customer c
        WHERE c.repid = v_empno;

    cust_rec cust_cur%ROWTYPE;

    CURSOR order_cur (v_custid customer.custid%TYPE) IS
        SELECT o.ordid, o.orderdate, o.total
        FROM ord o
        WHERE o.custid = v_custid;

    order_rec order_cur%ROWTYPE;

    total_amt NUMBER;
BEGIN
    FOR emp_rec IN emp_cur LOOP
        DBMS_OUTPUT.PUT_LINE('Empno: ' || emp_rec.empno || ' Name: ' || emp_rec.ename || ' Deptno: ' || emp_rec.deptno || ' Dept Name: ' || emp_rec.dename);
        DBMS_OUTPUT.PUT_LINE('Custid Name City');
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------');

        FOR cust_rec IN cust_cur(emp_rec.empno) LOOP
            DBMS_OUTPUT.PUT_LINE(cust_rec.custid || ' ' || cust_rec.name || ' ' || cust_rec.city);

            DBMS_OUTPUT.PUT_LINE('Ordid OrderDate OrderAmount');
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------');

            total_amt := 0; -- Reset total amount for each customer

            FOR order_rec IN order_cur(cust_rec.custid) LOOP
                DBMS_OUTPUT.PUT_LINE(order_rec.ordid || ' ' || order_rec.orderdate || ' ' || order_rec.total);
                total_amt := total_amt + order_rec.total;
            END LOOP;

            DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Total Amount: ' || total_amt);
            DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
        END LOOP;
    END LOOP;
END;
/
