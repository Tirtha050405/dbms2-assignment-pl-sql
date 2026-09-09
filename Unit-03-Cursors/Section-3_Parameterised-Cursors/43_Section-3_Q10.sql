SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issue (p_days NUMBER) IS
        SELECT issue_id, book_id, issue_date
        FROM book_issue
        WHERE return_date IS NULL
          AND TRUNC(SYSDATE - issue_date) > p_days
        ORDER BY issue_date;
    v_total_fine NUMBER := 0;
    v_overdue_days NUMBER;
    v_fine NUMBER;
BEGIN
    FOR r IN c_issue(&days) LOOP
        v_overdue_days := TRUNC(SYSDATE - r.issue_date);
        v_fine := v_overdue_days * 2;
        v_total_fine := v_total_fine + v_fine;
        DBMS_OUTPUT.PUT_LINE(r.issue_id || ' - Book ' || r.book_id || ' - Overdue Days: ' || v_overdue_days || ' - Fine: Rs.' || v_fine);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Fine Payable = Rs.' || v_total_fine);
END;
/
