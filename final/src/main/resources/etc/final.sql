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
  adjdate date,
  datano NUMBER,
  -- datano foreign key 
  CONSTRAINT mem_fk foreign key(datano)
  REFERENCES data(dataNum)
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
  class VARCHAR2(20),
  grade VARCHAR2(20),
  mobno VARCHAR2(15),
  school VARCHAR2(50),
  children number,
  CONSTRAINT data_fk foreign key(children)
  REFERENCES data(dataNum)
);

CREATE SEQUENCE data_seq
  START WITH 1
  INCREMENT BY 1;

drop table class;
CREATE TABLE class(
  classNum number primary key,
  className varchar2(50) not null,
  classManager number,
  CONSTRAINT class_fk foreign key(classManager)
  REFERENCES data(dataNum)
  -- classManager : data teacher
);

create sequence class_seq
  start with 1
  increment by 1;

drop table subject;
create table subject(
 subjectNum number primary key,
 subjectName varchar2(50) not null,
 subjectTeacher number,
 CONSTRAINT subject_fk foreign key(subjectTeacher)
  REFERENCES data(dataNum)
);

create sequence subject_seq
  start with 1
  increment by 1;

drop table timetable;
create table timetable(
  timeNum number primary key,
  subject number not null,
  startTime varchar2(50) not null,
  endTime varchar2(50) not null,
  dow varchar2(50) not null,
  class number not null,
  adjDate date not null,
  CONSTRAINT timetable_fk1 foreign key(subject)
  REFERENCES subject(subjectNum),
  CONSTRAINT timetable_fk2 foreign key(class)
  REFERENCES class(classNum)
);

create sequence time_seq
  start with 1
  increment by 1;
  
drop table schedule;
create table schedule(
  scdNum number primary key,
  sdcIndex number not null,
  content varchar2(2000) not null,
  regDate date not null,
  opDate date not null,
  writer number not null,
  status number not null,
  CONSTRAINT schedule_fk foreign key(writer)
  REFERENCES member(memberno)
);
create sequence scd_seq
  start with 1
  increment by 1;

drop table advice;
create table advice(
  advNum number primary key,
  advDate date not null,
  content varchar2(3000) not null,
  regDate date not null,
  target number not null,
  writer number not null,
  subContent varchar2(3000) not null,
  CONSTRAINT advice_fk1 foreign key(target)
  REFERENCES data(dataNum),
  CONSTRAINT advice_fk2 foreign key(writer)
  REFERENCES member(memberno)
);

create sequence adv_seq
  start with 1
  increment by 1;




create table board(



);