<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%
	String userpw = (String)request.getParameter("userpw");
%>
<div class="main">
	<div class="reinfo">
		<h3>회원 정보 수정</h3>
		<%
		if( userpw == null )
		{
		%>
			<p>잘못된 접근입니다.<p>
			<a class="btn" href="index.jsp">홈으로</a>
		<%
		} else
		{
		
			if( userpw.equals("1234") )
			{
				%>
				<form name="reinfo" method="post" action="signupok.jsp">
					<p><span>아이디</span> <input type="text" name="userID" value="<%= login.getUserID() %>" readonly></p>
					<p><span>비밀번호</span> <input type="password" name="userPW"></p>
					<p><span>비밀번호 확인</span> <input type="password" name="reUserPW"></p>
					<p><span>이름</span> <input type="text" name="userName" value="<%= login.getUserName() %>" required></p>
					<p><span>나이</span> <input type="text" name="userAge" value="<%= login.getUserAge() %>"required></p>
					<p><span>권한</span> 
						<input type="radio" name="userLevel" value="A" <% if (login.getUserLevel().equals("A")) %>checked<%; %>> 관리자 
						<input type="radio" name="userLevel" value="U" <% if (login.getUserLevel().equals("U")) %>checked<%; %>> 사용자
					</p>
					<a class="btn" href="index.jsp">뒤로가기</a>
					<input class="btn" type="submit" value="정보수정">
				</form>
				<%	
			} else
			{
				%>
				<p>비밀번호가 틀렸습니다.<p>
				<a class="btn" href="info.jsp">다시 입력</a>
				<%
			}
		}
		%>
	</div>
</div>

<%@ include file="footer.jsp" %>