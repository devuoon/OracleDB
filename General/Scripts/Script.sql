SELECT ENAME, UPPER(ENAME), LOWER(ENAME) FROM emp;
SELECT ENAME, INITCAP(ENAME) FROM emp;

SELECT EMPNO ,ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 10
UNION			-- 집합연산자
SELECT EMPNO ,ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 20; 

SELECT EMPNO ,ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 20;

SELECT EMPNO ,ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 10
UNION
SELECT SAL, JOB , DEPTNO, SAL FROM emp WHERE DEPTNO = 20;		-- 열의 갯수와 데이터유형이 같아야 한다. 첫번째 SELECT문이 기준

SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp 
MINUS			-- 차집합
SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 10;

SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp 
EXCEPT			-- 차집합
SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 10;

SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp
INTERSECT		-- 교집합
SELECT EMPNO, ENAME, SAL, DEPTNO FROM emp WHERE DEPTNO = 10;

SELECT ENAME, LENGTH(ENAME) FROM emp;

-- 이름 글자가 5글자 이상인 사원 출력
SELECT ENAME, LENGTH(ENAME) FROM emp WHERE LENGTH(ENAME) >= 5;

SELECT LENGTH('오라클'), LENGTHB('오라클') FROM dual;		-- LENGTH:문자길이, lengthb:바이트 크기

-- 문자열 일부를 추출 substr 함수
SELECT SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5) FROM emp; 

-- substr 함수를 사용해서 모든 사원의 이름을 세번째부터 출력
SELECT ENAME, SUBSTR(ENAME,3) AS "세번째글자부터" FROM emp;

-- 특정문자 위치를 찾는 INSTR 함수
SELECT instr('HELLO, ORACLE', 'L') AS INSTR1, 			-- 전체에서 찾기
		instr('HELLO, ORACLE', 'L',5) AS INSTR2,		-- 5번째 문자부터 찾기
		instr('HELLO, ORACLE', 'L',2, 2) AS INSTR3		-- 2번째 문자부터 길이
FROM dual;

-- 사원정보에서 s를 포함한 데이터 출력
SELECT * FROM EMP WHERE INSTR(ENAME,'S') > 0;
SELECT * FROM emp WHERE ENAME LIKE '%S%';

-- 문자변환 REPLACE 함수
SELECT '010-1234-5678' AS RELACE1,
	REPLACE('010-1234-5678', '-',' ') AS REPLACE2,		-- REPLACE (문자열, 찾는문자(필수), 대체문자(선택))
	REPLACE('010-1234-5678', '-') AS REPLACE3 
FROM dual;

-- 빈공간 메우는 LPAD, RPAD 함수
SELECT 'Oracle',
	LPAD('Oracle', 0, '#') AS LPAD1,					-- LPAD(문자열, 전체자리수, 빈자리채울문자)
	RPAD('Oracle', 10, '*') AS RPAD1,
	LPAD('Oracle', 10) AS LPAD2,
	RPAD('Oracle', 10) AS RPAD2
FROM dual;

-- 주민번호, 전화번호 끝 7자리, 4자리 처리
SELECT '970528-',
    RPAD('970528-', 15, '*') AS RPAD1,
    RPAD('010-1234-', 13,'*') AS RPAD2
FROM dual;

-- 특정문자를 지우는 TRIM, LTRIM, RTRIM 함수
SELECT '[' || TRIM(' __Oracle__') || ']' AS TRIM,		-- 앞뒤 공백 삭제
	'[' || TRIM(LEADING FROM '__Oracle__') || ']' AS TRIM_LEADING, 
	'[' || TRIM(TRAILING FROM '__Oracle__') || ']' AS TRIM_TRAILING,
	'[' || TRIM(BOTH FROM '__Oracle__') || ']' AS TRIM_BOTH
FROM dual;

-- 반올림 함수 ROUND


