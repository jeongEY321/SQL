
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자. (출력문 9개를 복사해서 쓰세요)
DECLARE
    
BEGIN
    DBMS_OUTPUT.put_line('3 x 1 =' || 3*1);
    DBMS_OUTPUT.put_line('3 x 2 =' || 3*2);
    DBMS_OUTPUT.put_line('3 x 3 =' || 3*3);
    DBMS_OUTPUT.put_line('3 x 4 =' || 3*4);
    DBMS_OUTPUT.put_line('3 x 5 =' || 3*5);
    DBMS_OUTPUT.put_line('3 x 6 =' || 3*6);
    DBMS_OUTPUT.put_line('3 x 7 =' || 3*7);
    DBMS_OUTPUT.put_line('3 x 8 =' || 3*8);
    DBMS_OUTPUT.put_line('3 x 9 =' || 3*9);
END;

-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
-- 익명블록을 만들어 보자. (변수에 담아서 출력하세요.)

DECLARE
    v_first_name employees.first_name%TYPE;
    v_email employees.email%TYPE;
BEGIN
    SELECT first_name, email
    INTO v_first_name, v_email
    FROM employees 
    WHERE employee_id = 201;
    
    DBMS_OUTPUT.put_line(v_first_name || '-' || v_email);
END;


-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (max 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps 테이블에
-- employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요.
-- SELECT절 이후에 INSERT문 사용이 가능합니다.
/*
<사원명>: steven
<이메일>: stevenjobs
<입사일자>: 오늘날짜
<JOB_ID>: CEO
*/
DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);

DECLARE
    v_id employees.employee_id%TYPE;
BEGIN
    SELECT MAX(employee_id)
    INTO v_id
    FROM employees;
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES (v_id+1, 'steven', 'stevenjobs', sysdate, 'CEO');

END;

SELECT employee_id, last_name, email, hire_date, job_id FROM emps;























