<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 연습</title>
	</head>
	<body>
		<%
			//브라우저에 접속한 ip를 얻는다.
			String ip = request.getRemoteAddr();
			out.print(ip);
			out.print("<br>");
			
			//접속한 브라우저의 정보를 얻는다.
			String browser = request.getHeader("User-Agent");
			out.print(browser);
		%>
	</body>
</html>