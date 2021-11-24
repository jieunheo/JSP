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
	uno int primary key auto_increment comment 'ȸ����ȣ',
	uid VARCHAR(100) comment '���̵�',
	upw VARCHAR(100) comment '��й�ȣ',
	uname VARCHAR(50) comment '�̸�',
	ugender VARCHAR(2) comment '����',
	uhabby VARCHAR(4) comment '���',
	uretire VARCHAR(2) default 'N' comment 'Ż�𿩺�',
	ujoindate DATETIM default now() comment '��������'
);

create table fav
(
	uno int comment 'ȸ����ȣ',
	fkind VARCHAR(4) comment '�о��ڵ�',
	fname VARCHAR(50) comment '�о߸�',
	foreign key(uno) references user(uno)
);

create table board
(
	bno int primary key auto_increment comment '�Խù���ȣ',
	uno int comment 'ȸ����ȣ',
	btitle VARCHAR(250) comment '����',
	bkind VARCHAR(2) comment '����',
	bnote TEXT comment '����',
	bwdate DATETIME default now() comment '�ۼ���',
	bhit INT default 0 comment '��ȸ��',
	foreign key(uno) references user(uno)
);

create table attach
(
	ano int primary key auto_increment comment '÷�ι�ȣ',
	bno int comment '�Խù���ȣ',
	uno int comment 'ȸ����ȣ',
	pname VARCHAR(255) comment '�������ϸ�',
	fname VARCHAR(255) comment '�����ϸ�',
	foreign key(uno) references user(uno),
	foreign key(bno) references board(bno)
);