<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>

<%

String no = request.getParameter("no");
if (no == null)
{
	out.println("메모 번호가 없습니다.");
	return;
}

String sql = "delete from memo where no=" + no;
dbms.RunSQL(sql);

dbms.DBClose();
%>
<div class="sub">
	<div class="ok">
		<p>메모가 삭제되었습니다.</p>
		<a class="btn" href="index.jsp">목록으로 이동</a>
	</div>
</div>
<%@ include file="footer.jsp" %>