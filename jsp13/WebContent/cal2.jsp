<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String x  = request.getParameter("x");
	String y  = request.getParameter("y");
	String op = request.getParameter("op");
	String z  = "";
	
	if(x == null) x = "";
	if(y == null) y = "";
	if(op == null) op = "+";

	try
	{
		double iz = 0;
		double ix = Double.parseDouble(x);
		double iy = Double.parseDouble(y);
		
		switch (op)
		{
			case "+": iz = ix + iy; break;
			case "-": iz = ix - iy; break;
			case "*": iz = ix * iy; break;
			case "/": iz = ix / iy; break;
		}
		z = Double.toString(iz);
	} catch (Exception e)
	{
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 연습</title>
		<style>
			body {
				text-align: center;
			}
			
			input:focus, select:focus {
				background-color: #eee;
			}
			
			input[type=text] {
				text-align: right;
			}
			
			select {
				appearance:none;
				padding: 2px 5px;
			}
		</style>
	</head>
	<body>
		<h2>계산기</h2>
		<form name="a" method="get" action="cal2.jsp">
			<input type="text" size="5" name="x" value="<%= x %>" required>
			<select name="op">
				<option value="+" <% if (op.equals("+")) %>selected<%; %>>+</option>
				<option value="-" <% if (op.equals("-")) %>selected<%; %>>-</option>
				<option value="*" <% if (op.equals("*")) %>selected<%; %>>*</option>
				<option value="/" <% if (op.equals("/")) %>selected<%; %>>/</option>
			</select>
			<input type="text" size="5" name="y" value="<%= y %>" required>
			<input type="submit" value="=">
			<input type="text" size="5" name="z" disabled value="<%= z %>">
		</form>
	</body>
</html>