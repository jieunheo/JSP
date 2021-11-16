<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%
	String userid = (String)request.getParameter("userid");
	String userpw = (String)request.getParameter("userpw");
	String result = "";
	
	if( userid == null || userpw == null )
	{
		result = "잘못된 접근입니다.";
	}
	
	if( userid.equals("test") && userpw.equals("1234") )
	{
		loginVO vo = new loginVO("test","jieun",26,"A");
		vo.PrintInfo();
		session.setAttribute("login", vo);
		
		response.sendRedirect("index.jsp");
	} else
	{
		result = "아이디 또는 비밀번호가 일치하지 않습니다.";
	}
%>

<div class="main">
	<div class="loginok">
		<h3>로그인 오류</h3>
		<p><%= result %></p>
		<a class="btn" href="login.jsp">로그인</a>
	</div>
</div>

<%@ include file="footer.jsp" %>