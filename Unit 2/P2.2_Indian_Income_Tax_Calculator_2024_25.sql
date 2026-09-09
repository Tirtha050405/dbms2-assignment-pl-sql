SET SERVEROUTPUT ON;

DECLARE
    v_seed NUMBER := 5;
    v_gross_salary NUMBER := v_seed * 50000;
    v_taxable_income NUMBER;
    v_tax NUMBER := 0;
    v_monthly_tds NUMBER;
    v_take_home NUMBER;
BEGIN
    v_taxable_income := GREATEST(v_gross_salary - 75000, 0);

    v_tax := CASE
        WHEN v_taxable_income <= 300000 THEN 0
        WHEN v_taxable_income <= 700000 THEN (v_taxable_income - 300000) * 0.05
        WHEN v_taxable_income <= 1000000 THEN 20000 + (v_taxable_income - 700000) * 0.10
        WHEN v_taxable_income <= 1200000 THEN 50000 + (v_taxable_income - 1000000) * 0.15
        WHEN v_taxable_income <= 1500000 THEN 80000 + (v_taxable_income - 1200000) * 0.20
        ELSE 140000 + (v_taxable_income - 1500000) * 0.30
    END;

    v_monthly_tds := v_tax / 12;
    v_take_home := v_gross_salary / 12 - v_monthly_tds;

    DBMS_OUTPUT.PUT_LINE('===== INCOME TAX CALCULATOR 2024-25 =====');
    DBMS_OUTPUT.PUT_LINE('Gross Salary: Rs.' || v_gross_salary);
    DBMS_OUTPUT.PUT_LINE('Standard Deduction: Rs.75000');
    DBMS_OUTPUT.PUT_LINE('Taxable Income: Rs.' || v_taxable_income);
    DBMS_OUTPUT.PUT_LINE('Total Tax: Rs.' || v_tax);
    DBMS_OUTPUT.PUT_LINE('Monthly TDS: Rs.' || ROUND(v_monthly_tds));
    DBMS_OUTPUT.PUT_LINE('Take-home Monthly Salary: Rs.' || ROUND(v_take_home));

    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No tax this year — save more with PPF/ELSS!');
    END IF;
END;
/
