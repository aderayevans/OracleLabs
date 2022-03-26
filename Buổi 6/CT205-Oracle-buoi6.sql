--############################### Buoi 6    #################################
---------Hinh 35
SET SERVEROUTPUT ON;
DECLARE
    today DATE DEFAULT sysdate;
BEGIN
    dbms_output.put_line('Today is ' || today);
END;
---------Vi du khoi con khoi cha (the parent block and child block)
SET SERVEROUTPUT ON; 
DECLARE 
v_deptno NUMBER(2); 
v_loc VARCHAR2(15); 
BEGIN 
    DECLARE 
    v_dname VARCHAR(10); 
    BEGIN 
        v_dname:= 'SALES'; 
        DBMS_OUTPUT.put_line(v_dname);
        SELECT deptno, loc INTO v_deptno, v_loc 
        FROM scott_dept 
        WHERE dname = v_dname; -- C�u SQL 
        DBMS_OUTPUT.put_line('v_deptno: ' ||  v_deptno || ' and v_loc: ' || v_loc); 
    END;
    -- DBMS_OUTPUT.put_line(v_dname); << PLS-00201: identifier 'V_DNAME' 
    --              must be declared, cannot access to v_dname at the child block
END;
---------%TYPE 
DECLARE
    total_sales NUMBER(20,2); 
    monthlySales total_sales%TYPE; --bi?n monthlySales s? l?y ki?u t? bi?n total_sales
    vEname hr_employees.last_name%TYPE;/* bi?n vEname s? l?y ki?u 
t? ki?u d? li?u c?a c?t last_name trong 
b?ng employee */
BEGIN
    NULL;
END;
---------SUBTYPE
SET SERVEROUTPUT ON; 
DECLARE 
    -- �?nh ngh?a ki?u con BirthDate 
    SUBTYPE BirthDate IS DATE NOT NULL; 
    -- Khai b�o bi?n ki?u BirthDate 
    myBirthDate BirthDate := '26-NOV-1997'; 
BEGIN 
    DBMS_OUTPUT.put_line('My birthday is: ' || myBirthdate); 
END;
---------TABLE
SET SERVEROUTPUT ON; 
DECLARE 
    TYPE Hr_Emp IS TABLE OF HR_employees%ROWTYPE 
    INDEX BY BINARY_INTEGER; 
    emp_tab Hr_Emp; 
    x INTEGER; 
BEGIN 
    SELECT * BULK COLLECT INTO emp_tab 
    FROM HR_employees 
    WHERE salary > 10000; 
    FOR X IN 1..emp_tab.COUNT LOOP 
        dbms_output.put_line(emp_tab(x).FIRST_NAME); 
    END LOOP; 
END;
---------M?nh ?? g�n
SET SERVEROUTPUT ON; 
DECLARE 
    total_sales NUMBER(15,2); 
    emp_id VARCHAR2(9); 
    company_number NUMBER DEFAULT 10; -- Gan gia tri mac dinh 
BEGIN 
    total_sales := 350000; 
    emp_id := 3; 
    dbms_output.put_line('Employee ' || emp_id || 
        ', sold total product value: ' || total_sales); 
END;
---------M?nh ?? l?nh (SQL command) SELECT...INTO
SET SERVEROUTPUT ON; 
DECLARE 
    v_deptno scott_dept.deptno%TYPE; 
    v_loc scott_dept.loc%TYPE; 
BEGIN 
    SELECT deptno, loc INTO v_deptno, v_loc 
    FROM scott_dept 
    WHERE dname = 'SALES'; 
    DBMS_OUTPUT.put_line(v_deptno || ': ' || v_loc ); 
END;
---------M?nh ?? l?nh (SQL command) INSERT, DELETE v� UPDATE
INSERT INTO counts (sales_set, non_sales_set) 
    VALUES (v_sales_count, v_non_sales);
---------M?nh ?? IF
SET SERVEROUTPUT ON; 
DECLARE 
    grade CHAR(1); 
BEGIN 
    grade:= 'B'; 
    IF grade = 'A' THEN 
        dbms_output.put_line('Excellent'); 
    ELSIF grade = 'B' THEN 
        dbms_output.put_line('Very Good'); 
    ELSIF grade = 'C' THEN 
        dbms_output.put_line('Good'); 
    ELSIF grade = 'D' THEN 
        dbms_output. put_line('Fair'); 
    ELSIF grade = 'F' THEN 
        dbms_output.put_line('Poor'); 
    ELSE 
        dbms_output.put_line('No such grade'); 
    END IF; 
END;
---------M?nh ?? CASE
SET SERVEROUTPUT ON; 
DECLARE 
    grade CHAR(1); 
BEGIN 
    grade:= 'B'; 
    CASE grade 
        WHEN 'A' THEN dbms_output.put_line('Excellent');
        WHEN 'B' THEN dbms_output.put_line('Very Good');
        WHEN 'C' THEN dbms_output.put_line('Good'); 
        WHEN 'D' THEN dbms_output.put_line('Fair'); 
        WHEN 'F' THEN dbms_output.put_line('Poor'); 
        ELSE dbms_output.put_line('No such grade'); 
    END CASE; 
END;
---------M?nh ?? Search CASE
SET SERVEROUTPUT ON; 
DECLARE 
    quantity NUMBER; 
    projected NUMBER; 
    needed NUMBER; 
BEGIN 
    quantity:= -10;
    CASE 
        WHEN quantity is null THEN 
            dbms_output.put_line('So luong rong'); 
        WHEN quantity + projected >= needed THEN 
            dbms_output.put_line('So luong ' || quantity || ' dap ung.'); 
        WHEN quantity >= 0 THEN
            dbms_output.put_line('So luong ' || quantity || 'khong du.'); 
    END CASE here; 
EXCEPTION 
    WHEN CASE_NOT_FOUND THEN -- Case kh�ng t�m th?y 
        dbms_output.put_line('So luong da nho hon 0.'); 
END;
---------Exception
SET SERVEROUTPUT ON 
DECLARE 
    a NUMBER:= 6; 
    b NUMBER; 
BEGIN 
    BEGIN 
        b:= 0; 
        a:= a / b; 
    EXCEPTION -- b?t ??u ph?n x? l� ngo?i l?
        WHEN ZERO_DIVIDE THEN -- b?t ngo?i l? chia cho 0 
            DECLARE 
                ma_loi NUMBER:= SQLCODE; -- l?y m� c?a ngo?i l?
                thong_bao VARCHAR2(512):= SQLERRM; -- l?y th�ng b�o 
            BEGIN 
                dbms_output.put_line('Ma loi: ' || ma_loi); 
                dbms_output.put_line('Thong bao loi: ' || thong_bao); 
                dbms_output.put_line('Truoc loi. Gia tri cua a = ' || a); 
                dbms_output.put_line('Truoc loi. Gia tri cua b = ' || b); 
            END; 
        WHEN OTHERS THEN 
            dbms_output.put_line('Khong biet loi gi.');
    END; 
    b:= 7; 
    dbms_output.put_line('Sau loi. Gia tri cua b = ' || b); 
END;
---------programmer-defined exceptions
SET SERVEROUTPUT ON 
DECLARE 
    sl1 NUMBER:= -2; 
    sl2 NUMBER:= 3; 
    tong NUMBER:= 0; 
    sl_phai_duong EXCEPTION;
    FUNCTION myFunc(sl NUMBER) RETURN NUMBER IS BEGIN 
        IF(sl > 0) THEN 
            RETURN sl * 20; 
        ELSE RAISE sl_phai_duong; -- L?nh RAISE k�ch ho?t ngo?i l?
        END IF; 
    END myFunc; 
BEGIN 
    tong:= myFunc(sl2); 
    tong:= tong + myFunc(sl1); 
    dbms_output.put_line('Tong = ' || tong); 
EXCEPTION
    WHEN sl_phai_duong THEN 
        dbms_output.put_line('(Exception) Tong = ' || tong); 
        dbms_output.put_line('Loi xay ra, so luong phai > 0'); 
END;
---------Bai tap co huong dan
--##Cau 1
SET SERVEROUTPUT ON;
DECLARE
    total_sales     NUMBER(15, 2);
    emp_id          VARCHAR(9);
    company_number  NUMBER DEFAULT 10;
BEGIN
    total_sales := 350000;
    emp_id         := 3;
    dbms_output.put_line('Employee ' || emp_id || 
        ', solid total product value: ' || total_sales);
END;
--##Cau 2
set serveroutput on; 
declare 
    ten varchar2(10); 
begin 
    ten := '&Nhap_vao_ten_cua_ban'; 
    dbms_output.put_line('chao ban ' || ten); 
end;
--##Cau 3
SET SERVEROUTPUT ON; 
DECLARE 
    vEname hr_employees.last_name%TYPE; 
    vSalary hr_employees.salary%TYPE; 
BEGIN 
    SELECT last_name,salary INTO vEname,vSalary 
    FROM hr_employees 
    WHERE employee_id=100; 
        DBMS_OUTPUT.PUT_LINE('Name:'||vEname||'. Salary:'|| vSalary); 
END;
--##Cau 4-a
SET SERVEROUTPUT ON; 
DECLARE 
    vEname hr_employees.first_name%TYPE; 
BEGIN 
    SELECT first_name INTO vEname 
    FROM hr_employees 
        WHERE employee_id=120; 
    IF vEname='Matthew' THEN 
        dbms_output.put_line('Wasssssup ' || vEname); 
    ELSE 
        dbms_output.put_line('Hello ' || vEname); 
    END IF;
END;
--##Cau 4-b
SET SERVEROUTPUT ON; 
DECLARE 
    vArea VARCHAR2(20); 
BEGIN 
    SELECT region_id INTO vArea 
        FROM hr_countries 
        WHERE country_id='CA' ; 
    CASE vArea 
        WHEN 1 THEN vArea:='Europe' ; 
        WHEN 2 THEN vArea:='America' ; 
        WHEN 3 THEN vArea:='Asia' ; 
        ELSE vArea:='Other' ; 
    END CASE ; 
    dbms_output.put_line('The Area is ' || vArea) ; 
END;
--##Cau 4-c
SET SERVEROUTPUT ON; 
DECLARE 
    counter NUMBER ; 
BEGIN 
    FOR counter IN 1..4 --t?ng 
    LOOP 
        dbms_output.put(counter) ; 
    END LOOP ; 
    dbms_output.new_line ; 
    FOR counter IN REVERSE 1..4 -- gi?m 
    LOOP 
        dbms_output.put(counter) ; 
    END LOOP ; 
    dbms_output.new_line ; 
END;
