CREATE TABLE author(
    author_id number(10),
    author_name VARCHAR2(100) not null,
    author_desc varchar2(500),
    PRIMARY key(author_id)
);
--묵시적 방법
INSERT INTO author 
VALUES(1,
       '박경리',
       '토지 작가'
);
/* 묵시적 방법 오류 상황
INSERT INTO author 
VALUES(3,'이문열',);
*/
--명시적 방법
INSERT INTO author( author_id, author_name )
VALUES (2, '박경리' );

--명시적 방법 오류  상황
INSERT INTO author( author_id, author_desc )
VALUES(3,'나혼자 산다 출연');
--테이블을 수정하는 방법
UPDATE author
SET author_name = '기안84',
    author_desc = '나혼자 산다 출연 웹툰작가'--수정을 할 대상을 알수가 없다.
WHERE author_id = 1;--조건절을 사용하여서 수정대상을 알려준다.
--수정을 잘못하는 상황
UPDATE author
SET author_name = '기안84',
    author_desc = '나혼자 산다 출연 웹툰작가';
    
UPDATE author
SET author_name = '오다 에이치로'
WHERE author_id = 1;
--author_id가 1인 데이터를 삭제한다.
DELETE FROM author
WHERE author_id = 1;
--author_id가 2인 데이터를 삭제한다.
DELETE FROM author
WHERE author_id = 2;

SELECT
    *
FROM author;

INSERT INTO author
VALUES(seq_author_id.nextval,'이문열','경북 영양');

INSERT INTO author
VALUES(seq_author_id.nextval,'박경리','경북 통영');

INSERT INTO author
VALUES(seq_author_id.nextval,'유시민','17대 국회의원');

--seq_author_id.nextval 스퀀스로 삽입을시킨다.
INSERT INTO author
VALUES(seq_author_id.nextval,'기안84','나혼자산다');

SELECT
    *
FROM author;

DELETE FROM author;
--데이터 삭제


--seq_author_id가 몇번 까지 썻는지를 조회한다.
SELECT seq_author_id.currval
FROM dual;

SELECT seq_author_id.nextval
FROM dual;
--실행을 하면 무조건 숫자가 올라간다.
--증가후 보여준다.

--시퀀스 조회
SELECT
    *
FROM user_sequences;

--번호표 기계-->시퀀스
CREATE SEQUENCE seq_author_id--기계를 만들어 준다
INCREMENT by 1 --버튼을 누를때 마다 1씩 나와라
START with 1;--시작 번호를 1부터 시작해라
--한번실행을 하면 실패를 해도 숫자는 올라간다
--예는 author에 소속되지 않은 독립된 기계다.

--시퀀스 삭제
DROP SEQUENCE seq_author_id















