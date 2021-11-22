<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모등록</title>
	</head>
	<body>
		<form name="write" method="post" action="writeok.jsp">
			<table border="1" align="center" style="width:600px">
				<tr>
					<td style="width:100px;">제목</td>
					<td style="text-align:left"><input type="text" name="title" value="" required style="width:96%"></td>
				</tr>
				<tr>
					<td style="width:100px;">내용</td>
					<td style="text-align:left"><textarea name="note" rows="5" required style="width:96%"></textarea></tr>			
				<tr>
					<td colspan="2" style="text-align:center">
					<input type="submit" value="저장하기">
					&nbsp; | &nbsp; 
					<a href="index.jsp">취소</a>		
					</td>
				</tr>			
			</table>
		</form>
	</body>
</html>