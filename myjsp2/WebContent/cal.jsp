<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<%
	String username = (String)session.getAttribute("username");

	String x = request.getParameter("x");
	String y = request.getParameter("y");
	String op = request.getParameter("op");
	String result = "";
	
	if( x == null || y == null || op == null ) {
		result = "식을 입력해주세요.";
	
		if( op == null )
		{
			op = "+";
		}
	} else
	{
		try
		{
			Double dx = Double.parseDouble(x);
			Double dy = Double.parseDouble(y);
			Double dz = 0.0;
			
			switch (op)
			{
				case "+": dz = dx + dy; break;
				case "-": dz = dx - dy; break;
				case "*": dz = dx * dy; break;
				case "/": dz = dx / dy; break;
			}
			result += x + " " + op + " " + y;
			result += "= <span class='result'>" + dz + "</span>";
			
		} catch (Exception e)
		{
			result = "잘못된 입력입니다.";
		}
	}
%>

<div class="main">
	<div class="cal">
		<h3>계산기</h3>
		<p><%= result %></p>
		<form name="cal" method="get" action="cal.jsp">
			<input type="text" size="3" name="x" required>
			<select name="op">
				<option value="+"<% if(op.equals("+")) %> selected <%; %>>+</option>
				<option value="-"<% if(op.equals("-")) %> selected <%; %>>-</option>
				<option value="*"<% if(op.equals("*")) %> selected <%; %>>*</option>
				<option value="/"<% if(op.equals("/")) %> selected <%; %>>/</option>
			</select>
			<input type="text" size="3" name="y" required>
			<input type="submit" name="result" value="계산">						
		</form>
	</div>
</div>

<%@ include file="footer.jsp" %>