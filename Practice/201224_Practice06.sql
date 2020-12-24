--book 테이블을 만든다.
CREATE TABLE book (
  book_id NUMBER(10),
  title	VARCHAR2(100) 	NOT NULL,
  pubs	VARCHAR2(100),
  pub_date	 DATE,
  author_id NUMBER(10),
  PRIMARY KEY(book_id),
  CONSTRAINT c_book_fk FOREIGN KEY (author_id)
  REFERENCES author(author_id)
);

--aurhor 테이블 생성
CREATE TABLE author (
  author_id	NUMBER(10),
  author_name	VARCHAR2(100) 	NOT NULL,
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);

--book 시퀀스 생성
CREATE SEQUENCE seq_book_id
INCREMENT by 1 
START with 1;

--aurhor 시퀀스 생성
CREATE SEQUENCE seq_author_id
INCREMENT by 1 
START with 1;
--aurhor 데이터
INSERT into author
VALUES(seq_author_id.nextval,'이문열','경북 영양');

INSERT into author
VALUES(seq_author_id.nextval,'박경림','경남 통영');

INSERT into author
VALUES(seq_author_id.nextval,'유시민','17대 국회 의원');

INSERT into author
VALUES(seq_author_id.nextval,'기안84','기안동에서 산 84년생');

INSERT into author
VALUES(seq_author_id.nextval,'강풀','온라인 만화가 1세대');

INSERT into author
VALUES(seq_author_id.nextval,'심영하','알쓸신잡');

--book데이터
INSERT into book
VALUES(seq_book_id.nextval,'우리들의 일그러진 영웅','다림','1998-02-22',1);

INSERT into book
VALUES(seq_book_id.nextval,'삼국지','민음사','2002-03-01',1);

INSERT into book
VALUES(seq_book_id.nextval,'토지','마로니에북스','2012-08-15',2);

INSERT into book
VALUES(seq_book_id.nextval,'유시민의 글쓰기 특강','생각의길','2015-04-01',3);

INSERT into book
VALUES(seq_book_id.nextval,'패션왕','중앙북스(books)','2012-02-22',4);

INSERT into book
VALUES(seq_book_id.nextval,'순정만화','재미주의','2011-08-03',5);

INSERT into book
VALUES(seq_book_id.nextval,'오직두사람','문학동네','2019-04-04',6);

INSERT into book
VALUES(seq_book_id.nextval,'26년','재미주의','2012-08-04',5);
--select
SELECT
    *
FROM book;
SELECT
    *
FROM author;

SELECT  b.book_id 책번호,
        b.title 책이름,
        b.pubs 출판사,
        b.pub_date 출판일,
        a.author_id 작가번호,
        a.author_name 작가이름,
        a.author_desc 설명
FROM book b,author a
WHERE b.author_id=a.author_id;
--강풀 정보
UPDATE author
SET author_desc = '서울특별시'
WHERE author_id = 5;
--select
SELECT  b.book_id 책번호,
        b.title 책이름,
        b.pubs 출판사,
        b.pub_date 출판일,
        a.author_id 작가번호,
        a.author_name 작가이름,
        a.author_desc 설명
FROM book b,author a
WHERE b.author_id=a.author_id;
--기안84 삭제
DELETE FROM author
WHERE author_id = 4;
--ORA-02292: integrity constraint 오류가 남

















































































































