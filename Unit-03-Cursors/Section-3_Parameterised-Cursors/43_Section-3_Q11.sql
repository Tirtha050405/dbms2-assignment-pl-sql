SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_cat)
        FOR UPDATE OF price;
    v_old_price book.price%TYPE;
    v_new_price book.price%TYPE;
BEGIN
    FOR r IN c_book('&category') LOOP
        v_old_price := r.price;
        v_new_price := ROUND(v_old_price * 1.10, 2);

        UPDATE book
        SET price = v_new_price
        WHERE CURRENT OF c_book;

        DBMS_OUTPUT.PUT_LINE(r.title || ' - Old Price: Rs.' || v_old_price || ' - New Price: Rs.' || v_new_price);
    END LOOP;
    COMMIT;
END;
/
