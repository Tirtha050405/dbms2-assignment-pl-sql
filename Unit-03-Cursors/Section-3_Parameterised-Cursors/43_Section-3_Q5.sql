SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_cat VARCHAR2 DEFAULT 'Database') IS
        SELECT book_id, title, price FROM book WHERE UPPER(category) = UPPER(p_cat);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Default: Database ---');
    FOR r IN c_book LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- Explicit: Networking ---');
    FOR r IN c_book('Networking') LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;
END;
/
