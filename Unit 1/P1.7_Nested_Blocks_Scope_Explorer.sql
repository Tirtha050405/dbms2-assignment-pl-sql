SET SERVEROUTPUT ON;

<<outer>>
DECLARE
    v_city VARCHAR2(30) := 'Ahmedabad';
    v_num NUMBER := 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Outer Block: City = ' || v_city || ', Number = ' || v_num);

    <<middle>>
    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num NUMBER := 200;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Middle Block: City = ' || v_city || ', Number = ' || v_num);
        DBMS_OUTPUT.PUT_LINE('Middle accessing outer city: ' || outer.v_city);

        DECLARE
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner Block: City = ' || v_city || ', Number = ' || v_num);
            DBMS_OUTPUT.PUT_LINE('Inner accessing outer city: ' || outer.v_city);
            DBMS_OUTPUT.PUT_LINE('Inner accessing middle number: ' || middle.v_num);
        END;
    END;

    DBMS_OUTPUT.PUT_LINE('After Middle Block: Outer City = ' || v_city || ', Number = ' || v_num);
END;
/
