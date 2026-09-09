SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_balance NUMBER := v_roll_no * 500 + 5000;
    v_choice NUMBER := 1;
    v_withdraw NUMBER := 500;
    v_total_withdrawn NUMBER := 0;
    v_successful_txns NUMBER := 0;
    v_iteration NUMBER := 0;
BEGIN
    LOOP
        v_iteration := v_iteration + 1;

        IF v_choice = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Withdrawal Request: Rs.' || v_withdraw);

            IF v_withdraw <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be greater than 0.');
            ELSIF MOD(v_withdraw, 100) <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be a multiple of 100.');
            ELSIF v_withdraw > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal per transaction is Rs.10000.');
            ELSIF v_withdraw > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance.');
            ELSE
                v_balance := v_balance - v_withdraw;
                v_total_withdrawn := v_total_withdrawn + v_withdraw;
                v_successful_txns := v_successful_txns + 1;
                DBMS_OUTPUT.PUT_LINE('Transaction Successful');
                DBMS_OUTPUT.PUT_LINE('Amount Withdrawn: Rs.' || v_withdraw);
                DBMS_OUTPUT.PUT_LINE('Remaining Balance: Rs.' || v_balance);
            END IF;
        ELSIF v_choice = 2 THEN
            DBMS_OUTPUT.PUT_LINE('Balance: Rs.' || v_balance);
        ELSIF v_choice = 3 THEN
            DBMS_OUTPUT.PUT_LINE('ATM Exit Selected.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error: Invalid choice.');
        END IF;

        EXIT WHEN v_choice = 3 OR v_balance = 0 OR v_iteration >= 4;

        IF v_iteration = 1 THEN
            v_withdraw := 1000;
        ELSIF v_iteration = 2 THEN
            v_withdraw := 500;
        ELSE
            v_choice := 3;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== FINAL ATM SUMMARY =====');
    DBMS_OUTPUT.PUT_LINE('Transactions Done: ' || v_successful_txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn: Rs.' || v_total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance: Rs.' || v_balance);
END;
/
