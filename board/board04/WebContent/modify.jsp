<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//로그인 없으면 접근 불가
if( login == null )
{
	%>
	<script>
		alert("수정 권한이 없습니다.");
		document.location = "index.jsp";
	</script>		
	<%
	return;
}

//값 받아오기
String bno        = request.getParameter("no");   //게시물번호
String bkind      = request.getParameter("kind"); //구분
String cur_page   = request.getParameter("page"); //페이지번호
String key        = request.getParameter("key");  //검색 키워드
if (key == null)	key = "";
//key = URLEncoder.encode(key);
key = key.replace("[", "%5B").replace("]", "%5D");

//사용할 변수
String uno		 = ""; //회원번호
String btitle  = ""; //제목
String bnote 	 = ""; //내용
String bwdate  = ""; //작성일
String bhit 	 = ""; //조회수
String uname 	 = ""; //작성자

//bno가 비어있거나 공백인 경우
if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "index.jsp?kind=<%= bkind %>";
	</script>
	<%
	return;
}

String sql = "";
//게시물 번호로 글 검색
sql = "";
sql += "select bno,uno,btitle,bkind,bnote,bwdate,bhit,";
sql += "(select uname from user where uno = board.uno) as uname ";
sql += "from board ";
sql += "where bno = '" + bno + "' ";
dbms.OpenQuery(sql);
if (dbms.GetNext() == false)
{
	%>
	<script>
		alert("게시물이 없습니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}

//select 값 받아오기
uno    = dbms.GetValue("uno");
btitle = dbms.GetValue("btitle");
bnote  = dbms.GetValue("bnote");
bkind  = dbms.GetValue("bkind");
bwdate = dbms.GetValue("bwdate");
bhit   = dbms.GetValue("bhit");
uname  = dbms.GetValue("uname");
dbms.CloseQuery();

//첨부파일 얻기
sql = "";
sql += "select ano,fname ";
sql += "from attach ";
sql += "where bno=" + bno;
dbms.OpenQuery(sql);
String ano   = ""; //첨부파일 번호
String fname = ""; //첨부파일 이름
if (dbms.GetNext() == true)
{
	ano   = dbms.GetValue("ano");
	fname = dbms.GetValue("fname");
}
dbms.CloseQuery();

//소유자 여부 검사
if(login.getNo().equals(uno) == false)
{ //소유자가 아니면
	%>
	<script>
		alert("해당 게시물에 대한 삭제 권한이 없습니다.");
		document.location = "index.jsp?kind=<%= bkind %>";
	</script>
	<%	
	return;
}
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	//페이지 로드시
	window.onload = function()
	{
		document.modify.btitle.focus();
	}
	
	//폼 체크
	function FormCheck()
	{
		if (document.modify.btitle.value == "")
		{
			alert("제목을 입력하세요");
			document.modify.btitle.focus();
			return false;
		}
		if (document.modify.bnote.value == "")
		{
			alert("내용을 입력하세요");
			document.modify.bnote.focus();
			return false;
		}
		
		if(confirm("저장하시겠습니까?") != 1) return false;
		return true;
	}
</script>
<table style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 글수정</span>
		</td>
	</tr>
</table>		
<form name="modify" method="post" action="modifyok.jsp" onsubmit="return FormCheck();" enctype="multipart/form-data">
	<input type="hidden" name="kind" value="<%= bkind %>">
	<input type="hidden" name="page" value="<%= cur_page %>">
	<input type="hidden" name="no" value="<%= bno %>">
	<input type="hidden" name="key" value="<%= key %>">
	<table style="width:100%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
			<td><input type="text" name="btitle" style="width:95%" value="<%= btitle %>"></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">구분</td>
			<td>
				<!-- disabled 속성을 넣으면 값 변경 불가 -->
				<input type="radio" name="bkind" value="J" id="J" <% if(bkind.equals("J")) %>checked<%; %>><label for="J">자바 학습 게시판</label>
				<input type="radio" name="bkind" value="H" id="H" <% if(bkind.equals("H")) %>checked<%; %>><label for="H">HTML 학습 게시판</label>
			</td>
		</tr>						
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">내용</td>
			<td>
				<textarea name="bnote" style="width:95%; height:200px;"><%= bnote %></textarea>
			</td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">새 첨부파일</td>
			<td><input name="attach" type="file" style="width:95%"></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">기존 첨부파일</td>
			<td>
			<%
			if(fname.equals("")) {
				%>첨부파일이 없습니다.<%
			} else
			{
				%><a class="down_btn" href="download.jsp?fno=<%= ano %>"><%= fname %></a><%
			}
			%>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
				<a class="btn" href="view.jsp?no=<%= bno %>&kind=<%= bkind %>&page=<%= cur_page %>&key=<%= key %>">글수정 취소</a>
				<input class="btn" type="submit" value="글수정 완료">
			</td>
		</tr>
	</table>					
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>