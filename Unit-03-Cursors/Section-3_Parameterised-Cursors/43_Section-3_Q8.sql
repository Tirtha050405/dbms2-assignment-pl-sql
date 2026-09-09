SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_pub (p_country VARCHAR2) IS
        SELECT pub_id, pub_name, city
        FROM publisher
        WHERE UPPER(country) = UPPER(p_country);
    v_found BOOLEAN := FALSE;
BEGIN
    FOR r IN c_pub('&country') LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(r.pub_id || ' - ' || r.pub_name || ' - ' || r.city);
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No publisher found in &country');
    END IF;

    -- A cursor FOR loop closes the cursor automatically, so its cursor variable cannot be safely checked afterward.
    -- Therefore a BOOLEAN flag is used to remember whether any row was returned.
END;
/
