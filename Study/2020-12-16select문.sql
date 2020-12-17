
--����Ʈ ��
/*
��Ƽ �ּ�
*/
select * from employees;
--employees�� ������ ���ΰ����� �Ͷ�
select * from departments;

--���ϴ� �÷� ��ȸ�ϱ�
SELECT employee_id,FIRST_name,last_name from employees;
--employees����employee_id,FIRST_name,last_name�� ������ ������ �Ͷ� 
--���پȿ� ��� ���� ����� �� ������� �ʴ´�. �׷��� �������鼭 ������ �Ѵ�.�� �ٸ��ߴ� ���� �߿�
SELECT employee_id,
       first_name,
       LAST_name 
from employees;
SELECT first_name,
       phone_number,
       hire_date,
       salary
FROM employees;

--����Ҷ� �÷��� ���� ����ϱ�

SELECT employee_id  "empNo",--sa���� ����
       first_name as "f-name",--""���̸� Ư�����ڵ� ����
       salary  ����
from employees;
--����� �����ȣ �̸�(first_name) ��(last_name) �޿� ��ȭ��ȣ �̸��� �Ի��Ϸ� ǥ�õǵ��� ����ϼ���
SELECT employee_id "�����ȣ",
       first_name "�̸�",
       last_name "��",
       salary "�޿�",
       phone_number "��ȭ��ȣ",
       email "�̸���",
       hire_date "�Ի���"
FROM employees;

--���� ������(Concatenation)�� �÷��� ���̱�
SELECT first_name || last_name
FROM employees;

SELECT first_name ||'  '|| last_name �̸�
FROM employees;

SELECT first_name ||' ''hire date is'' '||hire_date �Ի���
FROM employees;
--��������� ����ϱ�
SELECT first_name, salary
FROM employees;

SELECT first_name ,
       salary,
       salary*12
FROM employees;

SELECT first_name �̸�,
       salary �޿�,
       salary*12 ����,
       (salary+300)*12 "����+�󿩱�"
FROM employees;
--���ڿ� ��������� ���� �ʴ�����
select job_id*12--�����Ͱ� ���ڰ� �ƴ� �� ��ġ�� ������
FROM employees;

SELECT first_name|| '-'||last_name ����,
       salary �޿�,
       salary*12 ����,
       (salary*12)+5000 ����2,
       phone_number ��ȭ��ȣ
FROM employees;

SELECT job_id
FROM employees;

SELECT  first_name
FROM employees
WHERE department_id=10;

--������ 15000�̻��� ������� �̸��� ������ ����Ͻÿ�
SELECT  first_name,
        salary
FROM employees
WHERE salary > 15000;

--07/01/01 �� ���Ŀ� �Ի��� ������� �̸��� �Ի����� ����ϼ���
SELECT  first_name �̷�,
        hire_date �Ի���
FROM employees
WHERE hire_date >= '07/01/01';
--�̸��� Lex�� ������ ������ ����ϼ���
SELECT  salary ����
FROM employees
WHERE first_name = 'Lex';

--������ 2���̻� �϶� �Ѳ����� ��ȸ�ϱ�
--������ �ѹ��� �ϳ����� �����ϴ�.
select  first_name, 
        salary
from employees
where salary >=14000
AND salary <=17000;
--or�� �������� ������ or�� ���� �ϳ��� �����ϸ� �ȴ� �׷��� ������ or�ȵ�
select  first_name, 
        salary
from employees
where salary <=14000
or salary >=17000;
--17000����14000������ ������ ���� ����� �����ϱ� ������ or�� ���
--17000�̻� 14000���� �̴� ���� �ϳ��� �����ϸ� �Ǳ⿡ �׻��̿� �ִ� ����� ����.
SELECT  first_name, 
        hire_date
FROM employees
WHERE hire_date >=
'04/01/01'
AND hire_date <='05/12/31';

--�̻� ���� �� ����
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 14000 AND 17000;

--ebnetwwn and���� ǥ��
SELECT first_name, salary
FROM employees
WHERE salary in(14000,17000);



SELECT  first_name, 
        hire_date
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '05/12/31';

--IN �����ڷ� ���� ������ �˻��ϱ�

--�̸���'Neena','Lex','John'�� ������� �̸��� �� �׸��� ������ ��Ÿ���ÿ�
SELECT  first_name ,
        last_name,
        salary
FROM employees
WHERE first_name in('Neena','Lex','John');
--���� ������ �ϴ� ���̾ƴ϶� ���� �ϳ��� �����ϴ� ���� �ǹ�
--in ���� ǥ��
SELECT  first_name ,
        last_name,
        salary
FROM employees
WHERE first_name ='Neena'
or first_name='Lex'
or first_name='John';
--������ 2100, 3100, 4100, 5100 �� ����� �̸��� ������ ���Ͻÿ�
SELECT  first_name,
        salary
FROM employees
WHERE salary in(2100,3100,4100);

--Like �����ڷ� ����Ѱ͵� ��� ã��
select first_name, last_name, salary
from employees
where first_name like 'L%';
--first_name�� L�� ������ �ϴ� �̸��� ���� ����� �̸��� ������ �Ͷ�

--_L__
select  first_name,
        last_name,
        salary
from employees
where first_name like '_L%';
--�ι�°���ڰ� L�� �̸��� ������ �Ͷ�

--������ ���ڰ� am���� ������ �̸��� ã�ƶ�
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am';

--�̸���am�� ���Ը� �ϸ� ���
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am%';

--�̸��� �� �����ε� �ޱ��ڰ� a�ΰ�
select  first_name,
        last_name,
        salary
from employees
where first_name like '_a';
--�̸��� am �� ������ ����� �̸��� ������ ����ϼ���
select  first_name,
        last_name,
        salary
from employees
where first_name like '%am%';
--�̸��� �ι�° ���ڰ� a �� ����� �̸��� ������ ����ϼ���
select  first_name,
        last_name,
        salary
from employees
where first_name like '_a%';
--�̸��� �׹�° ���ڰ� a �� ����� �̸��� ����ϼ���
select  first_name,
        last_name,
        salary
from employees
where first_name like '____a%';
--�̸��� 4������ ����� ������ �ι�° ���ڰ� a�� ����� �̸��� ����ϼ���
select  first_name,
        last_name,
        salary
from employees
where first_name like '__a_';
--���� �Ʒ��� ���� ���̳� ���� ���� ���� ������ ����
select  first_name,
        last_name,
        salary
from employees
where first_name like '____'
AND first_name like '%a_';

--null
--�������̺��� �޿��� 13000���� 15000������
--������ �̸�,�޿�,Ŀ�̼�%,�޿�*Ŀ�̼� ���
SELECT  first_name,
        salary,
        commission_pct,
        salary*commission_pct
FROM employees
WHERE salary BETWEEN 13000 and 15000;

--Ŀ�̼��� null�� ����� ���
select first_name, salary, commission_pct
from employees
where commission_pct is null;
--Ŀ�̼��� null�� �ƴѰ��
select first_name, salary, commission_pct
from employees
where commission_pct is NOT null;
--Ŀ�̼Ǻ����� �ִ� ����� �̸��� ���� Ŀ�̼Ǻ����� ����ϼ���
select  first_name,
        salary, 
        salary*commission_pct
from employees
where commission_pct is NOT null;
--���Ŵ����� ���� Ŀ�̼Ǻ����� ���� ������ �̸��� ����ϼ���
SELECT  first_name
FROM employees
WHERE manager_id is NULL
AND commission_pct IS null;
--pk�� �̿�
SELECT email, employee_id
FROM employees
WHERE employee_id=110;--pk
/*
SELECT ��
    select��
    from��
    where��
    order by�� -->����
*/

--order by
--�޿��� ū�� ���� ����
SELECT first_name,
       salary
FROM employees
ORDER by salary DESC;
--�޿��� 9000�̻��� ��� �߱޿��� ū��� ������ ����
SELECT first_name,
       salary
FROM employees
WHERE salary>=9000
ORDER by salary DESC;--asc
--�޿��� 9000�̻��� ��� �߱޿��� ������� ������ ����
SELECT first_name,
       salary
FROM employees
WHERE salary>=9000
ORDER by salary ASC;--asc �� �����ص� ���� ������ ���ϴ°� ����

--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ, �޿�, �̸��� ����ϼ���
SELECT  department_id,
        salary,
        first_name
FROM employees
ORDER by department_id DESC;
--�޿��� 10000 �̻��� ������ �̸� �޿��� �޿��� ū�������� ����ϼ���
SELECT first_name,
       salary
FROM employees
WHERE salary>=10000
ORDER by salary DESC;
--�μ���ȣ�� ������������ �����ϰ� �μ���ȣ�� ������ �޿���
--���� ������� �μ���ȣ �޿� �̸��� ����ϼ���  
SELECT  department_id,
        salary,
        first_name
FROM employees
ORDER by department_id ASC,salary DESC;
--������ ������ �ΰ� ���ĵ� �޸��� ��� ���긦 �ڿ� �д�.
--�μ���ȣ�� �������� �޿��� ���� �����̴�.
SELECT  department_id,
        salary,
        first_name
FROM employees
ORDER by department_id,salary DESC;
/*�� ��쿡�� �μ���ȣ�� ���� �������� ������ �ȴ�.
���� �������� �� ��쿡�� ������ �����ϸ� ���� ���� �ȴٸ� ���� �������� �Ҷ��� 
desc�� ���ָ� �ȴ�.
*/


































































