SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_min NUMBER, p_max NUMBER) IS
        SELECT book_id, title, price
        FROM book
        WHERE price BETWEEN p_min AND p_max
        ORDER BY price;
BEGIN
    FOR r IN c_book(300, 700) LOOP
        DBMS_OUTPUT.PUT_LINE(r.book_id || ' - ' || r.title || ' - Rs.' || r.price);
    END LOOP;
END;
/
