<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 연습</title>
	</head>
	<body>
		<form name="a" method="get" action="data.jsp">
			<input type="text" size="5" name="x">
			<select name="op">
				<option value="+">+</option>
				<option value="-">-</option>
				<option value="*">*</option>
				<option value="/">/</option>
			</select>
			<input type="text" size="5" name="y">
			<input type="submit">
		</form>
	</body>
</html>