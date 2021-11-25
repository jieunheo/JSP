<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
DBManager dbms = new DBManager();
dbms.DBOpen();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모목록</title>
		<link rel="stylesheet" href="./css/style.css">
	</head>
	<body>
		<div class="wrap">
			<header>
				<h1><a href="index.jsp">HOME</a></h1>
			</header>