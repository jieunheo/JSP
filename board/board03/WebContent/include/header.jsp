<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
//JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

//db연결할 변수
String host = "jdbc:mysql://localhost:3306/boarddb";
host += "?useUnicode=ture&characterEncoding=utf-8&serverTimezone=UTC"; //db주소
String userid = "root"; //id
String userpw = "ezen"; //pw

//db연결
Connection conn = null;
conn = DriverManager.getConnection(host, userid, userpw);

//로그인 여부 검사
String o_uno = (String)session.getAttribute("uno");
String o_uid = (String)session.getAttribute("uid");
String o_uname = (String)session.getAttribute("uname");
%>
<!DOCTYPE html>
<html>
	<head>	
		<meta charset="UTF-8"/>
		<title>자바 학습 커뮤니티</title>
		<link rel="stylesheet" href="./css/board.css"/>
		<script type="text/javascript" src="./js/board.js" defer></script>
	</head>
	<body>
		<div class="wrap">
			<header class="clearfix">
				<h1><a href="index.jsp">자바학습 커뮤니티</a></h1>
				<div class="logWrap">
				<% 
				if (o_uno == null)
				{
					//로그인 안된 경우
					%>
					<a href="join.jsp">회원가입</a>
					&nbsp;&nbsp;
					<a href="login.jsp">로그인</a>
					&nbsp;
					<%
				} else
				{
					%>
					<%= o_uname %>님 안녕하세요 [ <a href="logout.jsp">로그아웃</a> ]
					<%
				}
				%>
				</div>
			</header>
			<div class="main clearfix">
					<div class="nav">
						<div class="submenu"><a href="index.jsp?kind=J">자바 학습 게시판</a></div>
						<div style="height:2px; background-color:#ffffff;"></div>
						<div class="submenu"><a href="index.jsp?kind=H">HTML학습 게시판</a></div>
					</div>
					<div class="contents">