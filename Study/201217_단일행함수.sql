/*단일행 함수*/
--INITCAP(컬럼명)
--department_id가 100번인 사원 을 불러온다\
--첫글자만 대문자로 변경
SELECT  email "메일",
        INITCAP(first_name),
        department_id
FROM employees
WHERE department_id=100;

--변형
--이름을 INITCAP을 이용하여 출력을 한다.
SELECT  INITCAP(first_name)||' '||initcap(last_name),
        salary
FROM employees
WHERE salary>=10000;

--문자함수 – LOWER(컬럼명) / UPPER(컬럼명)
--LOWER:소문자로 변경 UPPER:대문자로 변경
SELECT  first_name,
        lower(first_name),
        UPPER(first_name) 
FROM employees
WHERE department_id =100;
--변형
--first_name을 대문자로last_name을 소문자로 출력을 한다.
SELECT  upper(first_name)||' '||lower(last_name) "이름",
        department_id
FROM employees
WHERE department_id =100;

--문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
--주어진 문자열에서 특정길이의 문자열을 구하는 함수
SELECT  first_name,
        SUBSTR(first_name,1,3),--1번째 문자에서 1번 문자 포함 3개 출력
        SUBSTR(first_name,-3,3)--뒤에서 3번째 문자부터 -3번문자 포함 3개 출력
FROM employees
WHERE department_id=100;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) /  RPAD(컬럼명, 자리수, ‘채울문자’)
--lpad는 왼쪽 rpad는 오른쪽 에서 채운다
SELECT  first_name,
        lpad(first_name,10,'*'),--문자열의 개수의 상관없이 문자열+*을 10를 맞춘다.
        rpad(first_name,10,'*')--문자열의 개수의 상관없이 문자열+*을 10개를 맞춘다.
FROM employees;
--문자함수 – REPLACE (컬럼명, 문자1, 문자2)
select first_name, 
       replace(first_name, 'a', '*') --a를 별로 바꿔라 대신할 것의 갰수는 상관없음
from employees
where department_id =100;

select first_name, 
       replace(first_name, 'a', '*'), 
       replace(first_name, substr(first_name, 2, 3), '***')
       --이름의 2번 문자를 포함 3개를 *로 바꾼다.
       --replace(컬럼명,바꿀대상,바꿀문자)
from employees
where department_id =100;
--변형
select  first_name,
        last_name  ,
        replace (first_name ||' '||last_name,substr(first_name ||' '||last_name,1,1),'*')
from employees
where department_id =100;
--숫자함수 – ROUND(숫자, 출력을 원하는 자리수) 
SELECT  round(123.456, 3)r2,--3은 소수점 1번째 자리부터 입력된 값의 자리까지 출력
        round(123.456, 0)r1,
        round(123.456, -2)r0-- -1은 소수점을 기준으로 왼쪽으로 가면서0으로 출력 
        --점이 없다면 수의 오른쪽 수를 기준으로 한다
FROM dual;--가상의 테이블 아무것도 없다
--salary의 뒤에서 3번째 수까지 0으로 바꿈
--주어진 숫자의 반올림을 한다.
SELECT  salary,
        round(salary,-3) "sr2"
FROM employees;
--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수) 
--주어진 숫자의 버림을 하는 함수
select  trunc(123.456,2)"r2",
        trunc(123.456,0)"r0",
        trunc(123.456,-1)"r-1"
from dual;
--날짜함수 – SYSDATE()
--현재시간을 찍어보는 함수
SELECT sysdate
FROM dual;
SELECT  sysdate,
        first_name
FROM employees;            
--단일함수>날짜함수 – MONTH_BETWEEN(d1, d2) 
--몇개월 차이인지 알려준다. 소수점 단위도 알려줌
SELECT SYSDATE,
        hire_date,
       -- MONTHS_BETWEEN(SYSDATE,hire_date) as "workmonth",
        trunc(MONTHS_BETWEEN(SYSDATE,hire_date),0) "workmonth"
FROM employees
WHERE department_id=100;
--날짜함수 LAST_day(di)
SELECT  LAST_day('19/02/06'),--실행한 달의 마지막달을 출력
        LAST_DAY(SYSDATE)--올해의 마지막날
FROM dual;

--TO_CHAR(숫자, ‘출력모양’)  숫자형문자형으로 변환하기
SELECT  first_name,
        salary,
        salary*12,
        to_char(salary*1200,'$999,999,999.00'),
        --숫자열을 문자열로 만든 다음 모양의 맞게끔 만든다 
        --모양을 만들때 9가 아닌 8로 한경우
        --to_char(salary*1200,'$888,888,888.00'),
        --ORA-01481: invalid number format model 오류메시지
        --달러를 없엔다면
        to_char(salary*1200,'999,999,999.00'),
        --  14,409,600.00 출력값
        --소수점을 없엔다면
        to_char(salary*12,'999,999,999'),
        --14,409,600 출력값
        --5자리 숫자까지 나타낸다면
        to_char(salary*12,'99999')
        --###### 숫자의 범위를 넘어가면 #으로 출력
FROM employees
WHERE department_id = 100;
--TO_CHAR(숫자, ‘출력모양’)  날짜문자형으로 변환하기
SELECT  sysdate,
        --날짜
        TO_CHAR(sysdate,'yyyy') yyyy,--연도
        TO_CHAR(sysdate,'yyy') yy,--연도 간소화로 출력
        TO_CHAR(sysdate,'mm')mm,--월출력
        --TO_CHAR(sysdate,'m') 안됨
        TO_CHAR(sysdate,'mmmm')mmm,--1212출력
        TO_CHAR(sysdate,'month')mon,--12월로 출력
        TO_CHAR(sysdate,'mon')mon1 ,--month와 동일
        TO_CHAR(sysdate,'dd') dd,--날짜출력
        TO_CHAR(sysdate,'day') day,--요일 출력
        --시간
        TO_CHAR(sysdate, 'hh') "hh",--시간을 표기
        TO_CHAR(sysdate, 'hh24') "hh24",--시간을 24간으로 표기
        TO_CHAR(sysdate, 'mi') "mi",--분을 표기
        TO_CHAR(sysdate, 'ss') "ss"--초를 표기
FROM dual;
SELECT  sysdate,
        TO_CHAR(sysdate,'yyyy-mm-dd hh24:mi:ss') "",
        TO_CHAR(sysdate,'yyyy"년"mm"월"dd"일"'),--년,월,일로 날짜를 표기함
        TO_CHAR(sysdate, 'hh24"시"mi"분"ss"초"')
FROM dual;

SELECT  first_name,
        hire_date,
        TO_CHAR(hire_date,'yyyy-mm-dd hh24:mi:ss'),
        TO_CHAR(hire_date,'yy-mm-dd hh24:mi:ss')
FROM employees;

--일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
--nvl 함수 사용
--평균같이 계산에 참여할 경우 null을 0으로 변경
SELECT  first_name,
        nvl(commission_pct,0)
FROM employees;
--nvl2 함수 사용
--null이 아닐때 100으로 바꿈
select  commission_pct,
        nvl2(commission_pct, 100, 0)
from employees;

































