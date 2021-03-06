--Practice01
/*
문제 1. 
전체직원의 다음 정보를 조회하세요. 
정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요.
이름(first_name last_name),  월급(salary),  전화번호(phone_number), 입사일(hire_date) 순서이고 
“이름”, “월급”, “전화번호”, “입사일” 로 컬럼이름을 대체해 보세요.
*/
SELECT  first_name 이름,
        salary 월급,
        phone_number 전화번호,
        hire_date 입사일
FROM employees
ORDER by hire_date asc;
/*
문제2.
업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 월급의 내림차순(DESC)로 정렬하세요.
*/
SELECT  job_id,
        salary
FROM employees
ORDER by job_id,salary DESC;
/*
문제3.
담당 매니저가 배정되어있으나 커미션비율이 없고,
월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
*/
SELECT  first_name,
        manager_id,
        commission_pct,
        salary
FROM employees
where commission_pct is null
AND manager_id is NOT null
and salary >3000
;

/*
문제4.
최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과
최고월급(max_salary)을 최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.    
*/
SELECT  job_id
FROM employees
WHERE salary>=10000
ORDER by salary DESC;
/*
문제5.
월급이 14000 미만 10000 이상인 직원의 이름(first_name),
월급, 커미션퍼센트 를  월급순(내림차순) 출력하세오. 단 커미션퍼센트 가 null 이면 0 으로 나타내시오

*/
SELECT  first_name,
        nvl(commission_pct,0)
FROM employees
WHERE salary>=10000
AND salary <14000
ORDER by salary asc;
/*
문제6.
부서번호가 10, 90, 100 인 직원의 이름, 월급, 입사일, 부서번호를 나타내시오
입사일은 1977-12 와 같이 표시하시오
*/
select  first_name,
        hire_date,
        department_id
from employees
where department_id in (10, 90, 100);

/*
문제7.
이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 월급을 나타내시오
*/
SELECT  first_name,
        salary
FROM employees
WHERE first_name LIKE '%S%'
OR first_name LIKE '%s%';

/*
문제8.
전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세오.
*/
SELECT  department_name
FROM    departments
ORDER BY length(department_name)desc;

/*
문제9.
정확하지 않지만, 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
올림차순(ASC)으로 정렬해 보세오.
*/
SELECT country_name
FROM countries
ORDER BY country_name ASC;
/*
문제10.
입사일이 03/12/31 일 이전 입사한 직원의 이름, 월급, 전화 번호, 입사일을 출력하세요
전화번호는 545-343-3433 과 같은 형태로 출력하시오.
*/
SELECT  first_name,
        salary,
        replace (phone_number,'.','-'),
        hire_date
FROM employees
WHERE hire_date <='03/12/31';




