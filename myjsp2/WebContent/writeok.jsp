<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%
	String title = (String)request.getParameter("title");
	String date = (String)request.getParameter("date");
	String contents = (String)request.getParameter("contents");
%>

<div class="main">
	<div class="writeok">
	<%
		if( title == null || date == null || date == contents )
		{
			%>
			<h3>글쓰기 오류</h3>
			<p>잘못된 접근입니다.</p>
			<%
		} else
		{
			%>
			<h3>글쓰기 완료</h3>
			<p>정상적으로 글이 올라갔습니다.</p>
			<%
		}
		%>
		<a class="btn" href="write.jsp">다시 쓰기</a>
		<a class="btn" href="notice.jsp">글목록</a>
	</div>
</div>

<%@ include file="footer.jsp" %>