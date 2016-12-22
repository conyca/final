DROP TABLE member;
CREATE TABLE member (
  id VARCHAR2(20) PRIMARY KEY,
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
  dataNum NUMBER,
  -- datano foreign key 
  CONSTRAINT mem_fk foreign key(dataNum)
  REFERENCES data(dataNum)
);

DROP TABLE data;
CREATE TABLE data(
  dataNum NUMBER PRIMARY KEY,
  name VARCHAR2(15) NOT NULL,
  category NUMBER NOT NULL,
  address VARCHAR2(200) NOT NULL,
  classNum number,
  grade VARCHAR2(20),
  mobno VARCHAR2(15),
  school VARCHAR2(50),
  parents number,
  CONSTRAINT data_fk foreign key(parents)
  REFERENCES data(dataNum)
);

CREATE SEQUENCE data_seq
  START WITH 1
  INCREMENT BY 1;

drop table classes;
CREATE TABLE classes(
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
  classNum number not null,
  adjDate date not null,
  CONSTRAINT timetable_fk1 foreign key(subject)
  REFERENCES subject(subjectNum),
  CONSTRAINT timetable_fk2 foreign key(classNum)
  REFERENCES classes(classNum)
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
  writer varchar2(20) not null,
  status number not null,
  CONSTRAINT schedule_fk foreign key(writer)
  REFERENCES member(id)
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
  writer varchar2(20) not null,
  subContent varchar2(3000) not null,
  CONSTRAINT advice_fk1 foreign key(target)
  REFERENCES data(dataNum),
  CONSTRAINT advice_fk2 foreign key(writer)
  REFERENCES member(id)
);

create sequence adv_seq
  start with 1
  increment by 1;



drop table board;
create table board(
  boardNum number primary key,
  kind number not null,
  writer varchar2(20) not null,
  category number not null,
  boardNo number  not null,
  title varchar2(2000) not null,
  content clob,
  depth number not null,
  hit number not null,
  groupId number not null,
  writeDate date not null,
  fileStatus number not null,
  boardStatus number not null,
  CONSTRAINT board_fk foreign key(writer)
  REFERENCES member(id)
);
create sequence board_seq
  start with 1
  increment by 1;
  
  
  --문의 게시판
drop table inquiry;
create table inquiry(
  inquNum number primary key,
  content varchar2(3000) not null,
  id varchar2(20) not null,
  regDate date not null,
  answer varchar2(3000),
  anAnswer varchar2(20),
  answerDate date,
  status number,
  CONSTRAINT inqu_fk1 foreign key(id)
  REFERENCES member(id),
  CONSTRAINT inqu_fk2 foreign key(anAnswer)
  REFERENCES member(id)
);

create sequence inqu_seq
  start with 1
  increment by 1;
  
drop table comments;
create table comments(
  commentNum number primary key,
  id varchar2(20) not null,
  content clob not null,
  commentDate date not null,
  boardNum number not null,
  CONSTRAINT comment_fk foreign key(boardNum)
  REFERENCES board(boardNum),
  CONSTRAINT comment_fk2 foreign key(id)
  REFERENCES member(id)
);

create sequence comm_seq
  start with 1
  increment by 1;

drop table filelist;
create table filelist(
  storedFname varchar2(1000) primary key,
  filelength number not null,
  boardNum number not null,
  CONSTRAINT file_fk foreign key(boardNum)
  REFERENCES board(boardNum)
  
);