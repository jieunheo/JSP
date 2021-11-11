<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	int z = 0;
	
	if (x == null || y == null)
	{
		z = 0;
	} else
	{
		try
		{
			int ix = Integer.parseInt(x);
			int iy = Integer.parseInt(y);
			
			z = ix + iy; 
		} catch (Exception e)
		{
			z = 0;
		}
	}
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>혼자하는 연습</title>
	</head>
	<body>
		<strong>이전 계산식은 <%= x %> + <%= y %> = <%= z %> 입니다.</strong>
		<form name="cal" method="get" action="index.jsp">
			<input type="text" name="x"> +
			<input type="text" name="y">
			<input type="submit" value="전달"> 
		</form>
	</body>
</html>