SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, price FROM book;
BEGIN
    -- Oracle automatically performs DECLARE/OPEN/FETCH/CLOSE for a cursor FOR loop.
    FOR r IN c_book LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;
END;
/
