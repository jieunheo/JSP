<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
String title = "";
String note = "";
String no = request.getParameter("no");
if (no == null)
{
	out.println("메모 번호가 없습니다.");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "";
sql += "select no,title,note ";
sql += "from memo ";
sql += "where no=" + no;
dbms.OpenQuery(sql);

if (dbms.GetNext() == true)
{
	title = dbms.GetValue("title");
	note = dbms.GetValue("note");
}
dbms.CloseQuery();

dbms.DBClose();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모변경</title>
	</head>
	<body>
		<form name="write" method="post" action="modifyok.jsp">
			<input type="hidden" name="no" value="<%= no %>">
			<table border="1" align="center" style="width:600px">
				<tr>
					<td style="width:100px;">제목</td>
					<td style="text-align:left"><input type="text" name="title" value="<%= title %>" required style="width:96%"></td>
				</tr>
				<tr>
					<td style="width:100px;">내용</td>
					<td style="text-align:left"><textarea name="note" rows="5" required style="width:96%"><%= note %></textarea></tr>			
				<tr>
					<td colspan="2" style="text-align:center">
					<input type="submit" value="저장하기">
					&nbsp; | &nbsp; 
					<a href="view.jsp">취소</a>		
					</td>
				</tr>			
			</table>
		</form>
	</body>
</html>
