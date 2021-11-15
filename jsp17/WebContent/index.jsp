<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.loginVO" %>
<%
	//String userid 	= (String)session.getAttribute("userid");
	//String username = (String)session.getAttribute("username");
	loginVO login = (loginVO)session.getAttribute("login");
	
	if(login != null && login.getUserLevel().equals("A"))
	{
		response.sendRedirect("admin.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>12번가 홈쇼핑</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<header class="clearfix">
				<a href="index.jsp"><h1>12번가 홈쇼핑</h1></a>
				<div>
					<%
					if (login == null)
					{
						%>
						<a href="login.jsp">로그인</a>
						<%
					} else
					{
						%>
						<%= login.getUserName() %>님(<%= login.getLevelName() %>) [<a href="logout.jsp">로그아웃</a>]
						<%
					}
					%>
				</div>
			</header>
			<div class="main">
				메인 화면<br>
				메인 화면<br>
				메인 화면<br>
				메인 화면<br>
				메인 화면<br>
				메인 화면<br>
				메인 화면<br>
				메인 화면<br>
			</div>
		</div>
	</body>
</html>