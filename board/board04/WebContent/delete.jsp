<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//로그인 없으면 접근 불가
if( login == null )
{
	%>
	<script>
		alert("삭제 권한이 없습니다.");
		document.location = "index.jsp";
	</script>		
	<%
	return;
}

//값 받아오기
String bno        = request.getParameter("no");   //게시물번호
String kind      = request.getParameter("kind"); //구분
String cur_page   = request.getParameter("page"); //페이지번호
String key        = request.getParameter("key");  //검색 키워드
if (key == null)	key = "";
//key = URLEncoder.encode(key);
key = key.replace("[", "%5B").replace("]", "%5D");

//bno가 비어있거나 공백인 경우
if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "index.jsp?kind=<%= kind %>";
	</script>
	<%
	return;
}

String sql = "";
//게시물의 소유주 정보
sql += "select uno ";
sql += "from board ";
sql += "where bno = '" + bno + "' ";
dbms.OpenQuery(sql);
if( dbms.GetNext() == false)
{ //소유주가 없으면
	dbms.CloseQuery();
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "index.jsp?kind=<%= kind %>";
	</script>
	<%
	return;	
}
//소유주가 있으면
String uno = dbms.GetValue("uno");
dbms.CloseQuery();

//소유자 여부 검사
if(login.getNo().equals(uno) == false)
{ //소유자가 아니면
	%>
	<script>
		alert("해당 게시물에 대한 삭제 권한이 없습니다.");
		document.location = "index.jsp?kind=<%= kind %>";
	</script>
	<%	
	return;
}

//첨부파일 먼저 삭제(외래키로 인함)
sql = "delete from attach ";
sql += "where bno = " + bno + " ";
dbms.RunSQL(sql);

//게시물 삭제
sql  = "delete from board ";
sql += "where bno = " + bno + " ";
dbms.RunSQL(sql);
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<div class="ok">
	<p>글이 삭제되었습니다.</p>
	<a class="btn" href="index.jsp?kind=<%= kind %>&page=1&key=<%= key %>">목록으로 돌아가기</a>
</div>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>