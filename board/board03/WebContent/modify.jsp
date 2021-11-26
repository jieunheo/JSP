<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<%
String bno    = request.getParameter("bno");  //게시물 번호
String pageno = request.getParameter("page"); //페이지번호

//사용할 변수
String uno		 = ""; //회원번호
String btitle  = ""; //제목
String bnote 	 = "";	//내용
String bkind 	 = "";	//구분
String uname 	 = "";	//작성자

Statement stmt = conn.createStatement();
String sql = "";

//잘못된 접근 막기
/*
sql = "select uno,bno from board where bno = " + bno + " and uno = " + o_uno + ";";
ResultSet result = stmt.executeQuery(sql);
if (o_uno == null || bno == null || result.next() == false)
{ //번호가 비어있거나 존재하지 않는 번호이거나 검색한 값이 없을 경우
	%>
	<script>
		alert("비정상적인 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}
*/

sql = "";
sql += "select u.uname,u.uno,btitle,bkind,bnote ";
sql += "from board as b ";
sql += "inner join user as u ";
sql += "on b.uno = u.uno ";
sql += "where bno=" + bno + " and b.uno = " + o_uno + ";";
ResultSet result = stmt.executeQuery(sql);
if (o_uno == null || bno == null || result.next() == false)
{
	%>
	<script>
		alert("잘못된 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}
uno    = result.getString("uno");
btitle = result.getString("btitle");
bnote  = result.getString("bnote");
bkind  = result.getString("bkind");
uname  = result.getString("uname");

%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
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
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 글수정</span>
		</td>
	</tr>
</table>		
<form name="modify" method="post" action="modifyok.jsp" onsubmit="return FormCheck();">
	<input type="hidden" name="page" value="<%= pageno %>">
	<input type="hidden" name="bno" value="<%= bno %>">
	<table border="0" style="width:100%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
			<td><input type="text" name="btitle" style="width:95%" value="<%= btitle %>"></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">구분</td>
			<td>
				<input type="radio" name="bkind" value="J" <% if (bkind.equals("J")) {%> checked<%;} %>>자바 학습 게시판
				<input type="radio" name="bkind" value="H" <% if (bkind.equals("H")) {%> checked<%;} %>>HTML 학습 게시판
			</td>
		</tr>						
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">내용</td>
			<td>
				<textarea name="bnote" style="width:95%; height:200px;"><%= bnote %></textarea>
			</td>
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
				<input type="submit" value="글수정 완료">
				<a href="view.jsp?kind=<%= bkind %>&page=<%= pageno %>&bno=<%= bno %>">글수정 취소</a>
			</td>
		</tr>
	</table>					
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>