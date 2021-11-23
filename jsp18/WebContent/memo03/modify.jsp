<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<%
String no    = request.getParameter("no");
String title = "";
String note  = "";
if (no == null)
{
	out.println("잘못된 접근입니다.");
	return;
}

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

//작업 클래스 할당
Statement stmt = conn.createStatement();
String sql = "";

//select
sql += "select no,title,note from memo where no=" + no;
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true)
{
	title = result.getString("title");
	note = result.getString("note");
}
stmt.close();

conn.close();
%>

<%@ include file="header.jsp" %>
<form class="sub" name="write" method="post" action="modifyok.jsp">
	<div class="modify">
		<input type="hidden" name="no" value="<%= no %>">
		<div>
			<p>
				<span>제목</span>
				<input type="text" name="title" value="<%= title %>" required>
			</p>
			<div>
				<span>내용</span>
				<textarea name="note" required><%= note %></textarea>
			</div>			
			<div class="btns">
				<input class="btn" type="submit" value="저장하기">&nbsp;
				<a class="btn" href="view.jsp?no=<%= no %>">취소</a>
			</div>			
		</div>
	</div>
</form>
<%@ include file="footer.jsp" %>