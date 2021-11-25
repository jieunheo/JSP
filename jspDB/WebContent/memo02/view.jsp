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
	note = dbms.GetValue("note").replace("\n", "<br>");
}
dbms.CloseQuery();

dbms.DBClose();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모조회</title>
	</head>
	<body>
		<style>
			td
			{
				text-align:center;
			}
		</style>
		<table border="1" align="center" style="width:600px">
			<tr>
				<td style="width:100px;">제목</td>
				<td style="text-align:left"><%= title %></td>
			</tr>
			<tr>
				<td style="width:100px;">내용</td>
				<td style="text-align:left"><%= note %></td>
			</tr>			
			<tr>
				<td colspan="2" style="text-align:center">
				<a href="index.jsp">목록</a>
				&nbsp; | &nbsp; 
				<a href="modify.jsp?no=<%= no %>">수정</a>
				&nbsp; | &nbsp;
				<a href="delete.jsp?no=<%= no %>">삭제</a>				
				</td>
			</tr>			
		</table>
	</body>
</html>