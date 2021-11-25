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

	x = x.replace(",", "");
	y = y.replace(",", "");
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
		<form name="a" method="get" action="cal.jsp">
			<input required type="text" size="5" name="x" value="<%= x %>">
			<select name="op">
			<%
				if (op.equals("+"))
				{
					%><option value="+" selected>+</option><%
				} else
				{
					%><option value="+">+</option><%
				}
				if (op.equals("-"))
				{
					%><option value="-" selected>-</option><%
				} else
				{
					%><option value="-">-</option><%
				}
				if (op.equals("*"))
				{
					%><option value="*" selected>*</option><%
				} else
				{
					%><option value="*">*</option><%
				}
				if (op.equals("/"))
				{
					%><option value="/" selected>/</option><%
				} else
				{
					%><option value="/">/</option><%
				}
			%>
			</select>
			<input required type="text" size="5" name="y" value="<%= y %>">
			<input type="submit" value="=">
			<input type="text" size="5" name="z" disabled value="<%= z %>">
		</form>
	</body>
</html>