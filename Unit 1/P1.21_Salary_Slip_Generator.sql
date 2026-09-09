SET SERVEROUTPUT ON;

DECLARE
    v_id NUMBER := 100 + MOD(43, 20);
    v_emp employees%ROWTYPE;
    v_da NUMBER;
    v_hra NUMBER;
    v_pf NUMBER;
    v_net NUMBER;
BEGIN
    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = v_id;

    v_da := v_emp.salary * 0.40;
    v_hra := v_emp.salary * 0.20;
    v_pf := v_emp.salary * 0.12;
    v_net := v_emp.salary + v_da + v_hra - v_pf;

    DBMS_OUTPUT.PUT_LINE('==============================================');
    DBMS_OUTPUT.PUT_LINE('              LJ COMPANY SALARY SLIP          ');
    DBMS_OUTPUT.PUT_LINE('              ' || TO_CHAR(SYSDATE, 'Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('==============================================');
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp.employee_id);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Basic Salary', 25) || LPAD(TO_CHAR(v_emp.salary, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('DA (40%)', 25) || LPAD(TO_CHAR(v_da, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('HRA (20%)', 25) || LPAD(TO_CHAR(v_hra, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE(RPAD('PF Deduction (12%)', 25) || LPAD(TO_CHAR(v_pf, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Net Pay', 25) || LPAD(TO_CHAR(v_net, '99,99,999.99'), 15));
    DBMS_OUTPUT.PUT_LINE('==============================================');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
END;
/
