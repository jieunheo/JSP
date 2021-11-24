/****** create database ******/
create database boarddb;
use boarddb;

/****** drop table ******/
drop table user;
drop table fav;
drop table board;
drop table attach;

/****** create table ******/
create table user
(
	uno int primary key auto_increment comment '회원번호',
	uid VARCHAR(100) comment '아이디',
	upw VARCHAR(100) comment '비밀번호',
	uname VARCHAR(50) comment '이름',
	ugender VARCHAR(2) comment '성별',
	uhabby VARCHAR(4) comment '취미',
	uretire VARCHAR(2) default 'N' comment '탈퇴여부',
	ujoindate DATETIM default now() comment '가입일자'
);

create table fav
(
	uno int comment '회원번호',
	fkind VARCHAR(4) comment '분야코드',
	fname VARCHAR(50) comment '분야명',
	foreign key(uno) references user(uno)
);

create table board
(
	bno int primary key auto_increment comment '게시물번호',
	uno int comment '회원번호',
	btitle VARCHAR(250) comment '제목',
	bkind VARCHAR(2) comment '구분',
	bnote TEXT comment '내용',
	bwdate DATETIME default now() comment '작성일',
	bhit INT default 0 comment '조회수',
	foreign key(uno) references user(uno)
);

create table attach
(
	ano int primary key auto_increment comment '첨부번호',
	bno int comment '게시물번호',
	uno int comment '회원번호',
	pname VARCHAR(255) comment '물리파일명',
	fname VARCHAR(255) comment '논리파일명',
	foreign key(uno) references user(uno),
	foreign key(bno) references board(bno)
);