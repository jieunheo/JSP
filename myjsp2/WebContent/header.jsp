<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.loginVO" %>
<%
loginVO login = (loginVO)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp 연습 페이지</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<header>
				<a href="index.jsp"><h1>Hello</h1></a>
				<div class="nav">
					<ul>
					<% if(login == null)
						{
						%>
						<li><a href="login.jsp">login</a></li>
						<li><a href="signup.jsp">sign up</a></li>
						<%
					} else
					{
						%>
						<li>hello, <%= login.getUserName() %>! (<%= login.getLevelName() %>)</li>
						<li>[<a href="info.jsp">Info</a>/<a href="logout.jsp">logout</a>]</li>
						<%
					}
					%>
					</ul>
				</div>
			</header>