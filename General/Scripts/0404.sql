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
SELECT ROUND(1234.5678),
		ROUND(1234.5678, 0),
		ROUND(1234.5678, 1),
		ROUND(1234.5678, -1),			-- 자연수 첫째자리 반올림
		ROUND(1234.5678, 2)				-- 소수점 둘째자리 반올림
FROM DUAL;

-- 버림 함수 TRUNC
SELECT TRUNC(1234.5678),
		TRUNC(1234.5678, 0),
		TRUNC(1234.5678, 1),
		TRUNC(1234.5678, -1)
FROM DUAL;

-- 나머지를 구하는 함수 MOD
SELECT MOD(15, 2), MOD(10, 2), MOD(11, 2) FROM DUAL;

-- 각 사원별 시급을 계산하여 부서번호, 사원이름, 시급을 출력 
--1. 한달 근무일시 20일, 하루 근무 시간은 8시간
--2. 부서별로 오름차순 정렬
--3. 시급은 소수 2자리에서
--4. 시급은 높은순으로 출력
SELECT DEPTNO "부서번호", ENAME "사원이름", ROUND((SAL / 20) / 8, 1) "시급"  
FROM emp 
ORDER BY DEPTNO, "시급" DESC;

-- 날짜 함수 
SELECT SYSDATE AS NOW,
		SYSDATE -1 AS YESTERDAY,
		SYSDATE +1 AS TOMORROW
FROM DUAL;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)  
FROM DUAL;

-- 입사 10주년이 되는 사원들 출력
SELECT EMPNO "사원번호", ENAME "사원이름", HIREDATE "입사날짜", ADD_MONTHS(HIREDATE, 120) "10주년 날짜"
FROM emp;

-- 두 날짜간의 개월 차
SELECT EMPNO "사원번호", ENAME "사원이름", HIREDATE "입사날짜", SYSDATE, 
		MONTHS_BETWEEN(HIREDATE, SYSDATE) "MONTH1",
		MONTHS_BETWEEN(SYSDATE, HIREDATE) "MONTH2",
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
FROM emp;

-- 요일, 마지막 날짜
SELECT SYSDATE, 
	NEXT_DAY(SYSDATE, '월요일'),
	LAST_DAY(SYSDATE)			-- 특정날짜가 속한 달의 마지막 날
FROM DUAL;

SELECT SYSDATE,
	ROUND(SYSDATE, 'CC') AS FORMGKSAT_CC,
	ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY
FROM DUAL;

-- 형 변환 함수
SELECT EMPNO, ENAME, EMPNO + '500' FROM emp WHERE ENAME = 'SCOTT';
SELECT 'ABCD' + EMPNO, EMPNO FROM emp WHERE ENAME = 'SCOTT';

-- 날짜 표현 함수
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM DUAL;
SELECT SYSDATE,
	TO_CHAR(SYSDATE, 'MM') AS MM,
	TO_CHAR(SYSDATE, 'MON') AS MON,
	TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
	TO_CHAR(SYSDATE, 'DD') AS DD,
	TO_CHAR(SYSDATE, 'DY') AS DY,
	TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

SELECT SYSDATE,
	TO_CHAR(SYSDATE, 'MM') AS MM,
	TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_K,
	TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_J,
	TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_E,
	TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_K,
	TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_E
FROM DUAL;

SELECT SYSDATE,
	TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
	TO_CHAR(SYSDATE, 'HH12:MI:SS') AS HHMISS_AM,
	TO_CHAR(SYSDATE, 'HH:MI,SS P.M.') AS HHMISS_PM
FROM DUAL;

SELECT TO_DATE('2019-04-04', 'YYYY-MM-DD') AS TODATE,
	TO_DATE('20100301', 'YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- 1981년 12월 1일 이후에 입사한 사원정보 출력
SELECT * FROM emp WHERE HIREDATE >= TO_DATE('1981-12-01');
