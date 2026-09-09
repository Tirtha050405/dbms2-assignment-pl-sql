SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100) := 'Tirtha Brahmbhatt';
    v_dob DATE := TO_DATE('05-04-2007', 'DD-MM-YYYY');
    v_roll NUMBER := 43;
    v_pnr VARCHAR2(30);
    v_jdate DATE;
    v_fare NUMBER;
    v_age NUMBER;
    v_final_fare NUMBER;
BEGIN
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll, 4, '0');
    v_jdate := SYSDATE + (MOD(v_roll, 30) + 1);
    v_fare := v_roll * 50 + 200;
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    IF v_age >= 60 THEN
        v_final_fare := v_fare * 0.60;
    ELSE
        v_final_fare := v_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('IRCTC RAILWAY TICKET', 40));
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Passenger:', 18) || v_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('PNR:', 18) || v_pnr);
    DBMS_OUTPUT.PUT_LINE(RPAD('Journey Date:', 18) || TO_CHAR(v_jdate, 'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Age:', 18) || v_age);
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Fare:', 18) || 'Rs.' || TO_CHAR(v_fare, '99,999'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Final Fare:', 18) || 'Rs.' || TO_CHAR(v_final_fare, '99,999'));
    IF v_age >= 60 THEN
        DBMS_OUTPUT.PUT_LINE(RPAD('Concession:', 18) || '40% Senior Citizen');
    ELSE
        DBMS_OUTPUT.PUT_LINE(RPAD('Concession:', 18) || 'None');
    END IF;
    DBMS_OUTPUT.PUT_LINE('========================================');
END;
/

-- Test the senior-citizen concession by changing v_dob to TO_DATE('01-01-1960','DD-MM-YYYY').
