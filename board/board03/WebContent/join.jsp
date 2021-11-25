<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	window.onload = function()
	{
		document.join.id.focus();
	}
	
	//취소 클릭 -> index 페이지로
	function GoIndex()
	{
		document.location = "index.jsp";
	}
</script>
<form name="join" method="post" action="joinok.jsp">
	<table border="0" style="width:100%;">
		<tr>
			<td style="height:40px">
				<span style="font-weight:bold; color:red;">※ 회원가입</span>
			</td>
		</tr>																		
	</table>
	<table border="1" style="width:100%;">
		<tr>
			<td style="width:130px;">아이디 (*)</td>
			<td><input type="text" name="uid" style="width:95%"></td>
		</tr>
		<tr>
			<td>비밀번호 (*)</td>
			<td><input type="password" name="upw"  style="width:95%"></td>
		</tr>
		<tr>
			<td>비밀번호 확인 (*)</td>
			<td><input type="password" name="upwcheck" style="width:95%"></td>
		</tr>			
		<tr>
			<td>이름 (*)</td>
			<td><input type="text" name="uname"  style="width:95%"></td>
		</tr>		
		<tr>
			<td>성별 (*)</td>
			<td>
				<input type="radio" name="ugender" value="M" checked>남자
				<input type="radio" name="ugender" value="F" >여자
			</td>
		</tr>		
		<tr>
			<td>취미 (*)</td>
			<td>
				<select name="uhobby" >
					<option value="001" selected>낚시</option>
					<option value="002">여행</option>
					<option value="003">게임</option>
				</select>
			</td>
		</tr>		
		<tr>
			<td>관심분야</td>
			<td>
				<input type="checkbox" value="001" name="fkind"  checked>책
				<input type="checkbox" value="002" name="fkind">영화					
				<input type="checkbox" value="003" name="fkind">유튜브					
			</td>
		</tr>		
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="가입완료">
				<input type="button" value="취소" onclick="GoIndex()">
			</td>							
		</tr>																															
	</table>
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>