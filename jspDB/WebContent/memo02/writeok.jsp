<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//외부 값 가져오기
String title = request.getParameter("title");
String note  = request.getParameter("note");
if(title == null || note == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "";
//title = String.format("%03d 번째 게시글입니다.", i);
sql += "insert into memo ";
sql += "(title,note) ";
sql += "values ('" + dbms._R(title) + "','" + dbms._R(note) + "');";
dbms.RunSQL(sql);

String no = dbms.GetLastNo();

dbms.DBClose();

//페이지 바로 이동
response.sendRedirect("view.jsp?no=" + no);
%>