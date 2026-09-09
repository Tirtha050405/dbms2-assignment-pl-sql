SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_n NUMBER := 5 + MOD(v_roll_no, 8);
    v_a NUMBER := 48;
    v_b NUMBER := 18;
    v_x NUMBER;
    v_y NUMBER;
    v_temp NUMBER;
    v_gcd NUMBER;
    v_num NUMBER := 6;
    v_sum NUMBER := 0;
    v_fib1 NUMBER := 0;
    v_fib2 NUMBER := 1;
    v_next NUMBER;
    v_prime BOOLEAN;
    v_count NUMBER := 0;
    v_last_fib NUMBER := 0;
    v_i NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PART A: FIBONACCI =====');
    v_i := 1;
    WHILE v_i <= v_n LOOP
        IF v_i = 1 THEN
            v_last_fib := v_fib1;
            DBMS_OUTPUT.PUT(v_fib1 || ' ');
        ELSIF v_i = 2 THEN
            v_last_fib := v_fib2;
            DBMS_OUTPUT.PUT(v_fib2 || ' ');
        ELSE
            v_next := v_fib1 + v_fib2;
            v_fib1 := v_fib2;
            v_fib2 := v_next;
            v_last_fib := v_next;
            DBMS_OUTPUT.PUT(v_next || ' ');
        END IF;
        v_i := v_i + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Nth Fibonacci Number: ' || v_last_fib);

    DBMS_OUTPUT.PUT_LINE('===== PART B: PRIME CHECK =====');
    v_prime := TRUE;
    IF v_last_fib < 2 THEN
        v_prime := FALSE;
    ELSE
        v_x := 2;
        WHILE v_x <= TRUNC(SQRT(v_last_fib)) LOOP
            IF MOD(v_last_fib, v_x) = 0 THEN
                v_prime := FALSE;
                EXIT;
            END IF;
            v_x := v_x + 1;
        END LOOP;
    END IF;

    IF v_prime THEN
        DBMS_OUTPUT.PUT_LINE(v_last_fib || ' is Prime');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_last_fib || ' is Not Prime');
    END IF;

    DBMS_OUTPUT.PUT_LINE('===== PART C: PRIMES 1 TO 100 =====');
    v_num := 2;
    v_count := 0;
    WHILE v_num <= 100 LOOP
        v_prime := TRUE;
        v_x := 2;
        WHILE v_x <= TRUNC(SQRT(v_num)) LOOP
            IF MOD(v_num, v_x) = 0 THEN
                v_prime := FALSE;
                EXIT;
            END IF;
            v_x := v_x + 1;
        END LOOP;

        IF v_prime THEN
            DBMS_OUTPUT.PUT(v_num || ' ');
            v_count := v_count + 1;
        END IF;
        v_num := v_num + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Prime Count: ' || v_count);

    DBMS_OUTPUT.PUT_LINE('===== PART D: GCD =====');
    v_x := v_a;
    v_y := v_b;
    WHILE v_y <> 0 LOOP
        v_temp := MOD(v_x, v_y);
        v_x := v_y;
        v_y := v_temp;
    END LOOP;
    v_gcd := v_x;
    DBMS_OUTPUT.PUT_LINE('GCD of ' || v_a || ' and ' || v_b || ' = ' || v_gcd);

    DBMS_OUTPUT.PUT_LINE('===== PART E: PERFECT NUMBER =====');
    v_sum := 0;
    v_x := 1;
    WHILE v_x <= TRUNC(v_num / 2) LOOP
        IF MOD(v_num, v_x) = 0 THEN
            v_sum := v_sum + v_x;
        END IF;
        v_x := v_x + 1;
    END LOOP;

    IF v_sum = v_num THEN
        DBMS_OUTPUT.PUT_LINE(v_num || ' is a Perfect Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_num || ' is Not a Perfect Number');
    END IF;
END;
/
