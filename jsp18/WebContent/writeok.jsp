<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--java.sql.* 도 가능 --%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>

<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//외부 값 가져오기
String title = request.getParameter("title");
String note  = request.getParameter("note");
String no = "";
if(title == null || note == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

out.print("데이터베이스에 등록 시작합니다.<br>");

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

//데이터 추가
Statement stmt = conn.createStatement(); //작업 처리용 클래스 할당

String sql = "";
sql += "insert into memo ";
sql += "(title,note) ";
sql += "values ('" + title + "','" + note + "');";
stmt.executeUpdate(sql);

//마지막 글의 번호 가져오기
sql = "select last_insert_id() as no;";
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true)
{
	no = result.getString("no");
}
result.close();

//닫기(*필수)
stmt.close(); //닫기
conn.close(); //db닫기

out.print("데이터베이스에 등록 완료하였습니다.");

//페이지 바로 이동
response.sendRedirect("view.jsp?no=" + no);
%>
<br>
<%--
<a href="view.jsp?no=<%= no %>">메모보기</a>
--%>