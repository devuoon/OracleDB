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

-- 조건을 추가하는 WHERE절
SELECT * FROM emp WHERE EMPNO = 7839;

-- 사번 7689인 사원명과 업무, 급여 출력
SELECT ENAME, JOB, SAL FROM emp WHERE EMPNO = 7698;

-- SMITH의 사원명 부서 월급 출력
SELECT JOB, DEPTNO, SAL FROM emp WHERE ENAME = 'SMITH';

SELECT * FROM emp WHERE SAL = 3000;
-- 조건이 아닌 것만 출력
SELECT * FROM emp WHERE SAL != 3000;
SELECT * FROM emp WHERE SAL ^= 3000;
SELECT * FROM emp WHERE SAL <> 5000;
SELECT * FROM emp WHERE NOT SAL = 6000;

SELECT * FROM emp WHERE ENAME >= 'M';		-- 첫글자가 'M'과 같거나 큰 문자열 출력

-- 월급이 2500 이상이고 3000미만인 사원, 입사일, 월급을 조회
SELECT ENAME, HIREDATE, SAL FROM emp WHERE SAL >= 2500 AND SAL < 3000;

-- 월급이 2000이상이고 3000이하에 포함되지 않는 사원명과 월급, 입사일을 조회
SELECT ENAME, SAL, HIREDATE FROM emp WHERE NOT SAL >= 2000 AND SAL <= 3000;
SELECT * FROM emp WHERE SAL BETWEEN 2500 AND 3000;

-- 81년 5월1일과 12월 3일 사이에 입사한 사원, 급여, 입사일을 조회
SELECT ENAME, SAL, HIREDATE FROM emp WHERE HIREDATE BETWEEN TO_DATE('19810501','YYYYMMDD') AND TO_DATE('19811203','YYYYMMDD');
SELECT ENAME, SAL, HIREDATE FROM emp WHERE HIREDATE BETWEEN '1981-05-01' AND '1981-12-03';

--1987년에 입사한 사원, 월급, 
SELECT ENAME, SAL, HIREDATE FROM emp WHERE EXTRACT(YEAR FROM HIREDATE) = 1987;

-- 직업이 MANAGER, CLERK, SALESMAN인 결과 조회
SELECT * FROM emp WHERE JOB = 'MANAGER' OR JOB = 'CLERK' OR JOB = 'SALESMAN';
SELECT * FROM emp WHERE JOB IN ('MANAGER', 'CLERK', 'SALESMAN');

-- 사번이 7506, 7782, 7934인 사원을 제외한 사번, 이름, 월급 출력
SELECT EMPNO, ENAME, SAL FROM emp WHERE EMPNO IN (7566, 7782, 7934);

-- 부서번호 30에서 근무하고 월 2000달러 이하를 받는 81년 5월 1일 이전에 입사한 사원, 급여, 사원번호, 입사일 출력
SELECT ENAME, SAL, EMPNO, HIREDATE FROM emp WHERE DEPTNO = 30 AND SAL <= 2000 AND HIREDATE <= '1981-05-01';

-- 잡이 MANAGER OR SALESMAN 급여 1600, 2975, 2850가 아닌 사원명, 입사일, 급여, 부서번호 출력
SELECT ENAME, HIREDATE, SAL, EMPNO FROM emp WHERE (JOB = 'MANAGER' OR JOB = 'SALESMAN') AND SAL NOT IN (1600, 2975, 2850);

-- 와일드카드 
SELECT * FROM emp WHERE ENAME LIKE 'S%'; 		-- 첫 글자가 'S'인 문자열 출력
SELECT * FROM emp WHERE ENAME LIKE '_L%';		-- 두번째글자가 'L'인 문자열 출력 
-- 1.사원이름 중에 'S'가 포함되지 않는 부서번호 20인 사원의 이름, 부서번호 조회
SELECT ENAME, DEPTNO FROM emp WHERE ENAME NOT LIKE '%S%' AND DEPTNO = '20';
-- 2.1981.6.1 ~ 1981.12.31 입사자 중 부서명이 30인 사원의 부서번호, 사원명, 직업, 입사일 출력  
SELECT DEPTNO, ENAME, JOB, HIREDATE 
FROM EMP 
WHERE DEPTNO = '30' AND HIREDATE BETWEEN '19810601' AND '19811231'
ORDER BY HIREDATE;
