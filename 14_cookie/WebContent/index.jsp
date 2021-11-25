<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 연습</title>
	</head>
	<body>
		<%
			Cookie cookie1 = new Cookie("name", "hong-gil-dong");
			cookie1.setMaxAge(3600);
			response.addCookie(cookie1);
			
			Cookie cookie2 = new Cookie("age", "16");
			cookie1.setMaxAge(-1);
			response.addCookie(cookie2);
		%>
		쿠키를 전송했습니다<br>
		<a href="view.jsp">쿠키 보기</a>
	</body>
</html>