<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>업로드 테스트</title>
	</head>
	<body>
		<form name="uploadFrm" method="post" action="uploadok.jsp"
				enctype="multipart/form-data">
			제목 : <input type="text" name="title"><br>
			<input type="file" name="attach">
			<input type="submit" value="전송">
		</form>	
	</body>
</html>