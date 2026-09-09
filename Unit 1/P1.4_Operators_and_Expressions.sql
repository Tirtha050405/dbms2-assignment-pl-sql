SET SERVEROUTPUT ON;

DECLARE
    v_employee_id NUMBER := 100 + MOD(43, 9) + 1;
    v_first_name employees.first_name%TYPE;
    v_last_name employees.last_name%TYPE;
    v_salary employees.salary%TYPE;
    v_job_id employees.job_id%TYPE;
    v_department_id employees.department_id%TYPE;
BEGIN
    SELECT first_name, last_name, salary, job_id, department_id
    INTO v_first_name, v_last_name, v_salary, v_job_id, v_department_id
    FROM employees
    WHERE employee_id = v_employee_id;

    DBMS_OUTPUT.PUT_LINE('===== EMPLOYEE DATA FETCHER =====');
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_first_name || ' ' || v_last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_job_id);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_department_id);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || v_salary);
END;
/
