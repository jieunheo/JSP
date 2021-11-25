<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//외부 값 가져오기
String title = request.getParameter("title");
String note  = request.getParameter("note");
String no = request.getParameter("no");
if(title == null || note == null || no == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "";
sql += "update memo ";
sql += "set title = '" + dbms._R(title) + "', "; 
sql += "note = '" + dbms._R(note) + "' ";
sql += "where no = " + no + ";";
dbms.RunSQL(sql);

dbms.DBClose();
%>
수정되었습니다.<br>
<a href="view.jsp?no=<%= no %>">수정된 글 보기</a>