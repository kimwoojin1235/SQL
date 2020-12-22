/* 전날 복습
inner join --> null제외
   inner join~on
outer join => 기준이 되는 쪽은 포함 비교되는 쪽은 null표시
 left outer join~on
 right outer join~on-->left outer join~on으로 바꿀수가 있음
 full outer join~on
*/
--기존의 방식
SELECT  em.first_name,
        em.department_id,
        de.department_name,
        de.department_id
FROM employees em,departments de
WHERE  em.department_id = de.department_id;

--INNER JOIN~on을 사용한경우
SELECT  em.first_name,
        em.department_id,
        de.department_name,
        de.department_id
FROM employees em INNER JOIN departments de
on  em.department_id = de.department_id;
/*
SubQuery
*/
--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary >10000;

--급여가 10000보다 많은 사람을 출력을 한다.
--1.이제 den의 월급을 찾아본다
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE first_name='Den';
--2.den의 의급여보다 높은사람
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary >11000;

--1개의 질문으로 해결한다.
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary >(SELECT  salary
               FROM employees
               WHERE first_name='Den');
--질문자체를 괄호안에 넣어서 괄호 안에서 den의 급여를 꺼내고
--WHERE으로 den 의 급여보더 먾은 사람을 골라 출력한다.

--예제)
--급여를 가장 적게 받는 사람의 이름,급여,사원번호 출력
/*가정
1.가장 적은 급여액수는?
2.가장 적은 급여를 받는 사람의 이름,급여,사원번호는?
*/
--1. 가장 적은 급여는?=2100
SELECT MIN(salary)
FROM employees;
--질문들을 조합한다.
SELECT  first_name,
        salary,
        employee_id
FROM employees
WHERE salary = (SELECT MIN(salary)
                 FROM employees);

--예제
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
--1.평균급여를 구한다.
SELECT avg(salary)
FROM employees;
--2.질문을 조합한다.
SELECT  first_name,
        salary
FROM employees
WHERE salary<(SELECT avg(salary)
              FROM employees)
ORDER by salary desc;--불편하니 정렬

--예제
--부서 번호가 110인 직원의 급여와 같은 모든 직원의 
--사번,이름,급여를 출력하시오
--1.부서번호110인 직원의 이름,급여,리스트
SELECT  salary
FROM employees
WHERE department_id = 110;
--2.전체직원중 급여가 12008이거나 8300인 사람 
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary =12008 
OR salary=8300;
--in을 이용하여서 구하는 방법
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary in(12008,8300);
--3.질문들을 조합한다.
SELECT  department_id,
        first_name,
        salary
FROM employees
WHERE salary in(SELECT  salary
                FROM employees
                WHERE department_id = 110);
--이 경우에는 출력물이 하나 이상이기 때문에 단일행이 아닌 다중행이
--된다 그렇기에 =로는 서브쿼리를 진행할수가 없다 그렇기에 in을 사용한다.

--예제
--각 부서별로 최고급여를 받는 사원을 출력하세요
--1.각 부서별로 최고 급여를 찾아낸다.
SELECT  MAX(salary),
        department_id
FROM employees
GROUP by department_id;
--최고급여자가 누구인지는 모름
--2.일단 주먹구식으로 각 부서별 최고급여자의 이름을 찾음
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
--서브쿼리문의 질문과 비교를 해야 하는 것이 2가지인 상황
--부서코드와 급여 두가지 조건을 비교하여서 최고급여자 만을 출력한다.
--조건이 2개이상인 경우에는 질문과 같은 형태를 가져야 한다.

--예제
--부서 번호가 110인 직원의 급여와 같은 모든 직원의 
--사번,이름,급여를 출력하시오
--부서번호 110인 직원의 급여 리스트
SELECT  first_name,
        salary
FROM employees
WHERE department_id=110;
--급여를 12008이상을 받는 직원 리스트
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary>12008;
--급여를 8300이상을 받는 직원 리스트
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary>8300;
--질문들을 합해서 출력
SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary> any(SELECT salary
                 FROM employees
                 WHERE department_id=110);
--급여를 부서코드 110인 직원이상으로 받는 사람들을 출력해줘
--즉 급여가12008과8300이상인 모든 직원들을 출력을 한것
--any는 or과 비슷 해서 둘중 한가지만 만족해도 출력한다.

SELECT  employee_id,
        first_name,
        salary
FROM employees
WHERE salary> all(SELECT salary
                 FROM employees
                 WHERE department_id=110);
--두가지 조건을 모두 만족한 것들만 출력을 한다.
--즉 12008이상인 것을 출력을 하는 상황
--all은 and와 같은 의미 이다

--테이블에서 서브쿼리를 만들어서 조인으로 사용
--쿼리문으로 안보이는 가상의 테이블자체를 만든것이다.
--각부서별 최고급여를 받는 사원을 출력하시오
--1.각 부서별로 최고 급여 테이블
SELECT  department_id,
        max(salary)
FROM employees
GROUP by department_id;
--이번에는 비교하는 용도가 아닌 테이블로 사용을 할예정
--2.직원 테이블 (1)테이블 join 한다.
SELECT  e.employee_id,
        e.first_name,
        e.salary esalary,
        e.department_id e_id,
        ds.department_id ds_id,
        ds.salary ds_salary
FROM employees e,(SELECT  department_id,
                         max(salary) as salary -- 컬럼의 명을 지어야 한다.
                 FROM employees                --별명이 아니라 컬럼명이다. 
                 GROUP by department_id) ds
WHERE e.department_id = ds.department_id
and e.salary = ds.salary;














