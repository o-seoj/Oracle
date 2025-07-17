-- 교재 p26
select * from emp;

-- 교재 p27
select *
    from emp;

select * fr //from 키워드 줄을 바꿔서 에러 남
    om emp;

select * //테이블 이름 줄을 바꿔서 에러남
    from em
    p;

select em //컬럼 이름 줄을 바꿔서 에러남
    pno from emp;

-- 교재 p28
desc dept;

-- 교재 p29
select * from tab;

select empno, ename
    from emp;

-- 교재 p30
set pagesize 15
set linesize 200
select empno, ename
    from emp;

-- 교재 p32
set pagesize 50
col name for a20
select name, 'good morning~~!' "Good Morning"
    from professor;

select dname, ',it''s deptno: ', deptno "DNAME AND DEPTNO"
    from dept;

select dname, q'[, it's deptno: ]', deptno "DNAME AND DEPTNO"
    from dept;

-- 교재 p34
select profno, name, pay
    from professor;

select profno "Prof's NO", name as "Prof's NAME", pay Prof_Pay
    from professor;

-- 교재 p35
select deptno from emp;

select distinct deptno
    from emp;

-- 교재 p36
select job, ename
    from emp
    order by 1, 2;

select distinct job, ename
    from emp
    order by 1, 2;

-- 교재 p37
select job, distinct ename
    from emp
    order by 1, 2;
    //누락된 표현식 오류

select ename, job from emp;

select ename || job from emp;

-- 교재 p38
select ename||'-'||job from emp;

select ename||' ''s jib is '|| job "NAME AND JOB"
 from emp;
 
 -- 교재 p41
select empno, ename
    from emp
    where empno = 7900;

select ename, sal
    from emp
    where sal < 900;

select empno, ename, sal
    from emp
    where ename = SMITH;
    //오류 작음따옴표 필요
    
select empno, ename, sal
    from emp
    where ename = 'SMITH';
    
-- 교재 p42
select empno, ename, sal from emp where ename='smith';

select ename, hiredate from emp where ename = 'SMITH';

select ename, hiredate from emp where hiredate = '80/12/17';

-- 교재 p43
select empno, ename, sal from emp where hiredate = 80/12/17;
//에러 발생 -> 날짜는 작음 따옴표 반드시 사용

-- 교재 p44
select ename, sal from emp where deptno = 10;

select ename, sal, sal+100 from emp where deptno = 10;

select ename, sal, sal*1.1 from emp where deptno = 10;

-- 교재 p45
select empno, ename, sal from emp where sal>=4000;

select empno, ename, sal from emp where ename >= 'W';

-- 교재 p46
select ename, hiredate from emp;

select ename, hiredate from emp where hiredate>='81/12/25';

-- 교재 p47
select ename, hiredate from emp;

select empno, ename, sal from emp where sal between 2000 and 3000;

-- 교재 p48
select empno, ename, sal from emp where sal >= 2000 and sal <=3000;

select ename from emp order by ename;

select ename from emp where ename between 'JAMES' and 'MARTIN' order by ename;

-- 교재 p49
select empno, ename, deptno from emp where deptno in (10,20);

select empno, ename, sal from emp where sal like '1%';

select empno, ename, sal from emp where ename like 'A%';

-- 교재 p50
select empno, ename, hiredate from emp where hiredate like '%80';

select empno, ename, hiredate from emp where hiredate like %80;
//오류 발생 like 연산자 뒤에 작은따옴표로 검색할 단어 묶어야 함

select empno, ename, hiredate from emp where hiredate like '___DEC%';

select empno, ename, hiredate from emp where hiredate like '___12%';

-- 교재 p52
select empno, ename, comm from emp where deptno in (20,30);

select empno, ename, comm from emp where comm = null;


-- 교재 p53
select empno, ename, comm from emp where comm is null;
select empno, ename, comm from emp where comm is not null;

-- 교재 p54
select ename, hiredate, sal from emp where hiredate > '82/01/01' and sal>=1300;

select ename, hiredate, sal from emp where hiredate > '82/01/01' or sal>=1300;

select empno, ename, sal, comm from emp where sal>1000 and (comm<1000 or comm is null);

select empno, ename, sal, comm from emp where sal>1000 and comm<1000 or comm is null;

-- 교재 p55
select empno, ename, sal from emp where empno = &empno;

set verity off 
select empno, ename, sal from emp where empno = &empno;

-- 교재 p56
select empno, ename from &table where sal = 3000;

-- 교재 p57
select ename, sal, hiredate from emp;

select ename, sal, hiredate from emp order by ename;

-- 교재 p58
select deptno, sal, ename from emp order by deptno asc, sal desc;

select ename, sal, hiredate from emp where sal>1000 order by 2,1;

-- 교재 p60
select studno, name, deptno1, 1 
    from student
    where deptno1=101
    union all 
    select profno, name, deptno, 2
    from professor
    where deptno=101;
    
-- 교재 p61
select studno, name, deptno1, 1
    from student
    where deptno1 = 101
    union
    select profno, name, deptno, 2
    from professor
    where deptno = 101;
    
select studno, name
    from student
    where deptno1 = 101
    union
    select studno, name
    from student
    where deptno2 = 201;

select studno, name
    from student
    where deptno1 = 101
    union all
    select studno, name
    from student
    where deptno2 = 201;

-- 교재 p63
select studno, name
    from student
    where deptno1 = 101
    intersect
    select studno, name
    from student
    where deptno2 = 201;

select empno, ename, sal
    from emp
    minus
    select empno, ename, sal
    from emp
    where sal >2500;
    
-- 교재 p64
select studno, name
    from student
    union
    select profno
    form professor;
//select 절의 컬럼 개수가 다를 경우 발생 에러

select studno, name
    from student
    union
    select name, profno
    form professor;
//select절의 컬럼의 데이터 타입이 다를 경우 발생 에러

-- 교재 p71
//INITCAP()함수 - 영어에서 첫 글자만 대문자로 출력하고 나머지는 전부 소문자로 출력
select ename, initcap(ename) "initcap" 
    from emp
    where deptno=10;

select name, initcap(name) "initcap"
    from professor
    where deptno = 101;
    //중간에 공백이 있을 경우 공백 다음을 첫 글자로 생각해서 대문자로 출력

-- 교재 p72
select ename, lower(ename) "lower", upper(ename) "upper"
    from emp
    where deptno = 10;

-- 교재 p73
select ename, length(ename) "length", lengthb(ename) "length"
    from emp
    where deptno = 20;

select '서진수' "name", length('서진수') "length", lengthb('서진수') "lengthb"
    from dual;
//영어일 경우 값 동일 but 한글일 경우는 다름. 책 3 6 -> 실제 실습 결과는 3 9가 나옴

-- 교재 p74
set verify off
select ename, length(ename)
    from emp
    where length(ename)>length('&ename');
//회원 가입 시 사용자 입력한 글자 수 확인

select concat(ename, job)
    from emp
    where deptno = 10;
    
-- 교재 p75
col "3, 2" for a6
col "-3, 2" for a6
col "-3, 4" for a6
select substr('abcde', 3, 2) "3,2",
        substr('abcde', -3, 2) "-3,2",
        substr('abcde', -3, 4) "-3,4"
        from dual;
//마이너스 x -> 왼쪽에서 오른쪽으로 검색, o -> 오른쪽에서 왼쪽 검색 후 왼쪽에서 오른쪽 검색
//활용: 생일 하루 전 문자, 생일 전 주변사람들에서 생일 다가온다 표시 등
//자릿수부터 몇자를 추출

-- 교재 p76
select name, substr(jumin, 3, 4) "Birthday",
            substr(jumin, 3, 4) -1 "Birthday -1"
        from student
        where deptno1 = 101;

select '서진수' "name", substr('서진수', 1, 2) "substr", substrb('서진수',1,3) "substrb"
    from dual;

-- 교재 p77
//instr('문자열'또는 컬럼, 찾는 글자, 시작 위치, 몇 번째인지(기본값은 1))
select 'a-b-c-d', instr('a-b-c-d','-',1,3) "instr"
    from dual;

select 'a-b-c-d', instr('a-b-c-d','-',3,1) "instr"
    from dual;

select 'a-b-c-d', instr('a-b-c-d','-',-1,3) "instr"
    from dual;

-- 교재 p78
select 'a-b-c-d', instr('a-b-c-d','-',-1,3) "instr"
    from dual;

select 'a-b-c-d', instr('a-b-c-d','-',-6,2) "instr"
    from dual;

select name, tel, instr(tel, ')')
    from student
    where deptno1 = 201;

-- 교재 p79
select name, tel, instr(tel, '3')
    from student
    where deptno1 = 101;

-- 교재 p80
//LPAD('문자열' or 컬럼명 자릿수, '채울문자')
col name for a20
col id for a10
col lpad(id,10,'*') for a20
select name, id, lpad(id,10,'*')
    from student
    where deptno1 = 201;

-- 교재 p82
select ename from emp
    where deptno = 10;

//LTIM('문자열' or 컬럼명, '제거할 문자')  
select ltrim(ename,'C')
    from emp
    where deptno = 10;
    
-- 교재 p83
select ename, RTRIM(ename, 'R') "RTRIM"
    from emp
    where deptno = 10;

-- 교재 p84
SELECT ENAME, REPLACE(ENAME, SUBSTR(ENAME, 1, 2), '**') "REPLACE"
    FROM EMP
    WHERE DEPTNO = 10;

-- 교재 p86
//반올림
SELECT ROUND(987.654, 2) "ROUND1",
        ROUND(987.654, 0) "ROUND2",
        ROUND(987.654, -1) "ROUND3"
    FROM DUAL;

-- 교재 p87
//버림
SELECT TRUNC(987.654, 2) "TRUNC1",
        TRUNC(987.654, 0) "TRUNC2",
        TRUNC(987.654, -1) "TRUNC3"
    FROM DUAL;

//MOD 나머지, CEIL 주어진 숫자가 가장 가까운 큰 정수, FLOOR 주어진 함수와 가장 가까운 작은 정수
SELECT MOD(121,10) "MOD",
    CEIL(123.5) "CEIL",
    FLOOR(123.45) "FLOOR"
FROM DUAL;

-- 교재 p88
SET PAGESIZE 50
SELECT ROWNUM "ROWNO", CEIL(ROWNUM/3) "TEAMNO", ENAME
    FROM EMP;

SELECT POWER(2,3) FROM DUAL;

-- 교재 p90
select sysdate from dual;

-- 교재 p91
//두 날짜 중 큰 날짜를 먼저 써야 양수가 나옴 아니면 음수
select months_between('14/09/30','14/08/31') from dual;

-- 교재 p92
select months_between('14/08/31','14/09/30') from dual;

//같은 달에 속해 있으면 특정 규칙으로 계산된 값 나옴
select months_between('12/02/29','12/02/01') from dual;
select months_between('14/04/30','14/04/01') from dual;

-- 교재 p93
select months_between('14/05/31', '14/05/01') from dual;
//2월이 28일까지 있는 달과 29일(윤일)까지 있는 달은 구분 X
select months_between('12/03/01', '12/02/28') from dual;
select months_between('14/03/01', '14/02/28') from dual;

-- 교재 p94
//날짜 형태를 지정
alter session set nls_date_format='yy/mm/dd';
select sysdate, months_between('15/05/31','15/04/30') from dual;

-- 교재 p95
select ename, hiredate,
    round(months_between(to_date('04/05/31'), hiredate),1) "DATE1",
    round((to_date('04/05/31') - hiredate)/31),1) "DATE2"
from emp
where deptno = 10;