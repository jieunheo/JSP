<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%
	String userid = (String)request.getParameter("userID");
	String userpw = (String)request.getParameter("userPW");
	String username = (String)request.getParameter("userName");
	String userage = (String)request.getParameter("userAge");
	String userlevel = (String)request.getParameter("userLevel");
	String result = "";
	
	if( userid == null || userpw == null|| username == null|| userage == null )
	{
		result = "잘못된 접근입니다.";
	} else
	{
		try
		{
			int age = Integer.parseInt(userage);
			
			loginVO vo = new loginVO(userid, username, age, userlevel);
			vo.PrintInfo();
			session.setAttribute("login", vo);
			
			response.sendRedirect("index.jsp");
		} catch (Exception e)
		{
			result = "작성이 되었습니다.";
		}
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