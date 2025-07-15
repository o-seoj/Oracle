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
