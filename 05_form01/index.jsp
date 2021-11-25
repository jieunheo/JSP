<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 페이지</title>
	</head>
	<body>
		<form name="index" method="get" action="data.jsp">
			<input type="text" name="won" value="1000">
			<input type="submit">
		</form>
		<br>
		<a href="data.jsp?won=999"></a>
	</body>
</html>