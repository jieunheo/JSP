<%@page import="com.sun.org.apache.bcel.internal.generic.DMUL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="./config/dbopen.jsp"%>
<%
String  uid   = request.getParameter("id");
boolean isdup = false;

//ID 중복 체크
String sql = "";
sql += "select uid from user where uid = '" + uid + "';";
dbms.OpenQuery(sql);

if(dbms.GetNext() == true)
{
	//ID가 중복됨
	isdup = true;	
}else
{
	isdup = false;
}

dbms.CloseQuery();
%>
<%@ include file="./config/dbclose.jsp"%>
<!DOCTYPE html>
<html>
	<head>	
		<meta charset="UTF-8"/>
		<title>아이디 중복 검사</title>
		<link rel="stylesheet" href="./css/board.css"/>
	</head>
	<body class="check">
		<div class="wrap">
			<%
			if(isdup == true)
			{
				%>
				<p>"<%= uid %>"는 <span>사용 할 수 없는</span> ID입니다.</p>
				<input class="btn" type="button" value="닫기" onclick="SetIDCheckDone(2);">
				<%			
			}else
			{
				%>
				<p>"<%= uid %>"는 사용 할 수 있는 ID입니다.</p>
				<input class="btn" type="button" value="ID사용하기" onclick="SetIDCheckDone(1);">
				<%
			}
			%>
		</div>
		
		<script>
			function SetIDCheckDone(value)
			{
				opener.IsDupCheck = value;
				if(value == 2) opener.join.uid.focus();
				window.close();
			}
		</script>
	</body>
</html>