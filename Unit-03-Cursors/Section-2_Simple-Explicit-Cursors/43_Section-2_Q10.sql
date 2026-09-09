SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, stock FROM book WHERE stock < 5;
    v_count NUMBER := 0;
BEGIN
    FOR r IN c_book LOOP
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Stock: ' || r.stock || ' - REORDER');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Books to reorder: ' || v_count);
END;
/
