SET SERVEROUTPUT ON;

DECLARE
    c_gst CONSTANT NUMBER := 18;
    v_qty NUMBER := MOD(43, 5) + 2;
    v_price NUMBER := 43 * 100 + 400;
    v_coupon NUMBER;
    v_gross NUMBER;
    v_discount NUMBER;
    v_taxable NUMBER;
    v_cgst NUMBER;
    v_sgst NUMBER;
    v_total NUMBER;
BEGIN
    -- First run: NULL coupon (no coupon).
    v_coupon := NULL;
    v_gross := v_qty * v_price;
    v_discount := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_discount;
    v_cgst := v_taxable * 9 / 100;
    v_sgst := v_taxable * 9 / 100;
    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('===== KIRANA BILL - RUN 1 =====');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price per Item: Rs.' || TO_CHAR(v_price, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Gross: Rs.' || TO_CHAR(v_gross, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon, 'Coupon applied: ' || v_coupon || '%', 'No coupon'));
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || TO_CHAR(v_discount, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Taxable: Rs.' || TO_CHAR(v_taxable, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('CGST @9%: Rs.' || TO_CHAR(v_cgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('SGST @9%: Rs.' || TO_CHAR(v_sgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Final Total: Rs.' || TO_CHAR(v_total, '99,999'));

    -- Second run: 10% coupon.
    v_coupon := 10;
    v_discount := v_gross * NVL(v_coupon, 0) / 100;
    v_taxable := v_gross - v_discount;
    v_cgst := v_taxable * 9 / 100;
    v_sgst := v_taxable * 9 / 100;
    v_total := ROUND(v_taxable + v_cgst + v_sgst);

    DBMS_OUTPUT.PUT_LINE('===== KIRANA BILL - RUN 2 =====');
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_qty);
    DBMS_OUTPUT.PUT_LINE('Price per Item: Rs.' || TO_CHAR(v_price, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Gross: Rs.' || TO_CHAR(v_gross, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon, 'Coupon applied: ' || v_coupon || '%', 'No coupon'));
    DBMS_OUTPUT.PUT_LINE('Discount: Rs.' || TO_CHAR(v_discount, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Taxable: Rs.' || TO_CHAR(v_taxable, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('CGST @9%: Rs.' || TO_CHAR(v_cgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('SGST @9%: Rs.' || TO_CHAR(v_sgst, '99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Final Total: Rs.' || TO_CHAR(v_total, '99,999'));
END;
/
