<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<%
//값 받아오기
String bno    = request.getParameter("bno");  //게시물번호
String kind   = request.getParameter("kind"); //구분
String pageno = request.getParameter("page"); //페이지번호

//사용할 변수
String uno		 = ""; //회원번호
String btitle  = ""; //제목
String bnote 	 = "";	//내용
String bkind 	 = kind;	//구분
String bwdate  = "";	//작성일
String bhit 	 = "";	//조회수
String uname 	 = "";	//작성자


//빈 값 확인
if(bno == null)
{
	%>
	<script>
		alert("잘못된 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}

Statement stmt = conn.createStatement();

String sql = "";
sql += "update board set bhit = bhit + 1 where bno = " + bno + ";";
stmt.executeUpdate(sql);

sql = "";
sql += "select u.uname,u.uno,btitle,bkind,bnote,bwdate,bhit ";
sql += "from board as b ";
sql += "inner join user as u ";
sql += "on b.uno = u.uno ";
sql += "where bno=" + bno;
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true)
{
	uno    = result.getString("uno");
	btitle = result.getString("btitle");
	bnote  = result.getString("bnote");
	bkind  = result.getString("bkind");
	bwdate = result.getString("bwdate");
	bhit   = result.getString("bhit");
	uname  = result.getString("uname");
} else
{
	%>
	<script>
		alert("잘못된 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}

//게시글 내용 정리
bnote   = bnote.replace("<", "&lt;");
bnote   = bnote.replace(">", "&gt;");
bnote   = bnote.replace("\n", "<br>");

stmt.close();
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
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
		<td>test.hwp</td>
	</tr>	
	<tr>
		<td colspan="2" align="center" style="height:40px;">
		<a href="index.jsp?kind=<%= kind %>&page=<%= pageno %>">글목록</a>
		<%
		if (o_uno != null && o_uno.equals(uno))
		{
			//로그인한 사람과 게시글 작성자가 같으면 수정,삭제 보이도록
			%>
			&nbsp;|&nbsp;
			<a href="modify.jsp?kind=<%= kind %>&page=<%= pageno %>&bno=<%= bno %>">글수정</a>&nbsp;&nbsp;|&nbsp;
			<a href="delete.jsp?kind=<%= kind %>&page=<%= pageno %>&bno=<%= bno %>">글삭제</a>
			<%
		} 
		%>
		</td>
	</tr>																													
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>