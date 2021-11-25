<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session.invalidate();

//session.getAttribute("uno",null)
//session.getAttribute("unid",null);
//session.getAttribute("uname",null);

session.removeAttribute("uno");
session.removeAttribute("unid");
session.removeAttribute("uname");
%>
<script>
	alert("로그아웃 되었습니다.");
	document.location = "index.jsp";
</script>