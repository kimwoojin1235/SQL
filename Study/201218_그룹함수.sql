--그룹함수

--avg 함수
--오류발생 공부해둘것
SELECT  AVG(salary),
        first_name
FROM employees;

SELECT  AVG(salary)
FROM employees;

--그룹함수 - count()
SELECT  COUNT(*)
FROM employees;
--데이터 값이 있던없던 데이터가 있다면 가지고 출력
SELECT  COUNT(commission_pct)
FROM employees;
--null이 있다면은 제외하고 없는것만 골라라
SELECT  COUNT(*) --조건절 추가
FROM employees
WHERE salary >16000;
--급여가 16000초과인 인원을 출력하시오

--그룹함수 - sum()
SELECT  sum(salary)
FROM employees;

SELECT  sum(salary)
FROM employees
WHERE salary >=10000;
--조건절을 추가해 보았다.
SELECT SUM(salary), COUNT(commission_pct)
FROM employees;
--두개의 그룹함수를 사용

--그룹함수 - avg() null일때 0으로 변환
SELECT  COUNT(*),
        sum(salary),
        avg(nvl(salary,0))
FROM employees;
--그룹함수 - max() / min()
SELECT  MAX(salary)
FROM employees;
--최대값을 구한다

SELECT  min(salary)
FROM employees;
--최소값을 구한다.

--정렬이 필요한 경우 많은 연산을 해야한다.
SELECT  MAX(salary),
        MIN(salary),
        COUNT(*)
FROM employees;

--GROUP BY 절
SELECT  department_id ,
        AVG(salary)--오류가남
FROM employees; 

--그룹으로 묶어서 평균을 구해라
SELECT  department_id,
        AVG(salary)
FROM employees
GROUP by department_id;
--같은 부서 끼리 그룹을 지었다.

--GROUP BY 절 – 자주하는 오류
SELECT  department_id,
        COUNT(*),
        sum(salary)
FROM employees
GROUP by department_id;

--department_id를 기준으로 나타낸다.
SELECT  department_id,
        COUNT(*),
        sum(salary),
        job_id
FROM employees
GROUP by department_id;
-- job_id는 기준으로 잡혀있지가 않기 때문에 오류가 생긴다.

SELECT  department_id,
        job_id,
        COUNT(*),
        sum(salary),
        AVG(salary)
FROM employees
GROUP by department_id,job_id
order by department_id asc;
--department_id로 1차적인 그룹을 잡고 안에서job_id오 세부적인 그룹을 잡았다.

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 ,
--인원수, 급여합계를 출력하세요
SELECT  department_id,
        COUNT(*),
        sum(salary)
FROM employees
--WHERE  sum(salary) >=20000
GROUP by department_id;
--WHERE에서는 그룹함수를 쓸수가 없다

--HAVING 절
SELECT  department_id,
        COUNT(*),
        sum(salary)
FROM employees
GROUP by department_id
HAVING sum(salary)>=20000;
--having 절에는그룹함수 와 
--Group by에 참여한 컬럼만 사용할 수 있다. 

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000
and department_id = 5;
--department_id는 그룹에 들어가
--있기 때문에 HAVING들어갈수 있음

--CASE ~ END 문

--업무의 따라서 상여금의 %달리하고 싶다.
SELECT  employee_id,
        salary,
        job_id,
        CASE  WHEN job_id='AC_ACCOUNT' then salary *0.1
              WHEN job_id='SA_REP' then salary*0.2
              WHEN job_id='ST_CLERK' then salary *0.3
              else salary*0--처리문의 계산식을 통일시켜 준다.
        end bonus --별명을 지어준다.
FROM employees;

SELECT employee_id, 
       salary,
	 DECODE( job_id, 'AC_ACCOUNT',salary * 0.1,
                     'SA_REP',    salary * 0.2,
                     'ST_CLERK',  salary * 0.3,
                     salary*0 --해당되지 않는다면
           ) bonus
FROM employees;

--직원의 이름, 부서, 팀을 출력하세요팀은 코드로 결정하며 부서코드가 10~50 이면
--‘A-TEAM’60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
SELECT  first_name,
        department_id,
        CASE WHEN  department_id <=50 THEN 'A-TEAM'
             WHEN  department_id <=100 THEN 'B-TEAM'
             WHEN  department_id <=150 THEN 'C-TEAM'
             ELSE '팀없음'
        end team
FROM employees;
















































































