<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 페이지</title>
	</head>
	<body>
		<table border="1" style="width: 100%">
			<tr>
				<th style="width: 100px">번호</th>
				<th>제목</th>
			</tr>
			<% for (int i=1; i<=10; i++)
			{
				%>
				<tr>
					<td><%= i %></td>
					<td>제목이랍니다 <%= i %></td>
				</tr>
				<%
			}
			%>
		</table>
	</body>
</html>