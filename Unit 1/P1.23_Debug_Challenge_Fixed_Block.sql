SET SERVEROUTPUT ON;

DECLARE
    -- BUG 1 FIX: Assignment in PL/SQL uses :=, not =.
    v_name VARCHAR2(50) := 'Tirtha Brahmbhatt';
    -- BUG 2 FIX: VARCHAR2(5) was too small for the full name; use VARCHAR2(50).
    -- BUG 3 FIX: A CONSTANT must be initialized when it is declared.
    c_bonus_rate CONSTANT NUMBER := 0.1;
    v_sal NUMBER := 43 * 1000 + 20000;
    v_bonus NUMBER;
    v_fname employees.first_name%TYPE;
BEGIN
    -- BUG 4 FIX: Declaration section must end before BEGIN, and each declaration needs a semicolon.
    v_bonus := v_sal * c_bonus_rate;

    -- BUG 5 FIX: SELECT inside PL/SQL requires an INTO clause.
    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('===== DEBUG CHALLENGE - FIXED =====');
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Employee 100 First Name: ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('Bonus: Rs.' || v_bonus);
END;
/
