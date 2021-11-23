<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
DBManager dbms = new DBManager();
dbms.DBOpen();
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
dbms.DBClose();
%>