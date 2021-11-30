<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	window.onload = function()
	{
		document.login.uid.focus();
	}
	
	function FormCheck()
	{
		if(document.login.uid.value == "")
		{
			alert("아이디를 입력하세요");
			document.login.uid.focus();
			return false;
		}
		
		if(document.login.upw.value == "")
		{
			alert("비밀번호를 입력하세요");
			document.login.upw.focus();
			return false;
		}
		return true;
	}
	
	function handleOnInput(e)  {
	  e.value = e.value.replace(/[^A-Za-z]/ig, '');
	}
</script>
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 로그인</span>
		</td>
	</tr>
</table>		
<form name="login" method="post" action="loginok.jsp" onsubmit="return FormCheck();">
	<table border="1" style="width:100%;">
		<tr>
			<td style="text-align:center;width:120px;">아이디 (*) </td>
			<td><input type="text" name="uid" value="ezen" oninput="handleOnInput(this);"></td>
		</tr>
		<tr>
			<td style="text-align:center;width:120px;">비밀번호 (*) </td>
			<td><input type="password" name="upw" value="ezen"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input class="btn" type="submit" value="로그인하기">
			</td>
		</tr>					
	</table>
</form>			
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>