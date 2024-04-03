SELECT * FROM emp;

-- 필요한 열만 조회
SELECT EMPNO, ENAME, SAL FROM emp;				-- 사원번호, 사원이름, 월급 조회
-- 컬럼명에 별칭 만들어서 조회
SELECT ENAME AS "이름", SAL AS "월급" FROM emp; 	-- 컬럼명은 ""(큰따옴표) 사용
SELECT ENAME "이름", SAL "월급" FROM emp; 		-- AS  생략가능
-- 사원번호, 사원이름, 월급, 연봉 조회
SELECT EMPNO "사원번호", ENAME "사원이름", SAL "월급", SAL*12 "연봉" FROM emp;
--중복 칼럼 제외하고 조회
SELECT DISTINCT job FROM emp;
SELECT DISTINCT JOB, DEPTNO FROM emp;
--전체 조회
SELECT ALL JOB, DEPTNO FROM emp;

SELECT 'ABC' FROM DUAL;
SELECT 2 + 3 FROM DUAL;
SELECT 'ABC', 2 + 3 FROM DUAL;
SELECT 2 + 3 AS RESULT FROM DUAL;
SELECT 1 + '5' FROM DUAL;	-- 6
SELECT '1' + '5' FROM DUAL;	-- 6 숫자형이 기본

/*사원명과 업무로 연결(SMITH, CLERK) 표시하고 컬럼명은 EMPLOYEE AND JOB로 표시*/
SELECT ENAME || ', ' || JOB AS "EMPLOYEE AND JOB" FROM EMP;

/*사원별 연간 총 수입*/
SELECT ENAME , (SAL * 12 + NVL(COMM, 0)) AS "연간총수익" FROM emp;

-- SAL 기준으로 오름차순 정렬
SELECT * FROM emp ORDER BY SAL;
SELECT * FROM emp ORDER BY EMPNO; 
-- SAL 기준으로 내림차순 정렬
SELECT * FROM emp ORDER BY SAL DESC;
