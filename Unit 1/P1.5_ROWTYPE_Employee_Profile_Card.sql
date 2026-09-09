SET SERVEROUTPUT ON;

DECLARE
    v_emp employees%ROWTYPE;
    v_id NUMBER := 100 + MOD(43, 9) + 1;
    v_yrs NUMBER;
BEGIN
    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = v_id;

    v_yrs := TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12);

    DBMS_OUTPUT.PUT_LINE('===== EMPLOYEE PROFILE CARD =====');
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_emp.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(v_emp.salary, 'Rs.99,999'));
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Years of Experience: ' || v_yrs);

    IF v_yrs > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Senior Employee');
    END IF;
END;
/
