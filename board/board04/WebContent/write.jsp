<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//kind 값 분석(J/H)
String kind = request.getParameter("kind");
if (kind == null)	kind = "J"; //값이 없으면 J로

//로그인 안했으면
if (login == null)
{
	%>
	<script>
		alert("잘못된 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}
%>
<script>
	//페이지 로드시
	window.onload = function()
	{
		document.write.btitle.focus();
	}
	
	//폼 체크
	function FormCheck()
	{
		if (document.write.btitle.value == "")
		{
			alert("제목을 입력하세요");
			document.write.btitle.focus();
			return false;
		}
		if (document.write.bnote.value == "")
		{
			alert("내용을 입력하세요");
			document.write.bnote.focus();
			return false;
		}
		
		if(confirm("저장하시겠습니까?") != 1) return false;
		return true;
	}
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 글쓰기</span>
		</td>
	</tr>
</table>		
<form name="write" method="post" action="writeok.jsp" onsubmit="return FormCheck();" enctype="multipart/form-data">
	<table style="width:100%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
			<td><input type="text" name="btitle" style="width:95%"></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">작성자</td>
			<td><%= login.getName() %></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">구분</td>
			<td>
				<input type="radio" name="bkind" value="J" id="J" <% if(kind.equals("J")) %>checked<%; %>><label for="J">자바 학습 게시판</label>
				<input type="radio" name="bkind" value="H" id="H" <% if(kind.equals("H")) %>checked<%; %>><label for="H">HTML 학습 게시판</label>
			</td>
		</tr>						
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">내용</td>
			<td><textarea name="bnote" style="width:95%; height:200px;"></textarea></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">첨부파일</td>
			<td><input name="attach" type="file" style="width:95%"></td>
		</tr>
	</table>	
	<div class="btn_wrap">
		<a class="btn" href="index.jsp?kind=<%= kind %>">뒤로가기</a>
		<input class="btn" type="submit" value="글쓰기 완료">
	</div>				
</form>			
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>