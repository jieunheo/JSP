<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String note  = request.getParameter("note").replace("\n", "<br>");
String no    = "";
if(title == null || note == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

//데이터 추가
String sql = "";
sql += "insert into memo ";
sql += "(title,note) ";
sql += "values ('" + dbms._R(title) + "','" + dbms._R(note) + "');";
dbms.RunSQL(sql);

//마지막 글의 번호 가져오기
sql = "select last_insert_id() as no;";
dbms.OpenQuery(sql);
if (dbms.GetNext() == true)
{
	no = dbms.GetValue("no");
}
dbms.CloseQuery();

dbms.DBClose();

//페이지 바로 이동
response.sendRedirect("view.jsp?no=" + no);
%>