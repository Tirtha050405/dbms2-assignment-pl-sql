SET SERVEROUTPUT ON;

-- COMPARISON TABLE
--
-- | Feature                  | Implicit Cursor              | Explicit (Simple) Cursor       | Parameterised Cursor                 |
-- |--------------------------|------------------------------|--------------------------------|--------------------------------------|
-- | Who declares it?         | Oracle                       | Programmer                     | Programmer                           |
-- | Who opens/closes it?     | Oracle                       | Programmer                     | Programmer (or FOR loop/Oracle)      |
-- | Reusable with values?    | Not applicable               | No parameters                  | Yes, with different parameter values |
-- | Best choice               | Single SQL/DML operation     | Repeated processing of a fixed query | Same query with different inputs  |

BEGIN
    DBMS_OUTPUT.PUT_LINE('See the comparison table in the comments above.');
END;
/
