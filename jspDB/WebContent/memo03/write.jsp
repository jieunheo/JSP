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
%>

<%@ include file="header.jsp" %>
<form class="sub" name="write" method="post" action="writeok.jsp">
	<div class="write">
		<h3>글쓰기</h3>
		<div>
			<p>
				<span>제목</span>
				<input type="text" name="title" value="" required>
			</p>
		</div>
		<div>
			<span>내용</span>
			<textarea name="note" required></textarea>
		</div>			
		<div class="btns">
			<input class="btn" type="submit" value="저장하기">&nbsp;
			<a class="btn" href="index.jsp">취소</a>
		</div>			
	</div>
</form>
<%@ include file="footer.jsp" %>
<%
conn.close();
%>