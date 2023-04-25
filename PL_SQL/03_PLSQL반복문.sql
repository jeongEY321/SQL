
-- WHILE��

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER :=1; 
BEGIN
    WHILE v_count <= 9
    LOOP
        DBMS_OUTPUT.put_line(v_num);
        v_count := v_count + 1;
    END LOOP;
END;

-- Ż�⹮

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER :=1; 
BEGIN
    WHILE v_count <= 9
    LOOP
        DBMS_OUTPUT.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    END LOOP;
END;

-- FOR��
DECLARE
    v_num NUMBER :=3;
BEGIN
    
    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        DBMS_OUTPUT.put_line(v_num || 'X' || i || ' = ' || v_num*i);
    END LOOP;
END;

-- CONTINUE��

DECLARE
    v_num NUMBER :=3;
BEGIN
    
    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        CONTINUE WHEN i = 5;
        DBMS_OUTPUT.put_line(v_num || 'X' || i || ' = ' || v_num*i);
    END LOOP;
END;


-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2~9��)

DECLARE

BEGIN

    FOR i IN 2..9
    LOOP
            FOR k IN 1..9
            LOOP
            DBMS_OUTPUT.put_line(i || 'X' || k || ' = ' || i*k);

            END LOOP;
    DBMS_OUTPUT.put_line('-----------------------------');
    END LOOP;
END;

-- 2. INSERT �� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENCE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2, test2, title2 ...

CREATE TABLE board(
    bno NUMBER,
    writer VARCHAR2(3000),
    title VARCHAR2(3000)
);

CREATE SEQUENCE board_bno
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 300
    MINVALUE 1
    NOCACHE
    NOCYCLE;


DECLARE

BEGIN
    FOR i IN 1..300
    LOOP
        INSERT INTO board
        VALUES (board_bno.NEXTVAL, 'test'||TO_CHAR(i), 'title'||TO_CHAR(i));
    END LOOP;
END;

DROP TABLE board;
DROP SEQUENCE board_bno;

SELECT * FROM board
ORDER BY bno DESC;

















