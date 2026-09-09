SET SERVEROUTPUT ON;

DECLARE
    v_employee_id NUMBER := 100 + MOD(43, 7);
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    SELECT first_name, last_name, salary
    INTO v_first_name, v_last_name, v_salary
    FROM employees
    WHERE employee_id = v_employee_id;

    DBMS_OUTPUT.PUT_LINE('===== EMPLOYEE DATA FETCHER =====');
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id);
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_first_name || ' ' || v_last_name ||
                         ' earns Rs.' || v_salary || ' per month.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
END;
/
