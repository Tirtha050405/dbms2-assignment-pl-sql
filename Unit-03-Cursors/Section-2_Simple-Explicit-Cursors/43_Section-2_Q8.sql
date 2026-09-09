SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issue IS
        SELECT issue_id, book_id, issue_date
        FROM book_issue
        WHERE return_date IS NULL;
    v_issue_id book_issue.issue_id%TYPE;
    v_book_id book_issue.book_id%TYPE;
    v_issue_date book_issue.issue_date%TYPE;
    v_found BOOLEAN := FALSE;
BEGIN
    OPEN c_issue;
    LOOP
        FETCH c_issue INTO v_issue_id, v_book_id, v_issue_date;
        EXIT WHEN c_issue%NOTFOUND;
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(v_issue_id || ' - Book ' || v_book_id || ' - ' || TO_CHAR(v_issue_date, 'DD-MON-YYYY'));
    END LOOP;
    CLOSE c_issue;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('All books returned');
    END IF;
END;
/
