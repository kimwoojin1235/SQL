--셀렉트 문
/*
멀티 주석
*/
select * from employees;
--employees의 정보를 전부가지고 와라
select * from departments;

--원하는 컬럼 조회하기
SELECT employee_id,FIRST_name,last_name from employees;
--employees에서employee_id,FIRST_name,last_name의 정보만 가지고 와라 
--한줄안에 모두 쓰는 방법은 잘 사용하지 않는다. 그래서 내려쓰면서 정리를 한다.단 줄마추는 것은 중요
SELECT employee_id,
       first_name,
       LAST_name 
from employees;
SELECT first_name,
       phone_number,
       hire_date,
       salary
FROM employees;

--출력할때 컬럼에 별명 사용하기

SELECT employee_id  "empNo",--sa생략 가능
       first_name as "f-name",--""붙이면 특수문자등 가능
       salary  연봉
from employees;
--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
SELECT employee_id "사원번호",
       first_name "이름",
       last_name "성",
       salary "급여",
       phone_number "전화번호",
       email "이메일",
       hire_date "입사일"
FROM employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
SELECT first_name || last_name
FROM employees;

SELECT first_name ||'  '|| last_name 이름
FROM employees;

SELECT first_name ||' ''hire date is'' '||hire_date 입사일
FROM employees;
--산술연산자 사용하기
SELECT first_name, salary
FROM employees;

SELECT first_name ,
       salary,
       salary*12
FROM employees;

SELECT first_name 이름,
       salary 급여,
       salary*12 연봉,
       (salary+300)*12 "연봉+상여금"
FROM employees;
--문자열 산술연산자 되지 않는이유
select job_id*12--데이터가 숫자가 아님 즉 수치가 부적합
FROM employees;

SELECT first_name|| '-'||last_name 성명,
       salary 급여,
       salary*12 연봉,
       (salary*12)+5000 연봉2,
       phone_number 전화번호
FROM employees;

SELECT job_id
FROM employees;

SELECT  first_name
FROM employees
WHERE department_id=10;

--연봉이 15000이상인 사원들의 이름과 연봉을 출력하시오
SELECT  first_name,
        salary
FROM employees
WHERE salary > 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
SELECT  first_name 이룸,
        hire_date 입사일
FROM employees
WHERE hire_date >= '07/01/01';
--이름이 Lex인 직원의 연봉을 출력하세요
SELECT  salary 연봉
FROM employees
WHERE first_name = 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
--조건은 한번에 하나씩만 가능하다.
select  first_name, 
        salary
from employees
where salary >=14000
AND salary <=17000;
--or을 넣을수도 있으나 or은 둘중 하나만 만족하면 된다 그러니 지금은 or안됨
select  first_name, 
        salary
from employees
where salary <=14000
or salary >=17000;
--17000에서14000사이의 연봉을 가진 사람을 빼야하기 때문에 or을 사용
--17000이상 14000이하 이니 둘중 하나만 만족하면 되기에 그사이에 있는 사람은 뺀다.
SELECT  first_name, 
        hire_date
FROM employees
WHERE hire_date >=
'04/01/01'
AND hire_date <='05/12/31';

--이상 이하 만 가능
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 14000 AND 17000;

--ebnetwwn and같은 표현
SELECT first_name, salary
FROM employees
WHERE salary in(14000,17000);



SELECT  first_name, 
        hire_date
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '05/12/31';

--IN 연산자로 여러 조건을 검사하기

--이름이'Neena','Lex','John'인 사원들의 이름과 성 그리고 연봉을 나타내시오
SELECT  first_name ,
        last_name,
        salary
FROM employees
WHERE first_name in('Neena','Lex','John');
--전부 만족을 하는 것이아니라 이중 하나가 만족하는 것을 의미
--in 같은 표현
SELECT  first_name ,
        last_name,
        salary
FROM employees
WHERE first_name ='Neena'
or first_name='Lex'
or first_name='John';
--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
SELECT  first_name,
        salary
FROM employees
WHERE salary in(2100,3100,4100);

--Like 연산자로 비슷한것들 모두 찾기
select first_name, last_name, salary
from employees
where first_name like 'L%';
--first_name이 L로 시작을 하는 이름을 가진 사원의 이름을 가지고 와라

--_L__
select  first_name,
        last_name,
        salary
from employees
where first_name like '_L%';
--두번째글자가 L인 이름을 가지고 와라

--마지막 글자가 am으로 끝나는 이름을 찾아라
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am';

--이름의am를 포함만 하면 출력
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am%';

--이름이 두 글자인데 뒷글자가 a인것
select  first_name,
        last_name,
        salary
from employees
where first_name like '_a';
--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am%';
--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '_a%';
--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '____a%';
--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select  first_name,
        last_name,
        salary
from employees
where first_name like '__a_';
--위와 아래가 같은 것이나 위가 좀더 쉽게 갈수가 있음
select  first_name,
        last_name,
        salary
from employees
where first_name like '____'
AND first_name like '%a_';

--null
--직원테이블에서 급여가 13000에서 15000사이인
--직원의 이름,급여,커미션%,급여*커미션 출력
SELECT  first_name,
        salary,
        commission_pct,
        salary*commission_pct
FROM employees
WHERE salary BETWEEN 13000 and 15000;

--커미션이 null인 사람만 출력
select first_name, salary, commission_pct
from employees
where commission_pct is null;
--커미션이 null이 아닌경우
select first_name, salary, commission_pct
from employees
where commission_pct is NOT null;
--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select  first_name,
        salary, 
        salary*commission_pct
from employees
where commission_pct is NOT null;
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
SELECT  first_name
FROM employees
WHERE manager_id is NULL
AND commission_pct IS null;
--pk를 이용
SELECT email, employee_id
FROM employees
WHERE employee_id=110;--pk
/*
SELECT 문
    select절
    from절
    where절
    order by절 -->정렬
*/

--order by
--급여가 큰순 으로 정렬
SELECT first_name,
       salary
FROM employees
ORDER by salary DESC;
--급여가 9000이상인 사람 중급여가 큰사람 순으로 정렬
SELECT first_name,
       salary
FROM employees
WHERE salary>=9000
ORDER by salary DESC;--asc
--급여가 9000이상인 사람 중급여가 작은사람 순으로 정렬
SELECT first_name,
       salary
FROM employees
WHERE salary>=9000
ORDER by salary ASC;--asc 는 생략해도 괜찬 하지만 안하는게 좋지

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
SELECT  department_id,
        salary,
        first_name
FROM employees
ORDER by department_id DESC;
--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
SELECT first_name,
       salary
FROM employees
WHERE salary>=10000
ORDER by salary DESC;
--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가
--높은 사람부터 부서번호 급여 이름을 출력하세요  
SELECT  department_id,
        salary,
        first_name
FROM employees
ORDER by department_id ASC,salary DESC;
--메인을 앞으로 두고 정렬뒤 콤마를 찍고 서브를 뒤에 둔다.
--부서번호는 오름차순 급여는 오름 차순이다.
SELECT  department_id,
        salary,
        first_name
FROM employees
ORDER by department_id,salary DESC;
/*위 경우에는 부서번호가 오름 차순으로 고정이 된다.
오름 차순으로 갈 경우에는 생략이 가능하며 위와 같이 된다면 내림 차순으로 할때만 
desc를 써주면 된다.
*/


































































