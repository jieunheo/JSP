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
	note = dbms.GetValue("note").replace("<br>", "\n");
}
dbms.CloseQuery();

dbms.DBClose();
%>
<form class="sub" name="write" method="post" action="modifyok.jsp">
	<div class="modify">
		<input type="hidden" name="no" value="<%= no %>">
		<div>
			<p>
				<span>제목</span>
				<input type="text" name="title" value="<%= title %>" required>
			</p>
			<div>
				<span>내용</span>
				<textarea name="note" required><%= note %></textarea>
			</div>			
			<div class="btns">
				<input class="btn" type="submit" value="저장하기">&nbsp;
				<a class="btn" href="view.jsp?no=<%= no %>">취소</a>
			</div>			
		</div>
	</div>
</form>
<%@ include file="footer.jsp" %>