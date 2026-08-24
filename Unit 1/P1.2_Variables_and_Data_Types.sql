SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50) := 'Tirtha Brahmbhatt';
    v_marks      NUMBER(5,2) := 86;
    v_percentage NUMBER(5,2);
    v_dob        DATE := TO_DATE('05/04/2007', 'DD/MM/YYYY');
    v_passed     BOOLEAN;
BEGIN
    v_percentage := ROUND((v_marks / 500) * 100, 2);
    v_passed := (v_percentage >= 40);

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('DOB: ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/
