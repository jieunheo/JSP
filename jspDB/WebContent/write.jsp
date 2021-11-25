<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모 쓰기</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<h3>메모 쓰기</h3>
			<form class="write" name="write" method="post" action="writeok.jsp">
				<p><span>제목</span><input type="text" name="title" required></p>
				<p><span>내용</span></p>
				<textarea name="note" rows="5"></textarea><br>
				<input class="btn" type="submit" value="저장하기">
			</form>
		</div>
	</body>
</html>