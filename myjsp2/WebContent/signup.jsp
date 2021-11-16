<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<div class="main">
	<div class="signup">
		<h3>회원 가입</h3>
		<form name="signup" method="post" action="signupok.jsp">
			<p><span>아이디(*)</span> <input type="text" name="userID" required></p>
			<p><span>비밀번호(*)</span> <input type="password" name="userPW" required></p>
			<p><span>비밀번호 확인(*)</span> <input type="password" name="reUserPW" required></p>
			<p><span>이름(*)</span> <input type="text" name="userName" required></p>
			<p><span>나이(*)</span> <input type="text" name="userAge" required></p>
			<p><span>권한(*)</span> 
				<input type="radio" name="userLevel" value="A" checked> 관리자 
				<input type="radio" name="userLevel" value="U"> 사용자
			</p>
			<a class="btn" href="index.jsp">뒤로가기</a>
			<input class="btn" type="submit" value="회원가입">
		</form>
	</div>
</div>


<%@ include file="footer.jsp" %>