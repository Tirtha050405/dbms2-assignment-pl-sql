SET SERVEROUTPUT ON;

DECLARE
    v_celsius NUMBER := MOD(43, 20) + 25;
    v_fahrenheit NUMBER;
    v_kelvin NUMBER;
    v_f NUMBER := 98.6;
    v_c2 NUMBER;
BEGIN
    v_fahrenheit := ROUND(v_celsius * 9 / 5 + 32, 1);
    v_kelvin := v_celsius + 273.15;
    v_c2 := (v_f - 32) * 5 / 9;

    DBMS_OUTPUT.PUT_LINE('===== TEMPERATURE CONVERTER =====');
    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius || ' C');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_fahrenheit || ' F');
    DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_kelvin || ' K');
    DBMS_OUTPUT.PUT_LINE('Reverse Conversion: 98.6 F = ' || ROUND(v_c2, 1) || ' C');
    DBMS_OUTPUT.PUT_LINE('Operator precedence: C*9/5+32 and C*(9/5)+32 give the same result because * and / have equal precedence and are evaluated left to right.');
END;
/
