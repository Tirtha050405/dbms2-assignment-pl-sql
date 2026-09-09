SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, price FROM book WHERE price > 500;
BEGIN
    OPEN c_book;
    LOOP
        FETCH c_book INTO NULL, NULL, NULL;
        EXIT WHEN c_book%NOTFOUND;
        NULL;
    END LOOP;
    CLOSE c_book;
END;
/
