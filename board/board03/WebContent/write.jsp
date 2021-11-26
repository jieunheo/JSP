<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<%
//값 받아오기
String kind   = request.getParameter("kind"); //구분
String pageno = request.getParameter("page"); //페이지번호

if (o_uno == null)
{
	//response.sendRedirect("index.jsp");
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
window.onload = function()
{
	document.write.btitle.focus();
}

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
	<input type="hidden" name="page" value="<%= pageno %>">
	<table border="0" style="width:100%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
			<td><input type="text" name="btitle" style="width:95%"></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">작성자</td>
			<td><%= o_uname %></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">구분</td>
			<td>
				<input type="radio" name="bkind" value="J" checked>자바 학습 게시판
				<input type="radio" name="bkind" value="H">HTML 학습 게시판
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
		<tr>
			<td colspan="2" style="height:1px;background-color:#cccccc"></td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
				<input type="submit" value="글쓰기 완료">
			</td>
		</tr>
	</table>					
</form>			
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>