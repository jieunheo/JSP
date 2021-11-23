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
<div class="sub">
	<div class="view">
		<h3>글보기</h3>
		<div>
			<p class="title">
				<span>제목</span><%= title %>
			</p>
		</div>
		<div>
			<span>내용</span>
			<div class="note"><%= note %></div>
		</div>	
		<div class="btns">
			<a class="btn" href="index.jsp">목록</a>&nbsp;
			<a class="btn" href="modify.jsp?no=<%= no %>">수정</a>&nbsp;
			<a class="btn" href="delete.jsp?no=<%= no %>">삭제</a>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>