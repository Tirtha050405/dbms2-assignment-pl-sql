SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issue (p_member_id NUMBER) IS
        SELECT b.title, bi.issue_date
        FROM book_issue bi
        JOIN book b ON bi.book_id = b.book_id
        JOIN lib_member m ON bi.member_id = m.member_id
        WHERE m.member_id = p_member_id
        ORDER BY bi.issue_date;
BEGIN
    FOR r IN c_issue(&member_id) LOOP
        DBMS_OUTPUT.PUT_LINE(r.title || ' - ' || TO_CHAR(r.issue_date, 'DD-MON-YYYY'));
    END LOOP;
END;
/
