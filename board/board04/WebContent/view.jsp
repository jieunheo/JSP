<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//값 받아오기
String bno    = request.getParameter("no");  //게시물번호
String bkind   = request.getParameter("kind"); //구분

//사용할 변수
String uno		 = ""; //회원번호
String btitle  = ""; //제목
String bnote 	 = "";	//내용
String bwdate  = "";	//작성일
String bhit 	 = "";	//조회수
String uname 	 = "";	//작성자

//빈 값 확인
if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("잘못된 접근입니다.");
		document.location = "index.jsp?kind=<%= bkind %>";
	</script>
	<%
	return;
}

//조회수 카운트
String sql = "";
sql += "update board set bhit = bhit + 1 where bno = " + bno + ";";
dbms.RunSQL(sql);

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
		document.location = "index.jsp?kind=<%= bkind %>";
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

//게시글 내용 정리
bnote = bnote.replace("<", "&lt;");
bnote = bnote.replace(">", "&gt;");
bnote = bnote.replace("\n", "<br>");

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
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 글보기</span>
		</td>
	</tr>
</table>
<table border="" style="width:100%;">
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">구분</td>
		<td>
		<%
		if(bkind.equals("J")) %>자바학습 게시판<% 
		else %>HTML학습 게시판<%
		%>
		</td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">제목</td>
		<td><%= btitle %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">작성자</td>
		<td><%= uname %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">작성일</td>
		<td><%= bwdate %></td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">조회수</td>
		<td><%= bhit %>회</td>
	</tr>
	<tr>
		<td colspan="2"><%= bnote %></td>
	</tr>	
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">첨부파일</td>
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
</table>
<div class="btn_wrap">
	<a class="btn" href="index.jsp?kind=<%= bkind %>">글목록</a>
	<%
	if (login != null && login.getNo().equals(uno))
	{
		//로그인한 사람과 게시글 작성자가 같으면 수정,삭제 보이도록
		%>
		<a class="btn" href="modify.jsp?kind=<%= bkind %>&bno=<%= bno %>">글수정</a>
		<a class="btn" href="delete.jsp?kind=<%= bkind %>&bno=<%= bno %>">글삭제</a>
		<%
	}
	%>
</div>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>