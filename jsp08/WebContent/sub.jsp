<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
이것은 서브 페이지 입니다.<br>
<%
	for (int i=1; i<=10; i++)
	{
		out.print(i + "<br>");
	}

	out.print(name);
%>