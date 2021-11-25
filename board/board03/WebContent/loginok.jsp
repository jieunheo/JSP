<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
if (uid == null || upw == null)
{
	out.println("잘못된 접근입니다.");
}

/*
System.out.println("uid: " + uid);
System.out.println("upw: " + upw);
*/
%>

<%@ include file="./include/header.jsp" %>
<%
Statement stmt = conn.createStatement();

//로그인 확인
String sql = "";
sql += "select uno,uname";
sql += "from user ";
sql += "where uid = '" + uid + "' ";
sql += "and upw = '" + upw + "' ";
sql += "and uretire = 'N';";
System.out.println("SQL: " + sql);
ResultSet result = stmt.executeQuery(sql);
if (result.next() == false)
{
	%>
	아이디 비밀번호가 일치하지 않습니다.<br>
	<a href="login.jsp">로그인 화면으로 돌아가기</a>
	<%
} else
{
	String uno = result.getString("uno");
	String uname = result.getString("uname");

	session.setAttribute("uno", uno);
	session.setAttribute("uid", uid);
	session.setAttribute("uname", uname);
	%>
	로그인이 완료되었습니다.<br>
	<a href="index.jsp">처음 화면으로 돌아가기</a>
	<%
}
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>