<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<%
	String userid 	= (String)session.getAttribute("userid");
	String username = (String)session.getAttribute("username");
%>

<div class="main">
	<div class="login">
		<h3>로그인</h3>
		<form name="login" method="post" action="loginok.jsp">
			<p><span>아이디</span> <input type="text" name="userid" required></p>
			<p><span>비밀번호</span> <input type="password" name="userpw" required></p>
			<input class="btn" type="submit" value="로그인">
			<a class="btn" href="signup.jsp">회원가입</a>
		</form>
	</div>
</div>

<%@ include file="footer.jsp" %>