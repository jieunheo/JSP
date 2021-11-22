<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
DBManager dbms = new DBManager();
dbms.DBOpen();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모목록</title>
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
				<td colspan="2" style="text-align:right">
				<a href="write.jsp">글쓰기</a>
				</td>
			</tr>
			<tr>
				<td style="width:100px;">번호</td>
				<td>제목</td>
			</tr>
			<% 
			String sql = "";
			
			sql += "select no,title ";
			sql += "from memo ";
			sql += "order by no desc ";
			dbms.OpenQuery(sql);
			
			while (dbms.GetNext() == true)
			{
				String no = dbms.GetValue("no");
				String title = dbms.GetValue("title");
				%>
				<tr>
					<td><%= no %></td>
					<td style="text-align:left">
						<a href="view.jsp?no=<%= no %>"><%= title %></a>
					</td>
				</tr>
				<%
			}
			dbms.CloseQuery();
			%>
		</table>		
		<table border="1" align="center" style="width:600px">
			<tr>
				<td>전체게시물 :  10</td>
			</tr>
			<tr>
				<td>
				이전페이지 | 1 | 2 | 3 | 4 | 5 | 다음페이지
				</td>
			</tr>
		</table>
	</body>
</html>
<%
dbms.DBClose();
%>