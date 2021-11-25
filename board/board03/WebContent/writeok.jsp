<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//회원정보
String bno			= "";															 //게시물번호
String uno			= o_uno;													 //회원번호
String btitle 	= request.getParameter("btitle");	 //제목
String bkind 		= request.getParameter("bkind");	 //구분
String bnote 		= request.getParameter("bnote");	 //내용

//빈 값 확인
if(uno == null || btitle == null || bkind == null || bnote == null)
{
	%>
	<script>
		alert("잘못된 접근입니다.");
		document.location = "write.jsp";
	</script>
	<%
	return;
}

System.out.println("uno: " + uno);
System.out.println("btitle: " + btitle);
System.out.println("bkind: " + bkind);
System.out.println("bnote: " + bnote);

Statement stmt = conn.createStatement();

//insert 처리
String sql = "";
sql = "";
sql += "insert into board ";
sql += "(uno,btitle,bkind,bnote) values ('";
sql += uno + "', '";
sql += btitle.replace("'","''") + "', '";
sql += bkind + "', '";
sql += bnote.replace("'","''") + "');";
System.out.println("SQL: " + sql);
stmt.executeUpdate(sql);


sql = "select last_insert_id() as bno;";
ResultSet result = stmt.executeQuery(sql);
result = stmt.executeQuery(sql);
if (result.next() == true)
{
	bno = result.getString("bno");
}
result.close();
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
글쓰기가 완료되었습니다.<br>
<a href="view.jsp?bno=<%= bno %>">작성글 보기</a>|
<a href="write.jsp">글쓰기</a>|
<a href="index.jsp">첫 페이지로 이동</a>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>