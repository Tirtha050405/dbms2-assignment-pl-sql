SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_name VARCHAR2(100) := 'Tirtha Brahmbhatt';
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
    v_lucky_number NUMBER;
BEGIN
    v_lucky_number := MOD(v_roll_no, 7) + 1;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE(v_message);
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky_number);
END;
/
