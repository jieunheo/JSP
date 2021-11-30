<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./config/dbopen.jsp" %>
<%
//값 받아오기
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
//빈 값 확인
if (uid == null || upw == null)
{
	out.println("잘못된 접근입니다.");
}

/*
System.out.println("uid: " + uid);
System.out.println("upw: " + upw);
*/

//로그인 확인
String sql = "";
sql += "select uno,uname ";
sql += "from user ";
sql += "where uid = '" + uid + "' ";
sql += "and upw = md5('" + upw + "') ";
sql += "and uretire = 'N';"; //탈퇴여부
System.out.println("SQL: " + sql);
dbms.OpenQuery(sql);
if (dbms.GetNext() == false)
{
	%>
	<!--
	아이디 또는 비밀번호가 일치하지 않습니다.<br>
	<a href="login.jsp">로그인 화면으로 돌아가기</a>
	-->
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		document.location = "login.jsp";
	</script>
	<%
} else
{
	String uno = dbms.GetValue("uno");
	String uname = dbms.GetValue("uname");

	//로그인정보 한 번에 보내기
	LoginVo vo = new LoginVo(uno,uid,uname);
	session.setAttribute("login", vo);
	%>
	<script>
		alert("로그인이 되었습니다.");
		document.location = "index.jsp";
	</script>
	<%
}
%>
<%@ include file="./config/dbclose.jsp" %>