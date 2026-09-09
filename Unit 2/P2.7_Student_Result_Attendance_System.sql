SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 43;
    v_attendance_pct NUMBER := 85;
    v_theory_marks NUMBER := 55;
    v_practical_marks NUMBER := 25;
    v_assignment_marks NUMBER := 8;
    v_counted_assignment NUMBER;
    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(30);
    v_remark VARCHAR2(100);
BEGIN
    v_counted_assignment := LEAST(v_assignment_marks, 10);

    IF v_attendance_pct < 40 THEN
        v_result := 'DETAINED';
        v_remark := 'Attendance below 40%';
        v_total := v_theory_marks + v_practical_marks + v_counted_assignment;
    ELSIF v_theory_marks < 28 THEN
        v_result := 'FAIL in Theory';
        v_remark := 'Theory marks below passing marks';
        v_total := v_theory_marks + v_practical_marks + v_counted_assignment;
    ELSIF v_practical_marks < 12 THEN
        v_result := 'FAIL in Practical';
        v_remark := 'Practical marks below passing marks';
        v_total := v_theory_marks + v_practical_marks + v_counted_assignment;
    ELSE
        v_total := v_theory_marks + v_practical_marks + v_counted_assignment;
        v_percentage := v_total / 1.2;

        v_grade := CASE
            WHEN v_percentage >= 90 THEN 'A+'
            WHEN v_percentage >= 80 THEN 'A'
            WHEN v_percentage >= 70 THEN 'B'
            WHEN v_percentage >= 60 THEN 'C'
            WHEN v_percentage >= 50 THEN 'D'
            ELSE 'F'
        END;

        IF v_percentage >= 75 THEN
            v_result := 'DISTINCTION';
            v_remark := 'Excellent performance';
        ELSE
            v_result := 'PASS';
            v_remark := 'Passed all components';
        END IF;
    END IF;

    IF v_percentage IS NULL THEN
        v_percentage := v_total / 1.2;
        v_grade := CASE
            WHEN v_percentage >= 90 THEN 'A+'
            WHEN v_percentage >= 80 THEN 'A'
            WHEN v_percentage >= 70 THEN 'B'
            WHEN v_percentage >= 60 THEN 'C'
            WHEN v_percentage >= 50 THEN 'D'
            ELSE 'F'
        END;
    END IF;

    DBMS_OUTPUT.PUT_LINE('===== LJICA SEMESTER RESULT =====');
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('Attendance: ' || v_attendance_pct || '%');
    DBMS_OUTPUT.PUT_LINE('Theory Marks: ' || v_theory_marks || '/70');
    DBMS_OUTPUT.PUT_LINE('Practical Marks: ' || v_practical_marks || '/30');
    DBMS_OUTPUT.PUT_LINE('Assignment Marks Counted: ' || v_counted_assignment || '/10');
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || ROUND(v_percentage, 2) || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);
    DBMS_OUTPUT.PUT_LINE('Remark: ' || v_remark);
END;
/
