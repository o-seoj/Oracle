-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 12:24:37 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lecture (
    lecno     NUMBER NOT NULL,
    lecname   VARCHAR2(50) NOT NULL,
    leccredit NUMBER NOT NULL,
    lectime   NUMBER NOT NULL,
    lecclass  VARCHAR2(25)
);

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( lecno );

CREATE TABLE register (
    regstdno      CHAR(8) NOT NULL,
    reglecno      NUMBER NOT NULL,
    regmidscore   NUMBER,
    regfinalscore NUMBER,
    regtotalscore NUMBER,
    reggrade      CHAR(1)
);

CREATE TABLE student (
    stdno      CHAR(8) NOT NULL,
    stdname    VARCHAR2(20) NOT NULL,
    stdhp      CHAR(13) NOT NULL,
    stdyear    NUMBER NOT NULL,
    stdaddress VARCHAR2(100)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stdno );

ALTER TABLE student ADD CONSTRAINT student__un UNIQUE ( stdhp );

ALTER TABLE register
    ADD CONSTRAINT register_lecture_fk FOREIGN KEY ( reglecno )
        REFERENCES lecture ( lecno );

ALTER TABLE register
    ADD CONSTRAINT register_student_fk FOREIGN KEY ( regstdno )
        REFERENCES student ( stdno );


insert into student values(20201011, '김유신', '010-1234-1001', 3, '경남 김해시');
insert into student values(20201122, '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into student values(20210213, '장보고', '010-1234-1003', 2, '전남 완도군');
insert into student values(20210324, '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into student values(20220415, '이순신', '010-1234-1005', 1, '서울 종로구');

insert into lecture values(101, '컴퓨터과학 개론', 2, 40, '본301');
insert into lecture values(102, '프로그래밍 언어', 3, 52, '본302');
insert into lecture values(103, '데이터베이스', 3, 56, '본303');
insert into lecture values(104, '자료구조', 3, 60, '본304');
insert into lecture values(105, '운영체제', 3, 52, '본305');

insert into register(regStdNo, regLecNo, regMidScore, regFinalScore) values (20220415, 101, 60, 30);
insert into register(regStdNo, regLecNo, regMidScore, regFinalScore) values (20210324, 103, 54, 36);
insert into register(regStdNo, regLecNo, regMidScore, regFinalScore) values (20201011, 105, 52, 28);
insert into register(regStdNo, regLecNo, regMidScore, regFinalScore) values (20220415, 102, 38, 40);
insert into register(regStdNo, regLecNo, regMidScore, regFinalScore) values (20210324, 104, 56, 32);
insert into register(regStdNo, regLecNo, regMidScore, regFinalScore) values (20210213, 103, 48, 40);

-- 실습 6-9. 다음 데이터를 조회 하시오.
-- 이번 학기에 수강신청 하지 않은 학생의 학번, 이름, 연락처, 학년을 조회하시오.
select stdNo, stdName, stdHp, stdYear from student
where stdNo = (
select distinct stdNo from student
EXCEPT 
select distinct regStdNo from Register);

select stdNo, stdName, stdHp, stdYear from student a
left join register b on a.stdno=b.regstdno
where regstdno is null;

select stdNo, stdName, stdHp, stdYear from student
where stdno not in (select regstdno from register);

-- 중간고사 점수와 기말고사 점수의 총합을 구하고 등급을 구하시오.
update register set
    regtotalscore = regMidScore+regFinalScore,
    reggrade = case
        when (regMidScore+regFinalScore>=90) then 'A'
        when (regMidScore+regFinalScore>=80) then 'B'
        when (regMidScore+regFinalScore>=70) then 'C'
        when (regMidScore+regFinalScore>=60) then 'D'
    else 'F'
end;

select * from register;

-- 2학년 학생의 학번, 이름, 학년, 수강 강좌명, 중간점수, 기말점수, 총합, 등급을 조회하시오
select
    s.stdNo, s.stdName, s.stdHp, s.stdYear,
    l.lecName, r.regMidScore, r.regFinalScore, r.regtotalscore, r.reggrade
from register r join student s on r.regStdNo = s.stdNo
                join lecture l on r.reglecno = l.lecNo
where s.stdYear = 2;
