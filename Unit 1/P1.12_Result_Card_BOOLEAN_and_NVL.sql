SET SERVEROUTPUT ON;

DECLARE
    v_m1 NUMBER := MOD(43, 30) + 60;
    v_m2 NUMBER := MOD(43, 30) + 60;
    v_m3 NUMBER := MOD(43, 30) + 60;
    v_m4 NUMBER := MOD(43, 30) + 60;
    v_m5 NUMBER := NULL;
    v_total NUMBER;
    v_pct NUMBER;
    v_passed BOOLEAN;
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    v_pct := ROUND(v_total / 500 * 100, 2);
    v_passed := (v_pct >= 40);

    DBMS_OUTPUT.PUT_LINE('===== RESULT CARD =====');
    DBMS_OUTPUT.PUT_LINE('Subject 1: ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2: ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3: ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4: ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5: ABSENT (NULL)');
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_pct || '%');

    -- BOOLEAN cannot be printed directly with DBMS_OUTPUT.PUT_LINE; convert it to text using IF.
    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/
