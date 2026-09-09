SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_marks NUMBER := 86;
    v_a NUMBER := 20;
    v_b NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Arithmetic Operators:');
    DBMS_OUTPUT.PUT_LINE('Addition: ' || (v_a + v_b));
    DBMS_OUTPUT.PUT_LINE('Subtraction: ' || (v_a - v_b));
    DBMS_OUTPUT.PUT_LINE('Multiplication: ' || (v_a * v_b));
    DBMS_OUTPUT.PUT_LINE('Division: ' || (v_a / v_b));
    DBMS_OUTPUT.PUT_LINE('Modulus: ' || MOD(v_a, v_b));

    DBMS_OUTPUT.PUT_LINE('Relational Operators:');
    IF v_marks >= 50 THEN
        DBMS_OUTPUT.PUT_LINE('Marks are greater than or equal to 50');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Logical Operators:');
    IF v_roll_no > 0 AND v_marks > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Roll number and marks are valid');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Concatenation: Tirtha Brahmbhatt - Roll No: ' || v_roll_no);
END;
/
