SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_mem (p_course VARCHAR2, p_semester NUMBER) IS
        SELECT member_id, member_name, join_date
        FROM lib_member
        WHERE UPPER(course) = UPPER(p_course)
          AND semester = p_semester;
BEGIN
    FOR r IN c_mem('&course', &semester) LOOP
        DBMS_OUTPUT.PUT_LINE(r.member_id || ' - ' || r.member_name || ' - ' || TO_CHAR(r.join_date, 'DD-MON-YYYY'));
    END LOOP;
END;
/
