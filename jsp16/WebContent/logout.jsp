<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.invalidate();
	session.removeAttribute("userid");
	session.removeAttribute("username");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>12번가 홈쇼핑</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap align">
			<p>로그아웃 완료</p>
			<a class="btn" href="index.jsp">홈으로</a>
		</div>
	</body>
</html>