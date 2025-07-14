/*
    날짜 : 2025/07/14
    이름 : 오서정
    내용 : 2장 SQL 기본
*/

-- 실습 : 1-2. NUMBER 자료형 이해
CREATE TABLE TYPE_TEST_NUMBER (
    num1 NUMBER,
    num2 NUMBER(2),
    num3 NUMBER(3, 1),
    num4 NUMBER(4, 2),
    num5 NUMBER(5, 6),
    num6 NUMBER(6, -1)
);
delete from type_test_number;

//num1 NUMBER 
insert into TYPE_TEST_NUMBER (num1) values (1);
insert into TYPE_TEST_NUMBER (num1) values (123);
insert into TYPE_TEST_NUMBER (num1) values (123.74);
insert into TYPE_TEST_NUMBER (num1) values (123.12345);

//num2 NUMBER
insert into TYPE_TEST_NUMBER (num2) values (12);
insert into TYPE_TEST_NUMBER (num2) values (123);
insert into TYPE_TEST_NUMBER (num2) values (1.2);
insert into TYPE_TEST_NUMBER (num2) values (1.23);
insert into TYPE_TEST_NUMBER (num2) values (12.34567);
insert into TYPE_TEST_NUMBER (num2) values (12.56789);
insert into TYPE_TEST_NUMBER (num2) values (123.56789);

//num3 NUMBER(3, 1)
insert into TYPE_TEST_NUMBER (num3) values (12);
insert into TYPE_TEST_NUMBER (num3) values (123);
insert into TYPE_TEST_NUMBER (num3) values (12.1);
insert into TYPE_TEST_NUMBER (num3) values (12.1234);
insert into TYPE_TEST_NUMBER (num3) values (12.56789);
insert into TYPE_TEST_NUMBER (num3) values (123.56789);

//num4 NUMBER(4, 2)
insert into TYPE_TEST_NUMBER (num4) values (12);
insert into TYPE_TEST_NUMBER (num4) values (123);
insert into TYPE_TEST_NUMBER (num4) values (12.1);
insert into TYPE_TEST_NUMBER (num4) values (12.1234);
insert into TYPE_TEST_NUMBER (num4) values (12.56789);
insert into TYPE_TEST_NUMBER (num4) values (123.56789);

//num5 NUMBER(5, 6)
insert into TYPE_TEST_NUMBER (num5) values (12);
insert into TYPE_TEST_NUMBER (num5) values (123);
insert into TYPE_TEST_NUMBER (num5) values (12.1);
insert into TYPE_TEST_NUMBER (num5) values (12.1234);
insert into TYPE_TEST_NUMBER (num5) values (12.56789);
insert into TYPE_TEST_NUMBER (num5) values (123.56789);

//num6 NUMBER(6, -1)
insert into TYPE_TEST_NUMBER (num6) values (12);
insert into TYPE_TEST_NUMBER (num6) values (123);
insert into TYPE_TEST_NUMBER (num6) values (12.1);
insert into TYPE_TEST_NUMBER (num6) values (12.1234);
insert into TYPE_TEST_NUMBER (num6) values (12.56789);
insert into TYPE_TEST_NUMBER (num6) values (123.56789);

// 실습하기 1-3. 문자형 자료형 이해
CREATE TABLE TYPE_TEST_CHAR(
    char1 CHAR(1),
    char2 CHAR(2),
    char3 CHAR(3),
    vchar1 VARCHAR2(1),
    vchar2 VARCHAR2(2),
    vchar3 VARCHAR2(3),
    nvchar1 NVARCHAR2(1),
    nvchar2 NVARCHAR2(2),
    nvchar3 NVARCHAR2(3)
);

//CHAR
INSERT INTO TYPE_TEST_CHAR (char1) values ('A');
INSERT INTO TYPE_TEST_CHAR (char1) values ('가');

//VARCHAR2
INSERT INTO TYPR_TEST_CHAR (vchar1) values ('A');
INSERT INTO TYPE_TEST_CHAR (vchar2) values ('AB');
INSERT INTO TYPE_TEST_CHAR (vchar3) values ('가');

//NVARCHAR2
INSERT INTO TYPE_TEST_CHAR (nvchar1) values ('A');
INSERT INTO TYPE_TEST_CHAR (nvchar2) values ('AB');
INSERT INTO TYPE_TEST_CHAR (nvchar3) values ('가나다');

// 실습하기 1-4. 테이블 생성
CREATE TABLE USER1(
    USER_ID VARCHAR2(20),
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER(2)
);
DROP TABLE USER1;

// 실습하기 1-5
INSERT INTO USER1 VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO USER1 VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO USER1 VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO USER1(USER_ID, NAME, AGE) VALUES ('A104', '강감찬', 45);
INSERT INTO USER1(USER_ID, NAME, HP) VALUES ('A105', '이순신', '010-1234-5555');

// 실습하기 1-6
SELECT * FROM USER1;
SELECT * FROM USER1 WHERE USER_ID = 'A101';
SELECT * FROM USER1 WHERE NAME = '김춘추';
SELECT * FROM USER1 WHERE AGE > 30;
SELECT USER_ID, NAME, AGE FROM USER1;

// 실습하기 1-7
UPDATE USER1 SET HP ='010-1234-4444' WHERE USER_ID = 'A104';
UPDATE USER1 SET AGE = 51 WHERE USER_ID = 'A105';
UPDATE USER1 SET HP='010-1234-1001', AGE=27 WHERE USER_ID = 'A101';

// 실습하기 1-8
DELETE FROM USER1 WHERE USER_ID = 'A101';
DELETE FROM USER1 WHERE USER_ID = 'A102' AND AGE = 25;
DELETE FROM USER1 WHERE AGE>=30;

-------------------------------------
// 2. 제약 조건
-------------------------------------

-- 실습하기 2-1
CREATE TABLE USER2(
    USER_ID VARCHAR2(20) PRIMARY KEY,
    NAME VARCHAR2(20),
    HP CHAR(13),
    AGE NUMBER(2)
);

--primary key(기본키) 칼럼은 중복 안됨
INSERT INTO USER2 VALUES ('A101', '김유신', '010-1234-1111', 23);
INSERT INTO USER2 VALUES ('A102', '김춘추', '010-1234-2222', 21);

// 실습하기 2-2
create table user3 (
    user_id varchar2(20) primary key,
    name varchar2(20),
    hp char(13) UNIQUE,
    age number(3)
);

insert into user3 values ('A101','김유신','010-1234-1001', 23);
insert into user3 values ('A102','김춘추','010-1234-1002', 21);