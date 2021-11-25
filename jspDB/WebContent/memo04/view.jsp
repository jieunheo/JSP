<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<%
String no    = request.getParameter("no");
String title = "";
String note  = "";
if (no == null)
{
	out.println("잘못된 접근입니다.");
	return;
}

String sql = "";

//select
sql += "select no,title,note from memo where no=" + no;
dbms.OpenQuery(sql);
if (dbms.GetNext() == true)
{
	title = dbms.GetValue("title");
	note = dbms.GetValue("note");
}
dbms.CloseQuery();

dbms.DBClose();
%>
<div class="sub">
	<div class="view">
		<h3>글보기</h3>
		<div>
			<p class="title">
				<span>제목</span><%= title %>
			</p>
		</div>
		<div>
			<span>내용</span>
			<div class="note"><%= note %></div>
		</div>	
		<div class="btns">
			<a class="btn" href="index.jsp">목록</a>&nbsp;
			<a class="btn" href="modify.jsp?no=<%= no %>">수정</a>&nbsp;
			<a class="btn" href="delete.jsp?no=<%= no %>">삭제</a>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>