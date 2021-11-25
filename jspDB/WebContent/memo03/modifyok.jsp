<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title").replace("'", "''");
String note  = request.getParameter("note").replace("'", "''").replace("\n", "<br>");
String no    = request.getParameter("no");
if(title == null || note == null || no == null)
{
	out.println("데이터 입력 오류입니다.");
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

//작업처리용 클래스 할당
Statement stmt = conn.createStatement();

//데이터 추가
String sql = "";
sql += "update memo ";
sql += "set title = '" + title + "', "; 
sql += "note = '" + note + "' ";
sql += "where no = " + no + ";";
stmt.executeUpdate(sql);

//닫기(*필수)
stmt.close(); //닫기
conn.close();
%>

<%@ include file="header.jsp" %>
<div class="sub">
	<div class="ok">
		<p>수정되었습니다.</p>
		<a class="btn" href="view.jsp?no=<%= no %>">수정된 글 보기</a>
	</div>
</div>
<%@ include file="footer.jsp" %>