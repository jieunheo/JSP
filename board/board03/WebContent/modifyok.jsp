<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//회원정보
String bno    = request.getParameter("bno");    //게시물 번호
String pageno = request.getParameter("page");   //페이지번호
String uno		= o_uno;												  //회원번호
String btitle = request.getParameter("btitle");	//제목
String bkind 	= request.getParameter("bkind");	//구분
String bnote 	= request.getParameter("bnote");	//내용

//빈 값 확인
if(btitle == null || bkind == null || bnote == null)
{
	%>
	<script>
		alert("빈 값이 있습니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}

System.out.println("uno: " + uno);
System.out.println("btitle: " + btitle);
System.out.println("bkind: " + bkind);
System.out.println("bnote: " + bnote);

Statement stmt = conn.createStatement();
String sql = "";

//잘못된 접근 막기
sql = "select uno,bno from board where bno = " + bno + " and uno = " + o_uno + ";";
ResultSet result = stmt.executeQuery(sql);
if (uno == null || bno == null || result.next() == false)
{ //번호가 비어있거나 존재하지 않는 번호일 때
	%>
	<script>
		alert("비정상적인 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}

//insert 처리
sql = "";
sql += "update board ";
sql += "set btitle = '" + btitle.replace("'","''") + "', ";
sql += "bkind = '" + bkind + "', ";
sql += "bnote = '" + bnote.replace("'","''") + "' ";
sql += "where bno = " + bno + ";";
System.out.println("SQL: " + sql);
stmt.executeUpdate(sql);
stmt.close();

%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	alert("수정이 완료되었습니다.");
	document.location = "view.jsp?kind=<%= bkind %>&page=<%= pageno %>&bno=<%= bno %>";
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>