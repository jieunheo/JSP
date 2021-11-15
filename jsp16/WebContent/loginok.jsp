<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>12번가 홈쇼핑</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap align">
		<%
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			if( userid == null || userpw == null )
			{
				out.print("로그인 오류");
				return;
			}
		
			if( userid.equals("test") && userpw.equals("test") )
			{
				session.setAttribute("userid", userid);
				session.setAttribute("username", "홍선생");
				response.sendRedirect("index.jsp");
			} else
			{
				out.print("<p>아이디 또는 비밀번호가 틀립니다.<p>");
				%><a class="btn" href="login.jsp">로그인 하기</a><%
			}
			%>
		</div>
	</body>
</html>