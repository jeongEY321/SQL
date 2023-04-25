
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ������)
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

-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸����� ����� ����. (������ ��Ƽ� ����ϼ���.)

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


-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (max �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ���ó�¥
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























