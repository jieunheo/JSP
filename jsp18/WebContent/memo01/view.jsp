<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
//JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

//db연결할 변수
String host = "jdbc:mysql://localhost:3306/memodb";
host += "?useUnicode=ture&characterEncoding=utf-8&serverTimezone=UTC"; //db주소
String userid = "root"; //id
String userpw = "ezen"; //pw

//db연결
Connection conn = null;
conn = DriverManager.getConnection(host, userid, userpw);

String title = "";
String note = "";
String no = request.getParameter("no");
if (no == null)
{
	out.println("메모 번호가 없습니다.");
	
	//닫기
	conn.close();
	return;
}

//데이터 추가
Statement stmt = conn.createStatement();

String sql = "select no,title,note from memo where no=" + no;
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true)
{
	title = result.getString("title");
	note = result.getString("note").replace("\n", "<br>");
}
stmt.close();
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
<%
conn.close();
%>