SET SERVEROUTPUT ON;

DECLARE
    v_p NUMBER := 43 * 10000 + 50000;
    v_rate NUMBER := 9;
    v_years NUMBER := 5;
    v_r NUMBER;
    v_n NUMBER;
    v_emi NUMBER;
    v_total_payment NUMBER;
    v_total_interest NUMBER;
    v_interest_pct NUMBER;
BEGIN
    v_r := v_rate / 12 / 100;
    v_n := v_years * 12;
    v_emi := ROUND(v_p * v_r * POWER(1 + v_r, v_n) / (POWER(1 + v_r, v_n) - 1), 2);
    v_total_payment := ROUND(v_emi * v_n, 2);
    v_total_interest := ROUND(v_total_payment - v_p, 2);
    v_interest_pct := ROUND(v_total_interest / v_total_payment * 100, 2);

    DBMS_OUTPUT.PUT_LINE('===== HOME LOAN EMI CALCULATOR =====');
    DBMS_OUTPUT.PUT_LINE('Principal: Rs.' || TO_CHAR(v_p, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || v_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure: ' || v_years || ' years');
    DBMS_OUTPUT.PUT_LINE('Monthly EMI: Rs.' || TO_CHAR(v_emi, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total Payment: Rs.' || TO_CHAR(v_total_payment, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total Interest: Rs.' || TO_CHAR(v_total_interest, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Interest as % of Total Payment: ' || v_interest_pct || '%');
END;
/
