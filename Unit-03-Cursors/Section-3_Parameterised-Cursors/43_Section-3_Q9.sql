SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issue (p_month NUMBER) IS
        SELECT bi.issue_id, b.title, bi.issue_date
        FROM book_issue bi
        JOIN book b ON bi.book_id = b.book_id
        WHERE EXTRACT(MONTH FROM bi.issue_date) = p_month
          AND EXTRACT(YEAR FROM bi.issue_date) = 2026
        ORDER BY bi.issue_date;
BEGIN
    FOR r IN c_issue(&month_no) LOOP
        DBMS_OUTPUT.PUT_LINE(r.issue_id || ' - ' || r.title || ' - ' || TO_CHAR(r.issue_date, 'DD-MON-YYYY'));
    END LOOP;
END;
/
