/*
    날짜 : 2025/07/17
    이름 : 오서정
    내용 : 5장 데이터베이스 객체
*/

-- 워크북 p13
-- 실습하기 3-1
SELECT * FROM DICTIONARY;

SELECT TABLE_NAME FROM USER_TABLES;
SELECT OWNER, TABLE_NAME FROM ALL_TABLES;
SELECT * FROM DBA_TABLES;

-- 실습하기 3-2
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

-- 실습하기 3-3
CREATE INDEX IDX_USER1_ID ON USER1(USER_ID);
SELECT * FROM USER_IND_COLUMNS;

-- 실습하기 3-4
DROP INDEX IDX_USER1_ID;
SELECT * FROM USER_IND_COLUMNS;

-- 실습하기 3-6
CREATE VIEW VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);
CREATE VIEW VW_USER2_AGE_UNDER30 AS (SELECT * FROM USER2 WHERE AGE<30);
SELECT * FROM USER_VIEWS;

-- 실습하기 3-7
SELECT * FROM VW_USER1;
SELECT * FROM VW_USER2_AGE_UNDER30;

-- 실습하기 3-8
DROP VIEW VW_USER1;
DROP VIEW VW_USER2_AGE_UNDER30;

-- 실습하기 3-9
CREATE TABLE USER6(
    SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    GENDER CHAR(1),
    AGE NUMBER,
    ADDR VARCHAR2(255)
);

-- 실습하기 3-10
CREATE SEQUENCE SEQ_USER6 INCREMENT BY 1 START WITH 1;

-- 실습하기 3-11
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김유신', 'M', 25, '김해시');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김춘추', 'M', 23, '경주시');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '신사임당', 'F', 27, '강릉시');

-- 실습하기 4-1
// Oracle에서 내부 스크립트 실행이나 일반 사용자 생성을 가능하게 하기 위한 세션 설정
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER test1 IDENTIFIED BY 1234;

-- 실습하기 4-2
SELECT * FROM ALL_USERS;

SELECT * FROM ALL_USERS WHERE USERNAME = 'TEST1';

-- 실습하기 4-3
ALTER USER TEST1 IDENTIFIED BY 1111;

DROP USER TEST1;

DROP USER TEST1 CASCADE;

-- 실습하기 4-4
GRANT CONNECT, RESOURCE TO TEST1;

GRANT UNLIMITED TABLESPACE TO TEST1;
