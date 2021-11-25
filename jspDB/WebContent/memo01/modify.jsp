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
	note = result.getString("note");
}
stmt.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모등록</title>
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
					<a href="view.jsp?no=<%= no %>">취소</a>		
					</td>
				</tr>			
			</table>
		</form>
	</body>
</html>
<%
conn.close();
%>