--scott

--DESC EMP: describe : 테이블 EMP(EMPLOYEE)의 구성 보기
--필드명(열 이름)   제약조건   데이터타입
--EMPNO(사원번호)  NOT NULL   NUMBER(4)
--ENAME(사원명), JOB(직책), MGR(직속상관 번호)
--HIREDATE(입사일),SAL(급여),COMM(수당),DEPTNO(부서번호)
--NUMBER : 소수점 자릿수를 포함해서 지정 가능한 숫자
--NUMBER(4) : 4자리 숫자까지 허용, NUMBER(8,2) : 전체 자릿수는 8자리이고 소수점 2자리 포함
--VARCHAR2(10) : 가변형 문자열 저장, 10바이트까지 저장 가능
--DATE : 날짜형 저장

DESC EMP;
--DNAME(부서명), LOC(부서위치)
DESC DEPT;
-- GRADE(급여 등급), LOSAL(최소급여액), HISAL(최대급여액)
DESC SALGRADE;

--select : 데이터 조회
--조회 방식 : 셀렉션(행 단위로 조회), 프로젝션(열 단위로 조회), 조인(두 개 이상의 테이블을 사용하여 조회)
--SELECT 열이름1 열이름2... (조회할 열이 전체라면 * 입력)
--FROM 테이블명;

-- 1. EMP 테이블의 전체 열을 조회
SELECT
    *
FROM
    emp;

-- 2. EMP 테이블에서 사원번호, 이름, 급여 열을 조회
SELECT
    empno,
    ename,
    sal
FROM
    emp;

SELECT
    *
FROM
    emp;

-- 3. DEPT 테이블 전체 조회
DESC DEPT

SELECT
    *
FROM
    dept;

-- 4. DEPT 테이블 안에 부서번호, 지역만 조회
SELECT
    loc,
    deptno
FROM
    dept;
    
-- 5. EMP 테이블 안의 부서번호
SELECT
    deptno
FROM
    emp;
    
-- 6. EMP 테이블 안의 중복되지 않은 부서번호 - SELECT DISTINCT
-- 열이 여러개인 경우 모든 열의 정보가 동일해야 중복으로 판단함
SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
-- 7. 연산
-- 각 사원의 1년간 급여 총합 구하기 - SALARY*12+COMMISION
-- SELECT 필드명BLANK별칭
-- 별칭에 공백을 줄거라면 묶어야함
SELECT
    empno,
    ename,
    sal * 12 + comm AS annsal
FROM
    emp;

SELECT
    empno           사번,
    job             "직 책",
    ename           사원명,
    sal,
    comm,
    sal * 12 + comm annsal
FROM
    emp;
    
    
--    8. 정렬 : ORDER BY : 기본 오름차순 정렬
--              내림차순 -> DESC  오름차순 -> ASC
-- ENAME, SAL 열 추출하고, SAL 내림차순으로 정렬

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;
    
--    전체 내용 출력하고, 결과가 사원번호의 오름차순
SELECT
    *
FROM
    emp
ORDER BY
    empno;
    
    -- 결과가 부서번호의 오름차순과 급여의 내림차순으로 정렬
SELECT
    *
FROM
    emp
ORDER BY
    deptno,
    sal DESC;
    
    -- [실습] EMP 테이블의 모든 열 출력
    -- EMPNO => EMPLOYEE_NO
    -- ENAME => EMPLOYEE_NAME
    -- MGR => MANAGER
    -- SAL => SALARY
    -- COMM => COMMISSION
    -- DEPTNO => DEPARTMENT_NO

DESC EMP;

SELECT
    empno  employee_no,
    ename  employee_name,
    mgr    manager,
    sal    salary,
    comm   commission,
    deptno department_no
FROM
    emp
ORDER BY
    deptno DESC,
    ename;
    
    -- 9. 조건 : WHERE : 특정 조건을 기준으로 원하는 행을 조회
    -- 부서번호가 30인 데이터만 조회

SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    empno > 7000;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
    
    --산술연산자 : +, -, *, /    MOD(오라클기능)
    --비교연산자 : >, <, <=, >=
    --등가비교연산자 : =, !=, <>, ^= (뒤에 3개 같은 기능. 다르면 TRUE 같으면 FALSE)
    --논리부정연산자 : NOT
    --IN 연산자
    --BETWEEN A AND B 연산자
    --LIKE 연산자와 와일드 카드(_,%)
    --IS NULL 연산자
    --집합연산자 : UNION(합집합-중복제거), UNION ALL(합집합-중복포함), MINUS(차집합), INTERSECT(교집합)
    
    
    
-- EMP 테이블에서 급여 열에 12를 곱한 값이 36000인 행을 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

--ENAME이 F 이후의 문자로 시작하는 사람 조회
--문자 표현 : ''만 사용한다
SELECT
    *
FROM
    emp
WHERE
    ename >= 'FORC'
ORDER BY
    ename;

-- JOB이 MANAGER 혹은 SALESMAN
SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN';

--SAL 이 3000이 아닌 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

--JOB이 MANAGER, SALESMAN, CLERK 인 사원 조회 -> IN 연산자
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
        job != 'MANAGER'
    AND job^= 'SALESMAN'
    AND job <> 'CLERK';

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
    
    --급여가 2000이상 3000이하인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
        --LIKE 연산자와 와일드카드(_,%)
    --사원 이름이 S로 시작하는 사원 정보 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';
    
    --사원 이름의 두번째 글자가 L 인 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';
    
    --사원 이름에 AM이 포함된 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';
    
    --사원 이름에 AM이 포함되지 않은 사원만 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
    
    -- NULL : 데이터 값이 완전히 비어 있는 상태

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;
    
    --집합연산자
    
    --UNION, UNION ALL : UNION이 합집합, UNION ALL은 그냥 다 때려넣기

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN'
ORDER BY
    sal DESC;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    sal > 2000;

SELECT
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
    --오라클 함수
-- 오라클에서 기본으로 제공하는 내장 함수와 사용자가 필요에 의해 직접 정의한 사용자 정의 함수

-- 1. 문자열 함수 (VARCHAR2에 사용)

-- 1) UPPER, LOWER, INITCAP -> 검색시 많이 사용
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE upper('%FORD%');
    
    -- 2) LENGTH : 문자열 길이
    SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
    SELECT *
    FROM EMP
    WHERE LENGTH(ENAME)>=5;
    
    --한글일 때
    --DUAL : SYS가 소유하는 테이블 - 임시 연산이나 함수 결과값 확인 용도
    SELECT LENGTH('한글'), LENGTHB('한글'), LENGTHB('AB')
    FROM DUAL;
    
    --3) SUBSTR(문자열데이터, 시작위치, 추출길이) : 추출길이 생략 가능
    --   문자열 일부 추출
    
    SELECT JOB, SUBSTR(JOB, 1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5), SUBSTR(JOB,-3)
    FROM EMP;
    
    SELECT ENAME, SUBSTR(ENAME,3) FROM3
    FROM EMP;
    
    -- 4) INSTR : 문자열 데이터 안에서 특정 문자 위치 찾기
    -- INSTR (대상문자열, 찾으려는 문자열, 찾기를 시작할 위치(선택),  몇 번째 문자를 찾으려는지(선택))
    
    SELECT INSTR('HELLO ORACLE!','L') INSTR_1, INSTR('HELLO ORACLE!','L',5) INSTR_2,INSTR('HELLO ORACLE!','L',2,2) INSTR_3
    FROM DUAL;
    
    -- 5) REPLACE : 특정 문자를 다른 문자로 변경
    -- REPLACE(문자열데이터, 찾는문자, 변경문자)
    SELECT '010-1234-5678', REPLACE('010-1234-5678','-',' ') REPLACE1, REPLACE('010-1234-5678','-','') REPLACE2
    FROM DUAL;
    
    SELECT REPLACE('이것이 ORACLE이다','이것이','THIS IS') REPLACE
    FROM DUAL;
    
    --6) CONCAT : 두 문자열 데이터 합치기
    SELECT CONCAT(CONCAT(EMPNO,' - '),ENAME) 
    FROM EMP;
    
    --7) || : 문자열 연결 연산자
    SELECT EMPNO||' - '||ENAME||' 네개'
    FROM EMP;
    
    --8) TRIM, LTRIM, RTRIM : 공백 포함 특정 문자 제거
    SELECT '     이것이      ', TRIM('     이것이      ') , RTRIM('     이것이      '), LTRIM('     이것이      ')
    FROM DUAL;
    
    --9) 