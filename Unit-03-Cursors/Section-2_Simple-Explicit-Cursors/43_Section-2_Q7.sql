SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS SELECT book_id, title FROM book;
    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;
BEGIN
    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor already open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is closed - opening now');
        OPEN c_book;
    END IF;

    FETCH c_book INTO v_book_id, v_title;
    IF c_book%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('First book: ' || v_book_id || ' - ' || v_title);
    END IF;

    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open');
    END IF;

    CLOSE c_book;
    DBMS_OUTPUT.PUT_LINE('Cursor ISOPEN after CLOSE = ' || CASE WHEN c_book%ISOPEN THEN 'TRUE' ELSE 'FALSE' END);
END;
/
