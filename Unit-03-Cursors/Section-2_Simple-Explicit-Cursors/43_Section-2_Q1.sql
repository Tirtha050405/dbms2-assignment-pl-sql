SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, price FROM book;
    v_book_id book.book_id%TYPE;
    v_title book.title%TYPE;
    v_price book.price%TYPE;
BEGIN
    OPEN c_book;
    LOOP
        FETCH c_book INTO v_book_id, v_title, v_price;
        EXIT WHEN c_book%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_book_id || ' - ' || v_title || ' - Rs.' || v_price);
    END LOOP;
    CLOSE c_book;
END;
/
