SET SERVEROUTPUT ON;

<<bank>>
DECLARE
    v_bank VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER := 0;
BEGIN
    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_dep NUMBER := 43 * 1000;
    BEGIN
        bank.v_total_deposit := bank.v_total_deposit + v_dep;

        <<counter>>
        DECLARE
            v_token NUMBER := 1;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(v_bank || ' | ' || v_branch || ' | Token ' || v_token);
        END;

        -- Uncommenting the next line causes PLS-00201 because v_token is local to the inner counter block.
        -- DBMS_OUTPUT.PUT_LINE(v_token);
    END;

    DBMS_OUTPUT.PUT_LINE('Total Deposit at Bank Level: Rs.' || bank.v_total_deposit);
END;
/
