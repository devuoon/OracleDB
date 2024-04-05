-- NULL 처리
SELECT * FROM EMP e;
SELECT COMM*1.1 FROM emp;
SELECT * FROM emp;
SELECT NVL(COMM, 0) FROM emp;				-- NVL(해당열, 대체값)
SELECT NVL(COMM, 0)*1.2 FROM emp;
SELECT NVL2(COMM, COMM*1.1, 0) FROM emp;	-- NVL2 (해당열, 정상값, NULL이면 대체값)
-- DECODE 함수 : 조건에 따라서 값을 선택
SELECT EMPNO, ENAME, JOB, SAL,
DECODE( JOB,				-- 해당열
	'MANAGER', SAL*1.1,		-- 'MANAGER'가 적용되는 값
	'SALESMAN', SAL*1.05,	-- 'SALESMAN' 적용되는 값
	'ALALYST', SAL,			
	SAL * 1.03) AS UPSAL	-- 그외 나머지
FROM emp;

SELECT EMPNO, ENAME, JOB, SAL, 
CASE JOB
	WHEN 'MANAGER' THEN SAL*1.1
	WHEN 'SALESMAN' THEN SAL*1.5
	WHEN 'ALALYST' THEN SAL
	ELSE SAL*1.03
END AS UPSAL
FROM emp;

-- 행 제한하기
SELECT * FROM emp;
SELECT * FROM EMP WHERE ROWNUM <= 5;

-- 다중함수(집계함수) : SUM, MIN, MAX, COUNT, AVG
SELECT * FROM emp;
SELECT COUNT(ENAME) FROM emp;
SELECT COMM FROM emp;

