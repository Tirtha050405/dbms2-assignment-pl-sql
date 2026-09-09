SET SERVEROUTPUT ON;

-- Answer:
-- If a parameterised cursor has no DEFAULT value, OPEN c_book; without
-- supplying the required argument causes PLS-00306 (wrong number or types
-- of arguments) at execution/compile-time checking of the OPEN statement.
-- If the parameter has a DEFAULT value, the cursor can be opened without
-- an argument and the default value is used.

DECLARE
    CURSOR c_book (p_cat VARCHAR2 DEFAULT 'Database') IS
        SELECT book_id, title FROM book WHERE category = p_cat;
BEGIN
    OPEN c_book;
    CLOSE c_book;
    DBMS_OUTPUT.PUT_LINE('Cursor opened successfully using the default parameter.');
END;
/
