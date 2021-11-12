<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>include 예제</title>
		<style>
			table {
				height: 600px;
			}
			
			table tr:first-child {
				height: 60px;
			}
			
			table tr:nth-child(2) {
				vertical-align: top;
			}
			
			table tr:last-child {
				height: 60px;
			}
		</style>
	</head>
	<body>
		<table border="1" width="800px" align="center">
			<tr>
				<td colspan="2">
					<a href="index.jsp">홈으로 이동</a>
				</td>
			</tr>