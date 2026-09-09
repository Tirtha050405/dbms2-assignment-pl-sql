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

    IF v_monthly_rate = 0 THEN
        v_emi := v_loan_amount / v_tenure_months;
    ELSE
        v_factor := POWER(1 + v_monthly_rate, v_tenure_months);
        v_emi := v_loan_amount * v_monthly_rate * v_factor / (v_factor - 1);
    END IF;

    v_approved_amount := v_loan_amount;

    IF v_monthly_salary < 25000 THEN
        v_approved_amount := 0;
    ELSIF v_loan_amount > 60 * v_monthly_salary THEN
        v_approved_amount := 60 * v_monthly_salary;
    END IF;

    v_temp_loan := v_approved_amount;

    IF v_monthly_rate = 0 THEN
        WHILE v_temp_loan / v_tenure_months > v_available_emi LOOP
            v_temp_loan := v_temp_loan - 10000;
            IF v_temp_loan < 0 THEN
                v_temp_loan := 0;
                EXIT;
            END IF;
        END LOOP;
    ELSE
        WHILE v_temp_loan > 0 LOOP
            v_factor := POWER(1 + v_monthly_rate, v_tenure_months);
            v_emi := v_temp_loan * v_monthly_rate * v_factor / (v_factor - 1);
            EXIT WHEN v_emi <= v_available_emi;
            v_temp_loan := v_temp_loan - 10000;
        END LOOP;
    END IF;

    IF v_monthly_salary < 25000 OR v_temp_loan <= 0 THEN
        v_decision := 'REJECTED';
        v_approved_amount := 0;
    ELSIF v_temp_loan < v_loan_amount THEN
        v_decision := 'CONDITIONAL';
        v_approved_amount := v_temp_loan;
    ELSE
        v_decision := 'APPROVED';
        v_approved_amount := v_temp_loan;
    END IF;

    IF v_approved_amount > 0 THEN
        v_factor := POWER(1 + v_monthly_rate, v_tenure_months);
        v_emi := v_approved_amount * v_monthly_rate * v_factor / (v_factor - 1);
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
