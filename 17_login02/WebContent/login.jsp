<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>12번가 홈쇼핑 - 로그인</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<form class="align" name="login" method="post" action="loginok.jsp">
				<p><span>아이디</span> <input type="text" name="userid" required><br></p>
				<p><span>비밀번호</span> <input type="password" name="userpw" required><br></p>
				<input class="btn" type="submit" value="로그인">
			</form>
		</div>
	</body>
</html>