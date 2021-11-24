<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
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
			<td><input type="text" required name="id" style="width:95%"></td>
		</tr>
		<tr>
			<td>비밀번호 (*)</td>
			<td><input type="password" required name="pw"  style="width:95%"></td>
		</tr>
		<tr>
			<td>비밀번호 확인 (*)</td>
			<td><input type="password" required name="pwcheck" style="width:95%"></td>
		</tr>			
		<tr>
			<td>이름 (*)</td>
			<td><input type="text" required name="name"  style="width:95%"></td>
		</tr>		
		<tr>
			<td>성별 (*)</td>
			<td>
				<input type="radio" name="gender" checked>남자
				<input type="radio" name="gender">여자
			</td>
		</tr>		
		<tr>
			<td>취미 (*)</td>
			<td>
				<select name="habby" >
					<option value="1" selected>낚시</option>
					<option value="2">여행</option>
					<option value="3">게임</option>
				</select>
			</td>
		</tr>		
		<tr>
			<td>관심분야</td>
			<td>
				<input type="checkbox" value="1" name="interest"  checked>책
				<input type="checkbox" value="2" name="interest">영화					
			</td>
		</tr>		
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="가입완료">
				<input type="button" value="취소">
			</td>							
		</tr>																															
	</table>
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>