SELECT * FROM EMP;
SELECT * FROM DEPT;
-- 1. emp테이블에서 입사일 순으로 사원번호, 이름, 업무, 급여, 입사일자, 부서번호 조회
SELECT EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO 
FROM EMP
ORDER BY HIREDATE;

-- 2. emp테이블에서 부서번호로 정렬한 후 급여가 많은 순으로 사원번호, 성명, 업무, 부서번호, 급여를 조회
SELECT EMPNO, ENAME, JOB, DEPTNO, SAL
FROM EMP e 
ORDER BY DEPTNO, SAL DESC;

-- 3. emp테이블에서 모든 SALESMAN의 급여 평균, 최고액, 최저액, 합계를 조회
SELECT AVG(SAL) AS "급여 평균", MAX(SAL) "최고액", MIN(SAL) "최저액", SUM(SAL) "합계"
FROM EMP
WHERE JOB = 'SALESMAN';

-- 4. emp테이블에서 각 부서별로 인원수, 급여의 평균, 최저급여, 최고급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력
SELECT D.DNAME, COUNT(E.EMPNO) "인원수", AVG(E.SAL) "급여평균", MIN(E.SAL) "최저급여", MAX(E.SAL) "최고급여", SUM(E.SAL) "급여의 합"
FROM EMP E LEFT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
GROUP BY E.DEPTNO, D.DNAME
ORDER BY SUM(E.SAL) DESC;
