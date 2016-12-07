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
  regdate date NOT NULL,
  regdate  date NOT NULL,
  adjdate date,
  datano NUMBER
  -- datano foreign key 
);

CREATE SEQUENCE mem_seq
  START WITH 1
  INCREMENT BY 1;

DROP TABLE data;
CREATE TABLE data(
  dataNum NUMBER PRIMARY KEY,
  name VARCHAR2(15) NOT NULL,
  category NUMBER NOT NULL,
  address VARCHAR2(200) NOT NULL,
  class VARCHAR2(20) NOT NULL,
  grade VARCHAR2(20),
  mobno VARCHAR2(15),
  school VARCHAR2(50)
);