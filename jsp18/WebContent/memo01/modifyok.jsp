<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--java.sql.* 도 가능 --%>
<%@ page import="java.sql.*" %>

<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//외부 값 가져오기
String title = request.getParameter("title");
String note  = request.getParameter("note");
String no = request.getParameter("no");
if(title == null || note == null || no == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

//받아온 값 확인
//System.out.println(no);
//System.out.println(title);
//System.out.println(note);

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

String sql = "";
sql += "update memo ";
sql += "set title = '" + title + "', "; 
sql += "note = '" + note + "' ";
sql += "where no = " + no + ";";

//작업 처리용 클래스 할당
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
stmt.close();

conn.close();
%>
수정되었습니다.<br>
<a href="view.jsp?no=<%= no %>">수정된 글 보기</a>