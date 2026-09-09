SET SERVEROUTPUT ON;

DECLARE
    v_monthly_salary NUMBER := 100000;
    v_existing_emi NUMBER := 10000;
    v_loan_amount NUMBER := 5000000;
    v_annual_rate NUMBER := 10;
    v_tenure_months NUMBER := 240;
    v_monthly_rate NUMBER;
    v_emi NUMBER;
    v_foir_limit NUMBER;
    v_available_emi NUMBER;
    v_max_loan NUMBER;
    v_approved_amount NUMBER;
    v_decision VARCHAR2(20);
    v_temp_loan NUMBER;
    v_factor NUMBER;
BEGIN
    v_monthly_rate := v_annual_rate / 12 / 100;
    v_foir_limit := v_monthly_salary * 0.40;
    v_available_emi := v_foir_limit - v_existing_emi;
    v_max_loan := v_monthly_salary * 60;

    IF v_monthly_rate = 0 THEN
        v_emi := v_loan_amount / v_tenure_months;
    ELSE
        v_factor := POWER(1 + v_monthly_rate, v_tenure_months);
        v_emi := v_loan_amount * v_monthly_rate * v_factor / (v_factor - 1);
    END IF;

    IF v_monthly_salary < 25000 THEN
        v_approved_amount := 0;
    ELSIF v_loan_amount > v_max_loan THEN
        v_approved_amount := v_max_loan;
    ELSE
        v_approved_amount := v_loan_amount;
    END IF;

    v_temp_loan := v_approved_amount;

    WHILE v_temp_loan > 0 LOOP
        IF v_monthly_rate = 0 THEN
            v_emi := v_temp_loan / v_tenure_months;
        ELSE
            v_factor := POWER(1 + v_monthly_rate, v_tenure_months);
            v_emi := v_temp_loan * v_monthly_rate * v_factor / (v_factor - 1);
        END IF;

        EXIT WHEN v_emi <= v_available_emi;
        v_temp_loan := v_temp_loan - 10000;
    END LOOP;

    IF v_monthly_salary < 25000 OR v_temp_loan <= 0 THEN
        v_decision := 'REJECTED';
        v_approved_amount := 0;
    ELSE
        v_approved_amount := v_temp_loan;
        v_decision := CASE
            WHEN v_approved_amount = v_loan_amount THEN 'APPROVED'
            ELSE 'CONDITIONAL'
        END;
    END IF;

    IF v_approved_amount > 0 THEN
        IF v_monthly_rate = 0 THEN
            v_emi := v_approved_amount / v_tenure_months;
        ELSE
            v_factor := POWER(1 + v_monthly_rate, v_tenure_months);
            v_emi := v_approved_amount * v_monthly_rate * v_factor / (v_factor - 1);
        END IF;
    ELSE
        v_emi := 0;
    END IF;

    DBMS_OUTPUT.PUT_LINE('===== LOAN EMI AFFORDABILITY CHECKER =====');
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: Rs.' || v_monthly_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI: Rs.' || v_existing_emi);
    DBMS_OUTPUT.PUT_LINE('Requested Loan: Rs.' || v_loan_amount);
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || v_annual_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure: ' || v_tenure_months || ' months');
    DBMS_OUTPUT.PUT_LINE('FOIR Limit: Rs.' || ROUND(v_foir_limit));
    DBMS_OUTPUT.PUT_LINE('Available EMI Capacity: Rs.' || ROUND(v_available_emi));
    DBMS_OUTPUT.PUT_LINE('Calculated EMI: Rs.' || ROUND(v_emi));
    DBMS_OUTPUT.PUT_LINE('Approved Amount: Rs.' || v_approved_amount);
    DBMS_OUTPUT.PUT_LINE('Decision: ' || v_decision);
    DBMS_OUTPUT.PUT_LINE('Monthly Cost: Existing EMI Rs.' || v_existing_emi || ' + New EMI Rs.' || ROUND(v_emi) || ' = Rs.' || ROUND(v_existing_emi + v_emi));
END;
/
