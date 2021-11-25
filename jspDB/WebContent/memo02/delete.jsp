<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
String no = request.getParameter("no");
if (no == null)
{
	out.println("메모 번호가 없습니다.");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "delete from memo where no=" + no;
dbms.RunSQL(sql);

dbms.DBClose();
%>

메모가 삭제되었습니다.<br>
<a href="index.jsp">목록으로 이동</a>