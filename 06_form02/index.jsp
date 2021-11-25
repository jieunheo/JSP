<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String won = request.getParameter("won");
if (won == null)
{
	won = "999999999";	
}

String don = request.getParameter("don");
if (don == null)
{
	don = "111111111";	
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 페이지</title>
	</head>
	<body>
		<form name="index" method="get" action="index.jsp">
			<input type="text" name="won" value="<%= won %>">
			<input type="text" name="don" value="<%= don %>">
			<input type="submit">
		</form>
	</body>
</html>