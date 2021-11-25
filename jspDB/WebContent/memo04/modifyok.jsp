<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title").replace("'", "''");
String note  = request.getParameter("note").replace("'", "''").replace("\n", "<br>");
String no    = request.getParameter("no");
if(title == null || note == null || no == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

//데이터 추가
String sql = "";
sql += "update memo ";
sql += "set title = '" + title + "', "; 
sql += "note = '" + note + "' ";
sql += "where no = " + no + ";";
dbms.RunSQL(sql);

//닫기(*필수)
dbms.DBClose();
%>
<div class="sub">
	<div class="ok">
		<p>수정되었습니다.</p>
		<a class="btn" href="view.jsp?no=<%= no %>">수정된 글 보기</a>
	</div>
</div>
<%@ include file="footer.jsp" %>