create database memodb;
use memodb;

/*------drop table------*/
drop table memo;
/*------create table------*/
create table memo
(
	no int primary key auto_increment comment '번호',
	title VARCHAR(200) comment '제목',
	note TEXT comment '이름'
);
show tables;
desc memo;
/*------insert------*/
insert into memo (title, note) 
values
('제목 1','내용 1'),
('제목 2','내용 2'),
('제목 3','내용 3');


/*------select------*/

/*------update------*/

/*------delete------*/
