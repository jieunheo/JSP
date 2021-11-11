<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String hello = "Hello, ezen!!";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 페이지</title>
	</head>
	<body>
		<% out.print(hello); %>
	</body>
</html>