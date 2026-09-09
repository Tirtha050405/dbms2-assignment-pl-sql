SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, price
        FROM book
        ORDER BY price DESC;
BEGIN
    OPEN c_book;
    LOOP
        FETCH c_book INTO NULL, NULL, NULL;
        EXIT WHEN c_book%NOTFOUND OR c_book%ROWCOUNT = 5;
    END LOOP;
    CLOSE c_book;
END;
/
