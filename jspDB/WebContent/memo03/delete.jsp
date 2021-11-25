<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String no = request.getParameter("no");
if (no == null)
{
	out.println("메모 번호가 없습니다.");
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

String sql = "delete from memo where no=" + no;

Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
stmt.close();

conn.close();
%>


<%@ include file="header.jsp" %>
<div class="sub">
	<div class="ok">
		<p>메모가 삭제되었습니다.</p>
		<a class="btn" href="index.jsp">목록으로 이동</a>
	</div>
</div>
<%@ include file="footer.jsp" %>