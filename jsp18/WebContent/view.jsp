<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String title = "";
String note  = "";
String no = request.getParameter("no");
if (no == null)
{
	out.println("번호가 없습니다.");
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

//데이터 추가
Statement stmt = conn.createStatement(); //작업 처리용 클래스 할당

stmt = conn.createStatement();
String sql = "select no,title,note from memo where no=" + no;

ResultSet result = stmt.executeQuery(sql);
if (result.next() == true)
{
	title = result.getString("title");
	note = result.getString("note");
}

//닫기(*필수)
stmt.close(); //닫기
conn.close(); //db닫기
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모 보기</title>
		<link href="./css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrap">
			<h3>메모 보기</h3>
			<div class="cont">
				<p><span>제목:</span><%= title %></p>
				<p><span>내용</span></p>
				<div class="note"><%= note %></div>
				<a class="btn" href="write.jsp">뒤로가기</a>
			</div>
		</div>
	</body>
</html>