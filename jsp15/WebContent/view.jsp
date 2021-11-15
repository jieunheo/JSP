<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세션 보기</title>
	</head>
	<body>
		<%
			try
			{
				String name = (String)session.getAttribute("name");
				int age = (int)session.getAttribute("age");
				out.print("name: " + name + "<br>");
				out.print("age: " + age + "<br>");
			} catch (Exception e)
			{	
				out.print("값 받아오는데 문제가 생겼습니다.");
			}
		
			session.invalidate();
		%>
	</body>
</html>