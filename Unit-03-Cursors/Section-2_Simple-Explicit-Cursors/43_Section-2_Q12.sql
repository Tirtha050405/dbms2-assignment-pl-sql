SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, stock
        FROM book
        WHERE category = 'Database'
        FOR UPDATE OF stock;
    v_old_stock book.stock%TYPE;
BEGIN
    FOR r IN c_book LOOP
        v_old_stock := r.stock;
        UPDATE book
        SET stock = stock + 10
        WHERE CURRENT OF c_book;
        DBMS_OUTPUT.PUT_LINE(r.title || ' - Old Stock: ' || v_old_stock || ' - New Stock: ' || (v_old_stock + 10));
    END LOOP;
    COMMIT;
END;
/
