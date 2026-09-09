SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book (p_pub_name VARCHAR2) IS
        SELECT b.title, b.price
        FROM book b
        JOIN publisher p ON b.pub_id = p.pub_id
        WHERE UPPER(p.pub_name) = UPPER(p_pub_name);
BEGIN
    FOR r IN c_book('&publisher_name') LOOP
        DBMS_OUTPUT.PUT_LINE(r.title || ' - Rs.' || r.price);
    END LOOP;
END;
/
