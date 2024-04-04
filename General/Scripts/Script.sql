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




