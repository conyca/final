DROP TABLE member;
CREATE TABLE member (
  memberno NUMBER PRIMARY KEY,
  id VARCHAR2(15) NOT NULL,
  pass VARCHAR2(20) NOT NULL,
  name VARCHAR2(10) NOT NULL,
  sex NUMBER(1) NOT NULL,
  birthday VARCHAR2(10) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  mobno VARCHAR2(15) NOT NULL,
  status VARCHAR2(5) NOT NULL,
  category NUMBER NOT NULL,
  regdate VARCHAR2(10) NOT NULL,
  adjdate VARCHAR2(10),
  datano NUMBER
  -- datano foreign key 
);
