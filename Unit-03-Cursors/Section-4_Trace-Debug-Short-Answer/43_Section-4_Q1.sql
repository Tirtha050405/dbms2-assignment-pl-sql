SET SERVEROUTPUT ON;

-- Cause: c_book is a parameterised cursor and is used by a cursor FOR loop.
-- The FOR loop opens, fetches and closes it automatically. After the loop ends,
-- c_book is closed, so checking c_book%ROWCOUNT raises ORA-01001.
-- The CLOSE c_book statement would also be invalid because the cursor is already closed.
-- Correct approach: use a BOOLEAN flag if the goal is to detect whether any row was returned.

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title FROM book WHERE category = p_cat;
    v_found BOOLEAN := FALSE;
BEGIN
    FOR r IN c_book('Database') LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title);
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No books found');
    END IF;
END;
/
