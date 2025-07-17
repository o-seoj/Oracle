/*
    날짜 : 2025/07/17
    이름 : 오서정
    내용 : 6장 PL/SQL
*/

-- 실습 1-1
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello Oracle!');
END;
/

-- 실습 1-2
-- 내용 : PL/SQL 주석 실습
DECLARE
    NO NUMBER(4) := 1001;
    NAME VARCHAR2(10) := '홍길동';
    HP CHAR(13) := '010-1000-1001';
    ADDR VARCHAR2(100) := '부산광역시';
BEGIN
    DBMS_OUTPUT.PUT_LINE('번호 : '||NO);
    DBMS_OUTPUT.PUT_LINE('이름 : '||NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : '||HP);
    DBMS_OUTPUT.PUT_LINE('주소 : '||ADDR);
END;
/

-- 실습 2-1
SET SERVEROUTPUT ON;

DECLARE
    NO NUMBER(4) := 1001;
    NAME VARCHAR2(10);
    HP CHAR(13) := '000-0000-0000';
    AGE NUMBER(2) DEFAULT 1;
    ADDR VARCHAR2(10) NOT NULL := '부산';
BEGIN
    NAME := '김유신';
    HP := '010-1000-1001';
    DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : ' || HP);
    DBMS_OUTPUT.PUT_LINE('나이 : ' || AGE);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ADDR);
END;
/

-- 실습 2-2
DECLARE
    NO DEPT.DEPTNO%TYPE;
    NAME DEPT.DNAME%TYPE;
    DTEL DEPT.DTEL%TYPE;
BEGIN
    SELECT *
    INTO NO, NAME, DTEL
    FROM DEPT
    WHERE DEPTNO = 30;
    
    DBMS_OUTPUT.PUT_LINE('부서번호 : '||NO);
    DBMS_OUTPUT.PUT_LINE('부서명 : '||NAME);
    DBMS_OUTPUT.PUT_LINE('부서전화번호 : '||DTEL);
END;
/

-- 실습 2-3
DECLARE
    -- 선언
    ROW_DEPT DEPT%ROWTYPE;
BEGIN
    -- 처리
    SELECT *
    INTO ROW_DEPT
    FROM DEPT
    WHERE DEPTNO = 40;
    
    --출력
    DBMS_OUTPUT.PUT_LINE('부서번호 : '||ROW_DEPT.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('부서명 : '||ROW_DEPT.DNAME);
    DBMS_OUTPUT.PUT_LINE('부서전화번호 : '||ROW_DEPT.DTEL);

END;
/

-- 실습 2-4
DECLARE
    -- Record Define
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2),
        dname DEPT.DNAME%TYPE,
        dtel DEPT.DTEL%TYPE
    );
    -- Record Declare
    dept_rec REC_DEPT;
BEGIN
    -- Record Initialize
    dept_rec.deptno := 10;
    dept_rec.dname := '개발부';
    dept_rec.dtel := '부산';
    -- Record Print
    DBMS_OUTPUT.PUT_LINE('deptno : '||dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : '||dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('dtel : '||dept_rec.dtel);
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
END;
/
-- 실습하기 2-5
-- 테이블 복사(데이터 제외)
CREATE TABLE DEPT_RECORD AS SELECT * FROM DEPT WHERE 1=0;

DECLARE
    TYPE REC_DEPT IS RECORD(
    deptno NUMBER(2),
    dname DEPT.DNAME%TYPE,
    dtel DEPT.DTEL%TYPE
    );
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 10;
    dept_rec.dname := '개발부';
    dept_rec.dtel := '부산';
    
    INSERT INTO DEPT_RECORD VALUES dept_rec;
    
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
END;
/

-- 실습하기 2-6
-- 레코드를 포함하는 레코드 실습
DECLARE
    TYPE REC_DEPT IS RECORD (
        deptno DEPT.DEPTNO%TYPE,
        dname DEPT.DNAME%TYPE,
        dtel DEPT.DTEL%TYPE
    );
    TYPE REC_EMP IS RECORD (
        empno EMP.EMPNO%TYPE,
        ename EMP.NAME%TYPE,
        dinfo REC_DEPT
    );
    emp_rec REC_EMP;
BEGIN
    SELECT E.EMPNO, E.NAME, D.DEPTNO, D.DNAME, D.DTEL
    INTO
        emp_rec.empno,
        emp_rec.ename,
        emp_rec.dinfo.deptno,
        emp_rec.dinfo.dname,
        emp_rec.dinfo.dtel
    FROM EMP E, DEPT D
    WHERE E.DEPNO = D.DEPTNO AND E.EMPNO = 1011;
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || emp_rec.empno);
        DBMS_OUTPUT.PUT_LINE('ENAME : ' || emp_rec.ename);
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || emp_rec.dinfo.deptno);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || emp_rec.dinfo.dname);
        DBMS_OUTPUT.PUT_LINE('DTEL : ' || emp_rec.dinfo.dtel);
        DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
END;
/

-- 실습하기 2-7
DECLARE
    TYPE ARR_CITY IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    arrCity ARR_CITY;
BEGIN
    arrCity(1) := '서울';
    arrCity(2) := '대전';
    arrCity(3) := '대구';
    
    DBMS_OUTPUT.PUT_LINE('arrCity(1) : '||arrCity(1));
    DBMS_OUTPUT.PUT_LINE('arrCity(2) : '||arrCity(2));
    DBMS_OUTPUT.PUT_LINE('arrCity(3) : '||arrCity(3));
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');      
END;
/

-- 실습 3-1
declare
    num number :=1;
begin
    if num>0 then
        dbms_output.put_line('NUM은 0보다 크다.');
    end if;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-2
declare
    num number := -1;
begin
    if num>0 then
        dbms_output.put_line('NUM은 0보다 크다.');
    else
        dbms_output.put_line('NUM은 0보다 작다.');
    end if;
        dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-3
declare
    score number := 86;
begin
    if score >= 90 and score <= 100 then
        dbms_output.put_line('A 입니다.');
    elsif score>=80 and score<90 then
        dbms_output.put_line('B 입니다.');
    elsif score>=70 and score<80 then
        dbms_output.put_line('C 입니다.');
    elsif score>=60 and score<70 then
        dbms_output.put_line('D 입니다.');
    else
        dbms_output.put_line('F 입니다.');
    end if;
        dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-4
declare
    score number := 86;
begin
    case floor(score/10)
        when 9 then dbms_output.put_line('A 입니다.');
        when 8 then dbms_output.put_line('B 입니다.');
        when 7 then dbms_output.put_line('C 입니다.');
        when 6 then dbms_output.put_line('D 입니다.');
        else dbms_output.put_line('F 입니다.');
    end case;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-5
declare
    num number := 0;
begin
    loop
        dbms_output.put_line('NUM : '||num);
        num := num+1;
        if num > 3 then
            exit;
        end if;
    end loop;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-6
begin
    for i in 1..3 loop
        dbms_output.put_line('i : '||i);
    end loop;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-7
declare
    num number := 0;
begin
    while num <4 loop
        dbms_output.put_line('num : '||num);
        num := num+1;
    end loop;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-8
declare
    num number := 0;
begin
    while num < 5 loop
    num := num+1;
    
    -- MOD() : 나머지를 구하는 SQL 함수
    if mod(num,2)=0 then
        continue;
    end if;
    
    dbms_output.put_line('num : '||num);
    
    end loop;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 3-9
begin
    for i in 1..5 loop
    continue when mod(i,2)=0;
    dbms_output.put_line('i : '||i);
    end loop;
    dbms_output.put_line('PL/SQL 종료...');
end;
/

-- 실습 4-1
DECLARE
    -- 커서 데이터를 저장할 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    
    -- 커서 선언
    CURSOR c1 IS SELECT * FROM DEPT WHERE DEPTNO = 40;
BEGIN
    -- 커서 열기
    OPEN c1;
    
    -- 커서 데이터 입력
    FETCH c1 INTO V_DEPT_ROW;
    
    -- 커서 데이터 출력
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('DTEL : ' || V_DEPT_ROW.DTEL);
    -- 커서 종료
    CLOSE c1;
END;
/

-- 실습 4-2
DECLARE
    V_EMP_ROW EMP%ROWTYPE;
    CURSOR emp_cursor IS SELECT * FROM EMP;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO V_EMP_ROW;
        EXIT WHEN emp_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('---------------------');
        DBMS_OUTPUT.PUT_LINE('EMPNO : '|| V_EMP_ROW.EMPNO);
        DBMS_OUTPUT.PUT_LINE('NAME : '|| V_EMP_ROW.NAME);
        DBMS_OUTPUT.PUT_LINE('REGDATE : '|| V_EMP_ROW.REGDATE);
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- 실습 4-3
DECLARE
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('---------------------');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : '|| c1_rec.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : '|| c1_rec.DNAME);
        DBMS_OUTPUT.PUT_LINE('DTEL : '|| c1_rec.DTEL);
    END LOOP; 
END;
/

-- 실습 5-1
CREATE PROCEDURE hello_procedure(p_name IN VARCHAR2)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('안녕하세요, '||p_name||'님!');
    DBMS_OUTPUT.PUT_LINE('환영합니다.');
END;
/

-- 프로시저 실행1
EXECUTE hello_procedure('홍길동');
EXECUTE hello_procedure('김철수');

-- 프로시저 삭제
DROP PROCEDURE hello_procedure;

-- 실습 5-2
-- 함수 생성
CREATE FUNCTION get_emp_name(p_empno NUMBER) RETURN VARCHAR2
IS
    v_ename VARCHAR2(20);
BEGIN
    SELECT NAME INTO v_ename FROM EMP WHERE EMPNO=p_empno;
    RETURN v_ename;
END;
/
--함수 실행
SELECT get_emp_name(1001) FROM DUAL;

-- 실습 5-3
-- 로그 테이블 생성
CREATE TABLE emp_log(log_data DATE, empno NUMBER, action VARCHAR2(10));

-- 트리거 생성
create trigger trgg_emp_insert
after insert on emp
for each row
begin
    insert into emp_log (log_data, empno, action)
    values (sysdate, :NEW.empno, 'INSERT');
end;
/

-- insert 테스트
insert into emp values (2001, '김유신', 'M', '사원', 10, sysdate);
insert into emp values (2002, '김춘추', 'M', '대리', 10, sysdate);

-- 로그 확인
select * from emp_log;
