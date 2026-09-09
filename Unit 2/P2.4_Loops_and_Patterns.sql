SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_table NUMBER := MOD(v_roll_no, 9) + 2;
    v_height NUMBER := 5 + MOD(v_roll_no, 5);
    v_line VARCHAR2(200);
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PART A: MULTIPLICATION TABLE =====');
    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_table || ' x ' || i || ' = ' || (v_table * i));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART B: TABLES 2 TO 5 =====');
    FOR n IN 2..5 LOOP
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(LPAD(n || ' x ' || i || ' = ' || (n * i), 15));
        END LOOP;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART C: STAR TRIANGLE =====');
    FOR i IN 1..v_height LOOP
        v_line := '';
        FOR j IN 1..i LOOP
            v_line := v_line || '*';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART D: NUMBER PYRAMID =====');
    FOR i IN 1..6 LOOP
        v_line := '';
        FOR j IN 1..i LOOP
            v_line := v_line || j;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART E: REVERSE STAR TRIANGLE =====');
    FOR i IN REVERSE 1..v_height LOOP
        v_line := '';
        FOR j IN 1..i LOOP
            v_line := v_line || '*';
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(v_line);
    END LOOP;
END;
/
