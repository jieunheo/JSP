<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>세션 연습</title>
	</head>
	<body>
		<%
			session.setAttribute("name", "홍길동");
			session.setAttribute("age", 20);
		%>
		세션이 설정 되었습니다<br>
		<a href="view.jsp">세션 보기</a>
	</body>
</html>