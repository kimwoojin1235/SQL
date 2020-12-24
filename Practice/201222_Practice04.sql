
/*문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
(56건)
*/
SELECT  first_name,
        salary
FROM employees
WHERE salary<(SELECT avg(salary)
              FROM employees);
/*문제2. 
평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 급여(salary), 
평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요 
(51건)
*/
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary>=(SELECT avg(salary)
              FROM employees)
and salary<=(SELECT MAX(salary)
              FROM employees);
/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)
가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code),
도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/
SELECT  department_id
FROM employees
WHERE first_name ='Steven'
AND last_name ='King';

SELECT  d.location_id,
        lo.street_address,
        lo.postal_code,
        lo.city,
        lo.state_province,
        lo.country_id
FROM departments d,locations lo
WHERE d.location_id=lo.location_id
and d.department_id=(SELECT  department_id
                     FROM employees
                     WHERE first_name ='Steven'
                     AND last_name ='King');
                
SELECT  d.location_id,
        lo.street_address,
        lo.postal_code,
        lo.city,
        lo.state_province,
        lo.country_id
FROM departments d,locations lo,(SELECT  department_id as department_id
                                 FROM employees
                                 WHERE first_name ='Steven'
                                 AND last_name ='King')em
WHERE d.location_id=lo.location_id
and d.department_id = em.department_id;
             
/*
문제4.
job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 
출력하세요  -ANY연산자 사용
(74건)
*/
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary < any(SELECT salary
                   from employees
                   WHERE job_id='ST_MAN');
                   
/*
문제5. 
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id),
이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/
select  department_id,
        first_name,
        salary
from employees
WHERE department_id=20;

select  department_id,
        first_name,
        salary
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id);
                                  
SELECT  e.employee_id,
        e.first_name,
        e.salary esalary,
        e.department_id e_id,
        ds.department_id ds_id,
        ds.salary ds_salary
FROM employees e,(SELECT  department_id,
                         max(salary) as salary 
                 FROM employees               
                 GROUP by department_id) ds
WHERE e.department_id = ds.department_id
and e.salary = ds.salary;
/*
문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
(19건)
*/

SELECT  job_id,
        sum(salary)
FROM employees
GROUP by job_id;

SELECT  j.job_title 업무명,
        sum(e.salary) 연봉의합
FROM jobs j,employees e
WHERE (j.job_id,e.salary) in (SELECT  job_id,
                               sum(salary) 
                               FROM employees
                               GROUP by job_id)
GROUP by j.job_title,e.job_id;

SELECT  j.job_title 업무명,
        s.salary 연봉의합
FROM jobs j,(SELECT  job_id,
                     sum(salary) salary 
             FROM employees
             GROUP by job_id)s
WHERE j.job_id=s.job_id
ORDER by s.salary DESC;
                        
/*
문제7.
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 
급여(salary)을 조회하세요 
(38건)
*/
SELECT  e.employee_id,
        e.first_name,
        e.salary
FROM employees e,(SELECT  department_id,
                        AVG(salary) salary
                FROM employees
                GROUP by department_id) d
WHERE e.department_id=d.department_id 
and e.salary>d.salary ;


/*문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요
*/
SELECT  employee_id,
        first_name,
        salary,
        hire_date
FROM employees
ORDER by hire_date ASC;

SELECT  ROWNUM,
        o.employee_id,
        o.first_name,
        o.salary,
        o.hire_date
FROM (SELECT  employee_id,
              first_name,
              salary,
              hire_date
      FROM employees
      ORDER by hire_date ASC)o;

SELECT  ro.rn,
        ro.employee_id,
        ro.first_name,
        ro.salary,
        ro.hire_date
FROM (SELECT  ROWNUM rn,
        o.employee_id,
        o.first_name,
        o.salary,
        o.hire_date
FROM (SELECT  employee_id,
              first_name,
              salary,
              hire_date
      FROM employees
      ORDER by hire_date ASC)o)ro
WHERE ro.rn>=11
AND ro.rn<=15;












































































