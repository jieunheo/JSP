<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<%
String bno    = request.getParameter("bno");  //게시물 번호
String kind   = request.getParameter("kind"); //구분
String pageno = request.getParameter("page"); //페이지번호

Statement stmt = conn.createStatement();
String sql = "";

//잘못된 접근 막기
sql = "select uno,bno from board where bno = " + bno + " and uno = " + o_uno + ";";
ResultSet result = stmt.executeQuery(sql);
if (bno == null || result.next() == false)
{ //번호가 비어있거나 존재하지 않는 번호일 때
	%>
	<script>
		alert("비정상적인 접근입니다.");
		document.location = "index.jsp";
	</script>
	<%
	return;
}

//삭제
//외래키로 인해 첨부파일 먼저 삭제해야 함
sql = "delete from attach where bno = " + bno + ";";
stmt.executeUpdate(sql);

sql = "delete from board where bno = " + bno + " and uno = " + o_uno + ";";
stmt.executeUpdate(sql);

stmt.close();
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	alert("삭제되었습니다.");
	document.location = "index.jsp";
</script>
<!-- 
글이 삭제되었습니다.<br>
<a href="index.jsp">목록으로 돌아가기</a>
 -->
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>