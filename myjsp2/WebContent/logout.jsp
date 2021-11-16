<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("login");
%>
<%@ include file="header.jsp" %>

<div class="main">
	<div class="logout">
		<h3>로그아웃</h3>
		<p>로그아웃이 완료 되었습니다.</p>
		<a class="btn" href="index.jsp">홈으로</a>
	</div>
</div>

<%@ include file="footer.jsp" %>