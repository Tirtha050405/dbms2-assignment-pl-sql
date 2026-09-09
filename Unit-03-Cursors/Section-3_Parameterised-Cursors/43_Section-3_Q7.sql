SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_pub IS
        SELECT pub_id, pub_name FROM publisher ORDER BY pub_id;
    CURSOR c_book (p_pub_id NUMBER) IS
        SELECT title, price FROM book WHERE pub_id = p_pub_id ORDER BY book_id;
BEGIN
    FOR p IN c_pub LOOP
        DBMS_OUTPUT.PUT_LINE(p.pub_name || ' (ID ' || p.pub_id || ')');
        FOR b IN c_book(p.pub_id) LOOP
            DBMS_OUTPUT.PUT_LINE('  ' || b.title || ' - Rs.' || b.price);
        END LOOP;
    END LOOP;
END;
/
