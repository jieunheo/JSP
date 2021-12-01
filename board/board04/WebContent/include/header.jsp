<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../config/dbopen.jsp" %>
<%
//세션 값 받기
LoginVo login = (LoginVo)session.getAttribute("login");
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
			<header>
				<h1>
					<a href="index.jsp">자바학습 커뮤니티</a>
				</h1>
				<div class="login_wrap">
				<% 
				if (login == null)
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
					<%= login.getName() %>님 안녕하세요 [ <a href="logout.jsp">로그아웃</a> ]
					<%
				}
				%>
				</div>
			</header>
			<table width="900px" align="center">
				<tr>
					<td colspan="3" style="height:60px;">
						
					</td>
				</tr>
				<tr>
					<td style="width:200px" valign="top">
						<div class="submenu"><a href="index.jsp?kind=J">자바 학습 게시판</a></div>
						<div style="height:2px; background-color:#ffffff;"></div>
						<div class="submenu"><a href="index.jsp?kind=H">HTML학습 게시판</a></div>
					</td>
					<td style="width:5px"></td>
					<td>