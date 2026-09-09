SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_mem IS
        SELECT member_name, course, semester FROM lib_member ORDER BY member_id;
BEGIN
    FOR r IN c_mem LOOP
        DBMS_OUTPUT.PUT_LINE(r.member_name || ' - ' || r.course || ' - Sem ' || r.semester);
    END LOOP;
END;
/
