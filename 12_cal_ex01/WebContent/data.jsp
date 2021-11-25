<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- jsp 주석 --%> <!-- html 주석 -->
<%-- 
	자바 주석
	//한 줄 주석
	/* 여려 줄 주석 */ 
--%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제 연습</title>
	</head>
	<body>
	<%
		String x = request.getParameter("x");
		String y = request.getParameter("y");
		String op = request.getParameter("op");
		
		if (x == "" || y == "" || op == "")
		{
			out.print("빈 값이 있습니다.");
		} else
		{
			try
			{
				x = x.replace(",", "").replace(" ", "");
				y = y.replace(",", "").replace(" ", "");
				
				int ix = Integer.parseInt(x);
				int iy = Integer.parseInt(y);
				int z = 0;
				
				switch (op)
				{
					case "+": z = ix + iy; break;
					case "-": z = ix - iy; break;
					case "*": z = ix * iy; break;
					case "/": z = ix / iy; break;
				}
				//out.print(ix + " " + op + " " + iy + " = " + z );
				%>
				<%= ix %> <%= op %> <%= iy %> = <%= z %>
				<%
			} catch (Exception e) {
				out.print("숫자가 아닌 값이 있습니다.");
			}
		}
	%>
	</body>
</html>