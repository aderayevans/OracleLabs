--############################### Buoi 8    #################################
CREATE OR REPLACE PROCEDURE raise_salary(dno scott_emp.deptno%TYPE, percent NUMBER DEFAULT 0.5) 
IS 
BEGIN 
    UPDATE scott_emp SET sal = sal * ((100 + percent)/100) 
    WHERE deptno = dno; 
    COMMIT; 
END raise_salary;

EXECUTE raise_salary(20,10);

CREATE OR REPLACE FUNCTION GETYEAR(pDate IN Date) 
    RETURN NUMBER IS 
BEGIN 
    RETURN EXTRACT(year from pDate); 
    EXCEPTION 
    WHEN OTHERS THEN RETURN 0; 
END;