<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 연습</title>
	</head>
	<body>
		이것은 예제 연습 1번 줄 입니다.<br>
		이것은 예제 연습 2번 줄 입니다.<br>
		이것은 예제 연습 3번 줄 입니다.<br>
		<%
			String name = "홍길동";
		%>
		<%@ include file="sub.jsp" %>
	</body>
</html>