<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제</title>
	</head>
	<body>
		<%
			Person p = new Person();
			String name = p.getName();
			out.print(name);
		%>
	</body>
</html>