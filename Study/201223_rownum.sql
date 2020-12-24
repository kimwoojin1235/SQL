/************************************
******rownum
*************************************/

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
SELECT  ROWNUM as num,
        employee_id,
        first_name,
        salary
FROM employees 
order by salary DESC;
--정렬을 시키고 rownum을 사용
select  department_id,
        employee_id,
        first_name,
        salary 
from employees
order by salary desc;

select  rownum,
        o.department_id,
        o.employee_id,
        o.first_name,
        o.salary
from (select  employee_id,
              first_name, --from이 제일 먼저 생성이됨 그러니까 여기서 정렬을함
              salary, --즉 정렬이 된상태로 들어감 그래서 rownum이 급여순으로 번호를 먹임
              department_id
       from employees
       order by salary desc)o--select로 정렬이된 테이블 사용
WHERE ROWNUM >=1  --where절 조건이 2이상은 되지가 않음
AND ROWNUM <=5;   --rownum은 일렬번호 이기 때문에 2부터 시작 되지가 않는다.
--즉 1번째 것이 버려 진다면 기존의 2번이 1번이 되면서 기존의2번도 버려지는걸 반복한다.

--정렬도 되어 있고 rownum도 되어 있는 테이블을 사용한다
--일련번호를 주고 바로 조건을 판단해서
SELECT  ro.rnum,
        ro.employee_id,
        ro.first_name,
        ro.salary
FROM (select  rownum rnum,
              o.department_id,
              o.employee_id,
              o.first_name,
              o.salary
     from (select  employee_id,
                   first_name, 
                   salary,
                   department_id
           from employees
           order by salary desc)o
     ) ro  --정렬도 되어 있고 rownum도 되어 있는 테이블
where rnum>=11
and rnum<=20;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? 
--07년 입사자 들을 고르고 급여별로 정렬 시킨다.
SELECT  first_name,
        salary,
        hire_date
FROM employees
WHERE hire_date >='07/01/01'
AND hire_date <= '07/12/31'
ORDER by salary DESC;
--정렬시킨걸 테이블로 사용하여 일련번호를 준다.
SELECT  ROWNUM,
        o.first_name,
        o.salary,
        o.hire_date
FROM (SELECT  first_name,
              salary,
              hire_date
      FROM employees
      WHERE hire_date >='07/01/01'
      AND hire_date <= '07/12/31'
      ORDER by salary DESC) o;

--위에걸 가지고 테이블로 사용하여 3등부터7등의정보를 출력한다.
SELECT  ro.rn,
        ro.first_name,
        ro.salary,
        ro.hire_date
FROM (SELECT  ROWNUM rn,--테이블이 되어서 컬럼이 된다.
              o.first_name,
              o.salary,
              o.hire_date
      FROM (SELECT  first_name,
                    salary,
                    hire_date
            FROM employees
            WHERE hire_date >='07/01/01'
            AND hire_date <= '07/12/31'
            ORDER by salary DESC)o
            )ro
WHERE ro.rn >=3 
AND ro.rn <=7;














































































































































































































