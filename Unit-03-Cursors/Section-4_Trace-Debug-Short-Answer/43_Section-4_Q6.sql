SET SERVEROUTPUT ON;

-- %FOUND: On a cursor that has not been opened, checking c%FOUND raises ORA-01001.
-- %NOTFOUND: On a cursor that has not been opened, checking c%NOTFOUND raises ORA-01001.
-- %ROWCOUNT: On a cursor that has not been opened, checking c%ROWCOUNT raises ORA-01001.
-- %ISOPEN: This is the exception. It can be checked before OPEN and returns FALSE.
--
-- Example:
-- DECLARE
--     CURSOR c IS SELECT title FROM book;
-- BEGIN
--     IF c%FOUND THEN NULL; END IF;       -- ORA-01001
--     IF c%NOTFOUND THEN NULL; END IF;    -- ORA-01001
--     DBMS_OUTPUT.PUT_LINE(c%ROWCOUNT);   -- ORA-01001
--     DBMS_OUTPUT.PUT_LINE(CASE WHEN c%ISOPEN THEN 'TRUE' ELSE 'FALSE' END); -- FALSE
-- END;
-- /

BEGIN
    DBMS_OUTPUT.PUT_LINE('Answer recorded in comments: %ISOPEN returns FALSE before OPEN.');
END;
/
