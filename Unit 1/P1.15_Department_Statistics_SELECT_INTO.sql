SET SERVEROUTPUT ON;

DECLARE
    v_dept NUMBER := (MOD(43, 6) + 1) * 10;
    v_count NUMBER;
    v_avg NUMBER;
    v_max NUMBER;
BEGIN
    SELECT COUNT(*), ROUND(AVG(salary), 2), MAX(salary)
    INTO v_count, v_avg, v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('===== DEPARTMENT STATISTICS =====');
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_count);
    DBMS_OUTPUT.PUT_LINE('Average Salary: Rs.' || NVL(TO_CHAR(v_avg), 'NULL'));
    DBMS_OUTPUT.PUT_LINE('Maximum Salary: Rs.' || NVL(TO_CHAR(v_max), 'NULL'));

    -- COUNT(*) always returns one aggregate row, even when no employees match; therefore NO_DATA_FOUND is not raised.
END;
/
