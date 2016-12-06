DROP TABLE member;
CREATE TABLE member (
  memberno NUMBER PRIMARY KEY,
  id VARCHAR2(20) NOT NULL UNIQUE,
  pass VARCHAR2(20) NOT NULL,
  name VARCHAR2(50) NOT NULL,
  sex NUMBER(1) NOT NULL,
  birthday VARCHAR2(10) NOT NULL,
  email VARCHAR2(50) NOT NULL UNIQUE,
  mobno VARCHAR2(15) NOT NULL UNIQUE,
  status VARCHAR2(5) NOT NULL,
  category NUMBER NOT NULL,
<<<<<<< HEAD
  regdate date NOT NULL,
=======
  regdate  date NOT NULL,
>>>>>>> branch 'master' of https://github.com/conyca/final.git
  adjdate date,
  datano NUMBER
  -- datano foreign key 
);

CREATE SEQUENCE mem_seq
  START WITH 1
  INCREMENT BY 1;
