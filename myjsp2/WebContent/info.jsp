<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<div class="main">
	<div class="info">
		<h3>회원 정보</h3>
		<%
		if (login == null)
		{
			%>
			<p>잘못된 접근입니다</p>
			<a class="btn" href="login.jsp">로그인 하기</a>
			<%
		} else
		{
			%>
			<form name="info" method="post" action="reinfo.jsp">
				<p><span>아이디</span> <%= login.getUserID() %></p>
				<p><span>비밀번호</span> <input type="password" name="userpw" required></p>
				<p><span>이름</span> <%= login.getUserName() %></p>
				<p><span>나이</span> <%= login.getUserAge() %></p>
				<p><span>권한</span> <%= login.getLevelName() %></p>
				<a class="btn" href="index.jsp">뒤로가기</a>
				<input class="btn" type="submit" value="수정하기">
			</form>
			<%
		} 
		%>
	</div>
</div>


<%@ include file="footer.jsp" %>