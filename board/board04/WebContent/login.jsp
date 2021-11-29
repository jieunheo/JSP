<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 로그인</span>
		</td>
	</tr>
</table>		
<form name="login" method="post" action="loginok.jsp">
	<table border="1" style="width:100%;">
		<tr>
			<td style="text-align:center;width:120px;">아이디 (*) </td>
			<td><input type="text" name="userid"></td>
		</tr>
		<tr>
			<td style="text-align:center;width:120px;">비밀번호 (*) </td>
			<td><input type="password" name="userpw"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="로그인하기">
			</td>
		</tr>					
	</table>
</form>			
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>