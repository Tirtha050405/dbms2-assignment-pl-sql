SET SERVEROUTPUT ON;

-- Answer:
-- Without a DEFAULT value, omitting the required parameter in OPEN c_book;
-- produces PLS-00306 (wrong number or types of arguments).
-- This is detected at compilation when the OPEN statement is compiled.
-- With a DEFAULT value, the cursor can be opened without an argument and
-- Oracle uses the default parameter value.

DECLARE
    CURSOR c_book (p_cat VARCHAR2 DEFAULT 'Database') IS
        SELECT book_id, title FROM book WHERE category = p_cat;
BEGIN
    OPEN c_book;
    CLOSE c_book;
    DBMS_OUTPUT.PUT_LINE('Cursor opened successfully using the default parameter.');
END;
/
