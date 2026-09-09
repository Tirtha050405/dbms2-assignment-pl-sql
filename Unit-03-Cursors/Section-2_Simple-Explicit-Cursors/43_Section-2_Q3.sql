SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_pub IS
        SELECT pub_id, pub_name, city, country FROM publisher;
    v_pub c_pub%ROWTYPE;
BEGIN
    OPEN c_pub;
    LOOP
        FETCH c_pub INTO v_pub;
        EXIT WHEN c_pub%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_pub.pub_name || ' - ' || v_pub.city || ' - ' || v_pub.country);
    END LOOP;
    CLOSE c_pub;
END;
/
