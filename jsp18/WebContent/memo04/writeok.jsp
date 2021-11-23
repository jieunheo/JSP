<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>
    
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title").replace("'", "''");
String note  = request.getParameter("note").replace("'", "''").replace("\n", "<br>");
String no    = "";
if(title == null || note == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

//데이터 추가
String sql = "";
sql += "insert into memo ";
sql += "(title,note) ";
sql += "values ('" + title + "','" + note + "');";
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