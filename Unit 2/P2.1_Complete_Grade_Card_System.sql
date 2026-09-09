SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_m1 NUMBER := 43;
    v_m2 NUMBER := 53;
    v_m3 NUMBER := 63;
    v_m4 NUMBER := 73;
    v_m5 NUMBER := 83;
    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(20);
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + v_m5;
    v_percentage := v_total / 5;

    IF v_percentage >= 90 THEN
        v_grade := 'A+';
    ELSIF v_percentage >= 80 THEN
        v_grade := 'A';
    ELSIF v_percentage >= 70 THEN
        v_grade := 'B';
    ELSIF v_percentage >= 60 THEN
        v_grade := 'C';
    ELSIF v_percentage >= 50 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'FAIL';
    END IF;

    IF v_m1 < 35 OR v_m2 < 35 OR v_m3 < 35 OR v_m4 < 35 OR v_m5 < 35 THEN
        v_result := 'DETAINED';
        DBMS_OUTPUT.PUT_LINE('Failed Subject(s):');
        IF v_m1 < 35 THEN DBMS_OUTPUT.PUT_LINE('Subject 1'); END IF;
        IF v_m2 < 35 THEN DBMS_OUTPUT.PUT_LINE('Subject 2'); END IF;
        IF v_m3 < 35 THEN DBMS_OUTPUT.PUT_LINE('Subject 3'); END IF;
        IF v_m4 < 35 THEN DBMS_OUTPUT.PUT_LINE('Subject 4'); END IF;
        IF v_m5 < 35 THEN DBMS_OUTPUT.PUT_LINE('Subject 5'); END IF;
    ELSE
        v_result := 'PASS';
        IF v_percentage >= 75 THEN
            DBMS_OUTPUT.PUT_LINE('Class: Distinction');
        ELSIF v_percentage >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('Class: First');
        ELSIF v_percentage >= 50 THEN
            DBMS_OUTPUT.PUT_LINE('Class: Second');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Class: Pass');
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('===== REPORT CARD =====');
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('Subject 1: ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2: ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3: ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4: ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5: ' || v_m5);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
END;
/
