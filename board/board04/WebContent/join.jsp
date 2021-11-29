<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	//아이디 중복 여부 플래그
	//0-ID중복체크안함,1-ID중복안됨,2-ID중복됨
	var IsDupCheck = 0;

	//페이지 로딩 되자마자
	window.onload = function()
	{
		//uid에 포커스 이동 
		document.join.uid.focus();
	}
	
	//전송 클릭 -> 가입 폼 검사
	function FormCheck()
	{
		//비어있으면 커서 이동
		if(document.join.uid.value == "")
		{
			alert("아이디를 입력해주세요.");
			document.join.uid.focus();
			return false;
		}

		if(document.join.upw.value == "")
		{
			alert("비밀번호를 입력해주세요.");
			document.join.upw.focus();
			return false;
		}

		if(document.join.uname.value == "")
		{
			alert("이름을 입력해주세요.");
			document.join.uname.focus();
			return false;
		}
		
		//비밀번호 확인이 다르면
		if(document.join.upw.value != document.join.upwcheck.value)
		{
			alert("비밀번호가 일치하지 않습니다.");
			document.join.upw.focus();
			return false;
		}
		
		if(IsDupCheck == 0)
		{
			alert("아이디 중복 체크를 해주세요.");
			return false;
		}
		if(IsDupCheck == 2)
		{
			alert("중복된 아이디입니다.");
			return false;
		}
		
		//마지막 알림
		if(confirm("회원가입을 진행하시겠습니까?") != 1)
		{
			return false;
		}
		return true;
	}
	
	//메인 화면으로 이동
	function GoIndex()
	{
		if(confirm("회원가입을 취소하시겠습니까?") != 1)
		{
			return false;
		}
		document.location = "index.jsp";
	}
	
	//아이디 중복 검사
	function CheckIDDup()
	{
		/*
		if(document.join.uid.value == "imsi")
		{
			IsDupCheck = 2;
		} else
		{
			IsDupCheck = 1;
		}
		*/
		var userID = document.join.uid.value;
		if(userID == "")
		{
			alert("아이디를 입력해주세요.");
			document.join.uid.focus();
			return;
		}
		window.open("idcheck.jsp?id=" + userID,"_idcheck","width=400,height=400,top=200,left=600");
		
	}
</script>
<form name="join" method="post" action="joinok.jsp" onsubmit="return FormCheck();">
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
			<td>
				<input type="text" name="uid" size="20">
				<input class="s_btn" type="button" value="아이디 중복체크" onclick="CheckIDDup();">
			</td>
		</tr>
		<tr>
			<td>비밀번호 (*)</td>
			<td><input type="password" name="upw" size="20"></td>
		</tr>
		<tr>
			<td>비밀번호 확인 (*)</td>
			<td><input type="password" name="upwcheck" size="20"></td>
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
				<input type="checkbox" value="001:책" name="fkind" checked>책 
				<input type="checkbox" value="002:영화" name="fkind">영화 
				<input type="checkbox" value="003:유튜브" name="fkind">유튜브 
			</td>
		</tr>		
		<tr>
			<td colspan="2" style="text-align:center;">
				<input class="btn" type="submit" value="가입완료">
				<input class="btn" type="button" value="취소" onclick="GoIndex();">
			</td>							
		</tr>																															
	</table>
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>