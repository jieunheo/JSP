<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 보기</title>
	</head>
	<body>
		<%
			Cookie[] cookies = request.getCookies();
			if (cookies != null)
			{
				for (int i=0; i<cookies.length; i++)
				{
					out.print("name: " + cookies[i].getName() + "<br>");
					out.print("value: " + cookies[i].getValue() + "<br><hr>");
				}
			}
		%>
	</body>
</html>