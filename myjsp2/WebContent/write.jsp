<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%@ page import="ezen.getDate"%>
<%
getDate now = new getDate();
String today = now.getToday();
%>

<div class="main">
	<div class="write">
		<h3>글쓰기</h3>
		<form name="write" method="post" action="writeok.jsp">
			<p><span>제목(*)</span> <input type="text" name="title" required></p>
			<p><span>작성일</span> <%= today %></p>
			<p><span>작성자</span> <%= login.getUserName() %></p>
			<p><span>내용</span>
				<textarea name="contents"></textarea>
			</p>
			<a class="btn" href="index.jsp">뒤로가기</a>
			<input class="btn" type="submit" value="글쓰기">
		</form>
	</div>
</div>


<%@ include file="footer.jsp" %>