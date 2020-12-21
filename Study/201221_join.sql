--*******************************
--join
--*******************************
--기본개념
SELECT  first_name name,
        department_name de_name,
        em.department_id
FROM employees em,departments de
WHERE em.department_id=de.department_id;
--두개의 데이터를 매칭을 시키는 가장 기본적인 문법
--em.department_id와de.department_id의 아이디가 같다면 
--그리고 null값은 없는 데이터값이기에 출력이 되지 않는다.

--예제)모든 직원이름, 부서이름, 업무명 을 출력하세요
SELECT  e.first_name,
        e.job_id,
        j.job_id,
        d.department_name,
        j.job_title
FROM employees e,departments d,jobs j
WHERE e.department_id = d.department_id
AND j.job_id = e.job_id;
--이 예제의 경우에는 employees가 departments와는 department_id가
--중복이 되고 jobs와는 job_id가 중복이 되기 때문에 둘을 비교하고 
--두 조건이 만족한것만 출력을 한다.

--left outer join
SELECT  em.department_id,
        em.first_name,
        de.department_id
FROM employees em LEFT OUTER join departments de
on em.department_id=de.department_id;
--employees를 기준으로 생각을 한다.
--employees가 기준이기 때문에 데이터 값이 null이라도 출력을 한다.

--left outer join
SELECT  em.department_id,
        em.first_name,
        de.department_id
FROM employees em right outer join departments de
on em.department_id=de.department_id;
--departments가 기준이 된다 그러기에 departments에있는 null값도 출력이된다.

--right outer join  left outer join
SELECT  em.department_id,
        em.first_name,
        de.department_id
FROM departments de LEFT OUTER JOIN employees em
on em.department_id=de.department_id;

--full outer join
select  e.department_id,
        e.first_name, 
        d.department_name,
        d.department_id
from employees e full outer join departments d
on e.department_id = d.department_id ; 

SELECT  em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
FROM employees em, departments de
WHERE em.department_id(+)=de.department_id(+);--사용x

--무조건 적으로 별명을 붙인곳은 별명을 쓴다 이건 약속이다.
--alias
--join실행순서
SELECT  em.first_name,
        de.department_name,
        de.department_id
FROM employees em, departments de
WHERE em.department_id=de.department_id
ORDER by em.department_id DESC;
--조건이 맞은 건만 채택하고 나머지는 버림
--정렬은 select에 있는 값으로 하는 것이 아니라
--from안에 있는 테이블안에 있는 값으로 한다.
--즉 적지 않아도 정렬은 된다.
SELECT employee_id,
        first_name,
        manager_id
FROM employees;

--Self Join
select emp.employee_id, emp.first_name, 
       emp.manager_id, man.first_name manager 
from employees emp LEFT OUTER JOIN employees man
on emp.manager_id = man.employee_id
ORDER by emp.employee_id DESC;

--잘못된 사용
SELECT *
FROM employees em, locations lo
WHERE em.salary=lo.location_id;
--상관이 없는 것 끼리 비교하고 억지로 묶음

--OUTER JOIN 사용시 테이블이 3가지 라면은 on에 테이블을 선언한다.
--그리고 on을 나오면 WHERE으로 조건을 달아도 됨 
SELECT  emp.employee_id,
        emp.first_name,
        de.department_name,
        man.first_name manager
FROM employees emp LEFT OUTER JOIN departments de
on emp.department_id= de.department_id, employees man
WHERE man.employee_id=de.manager_id;


