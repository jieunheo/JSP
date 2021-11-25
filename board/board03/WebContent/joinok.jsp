<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//회원정보
String uid 			= request.getParameter("uid");
String upw 			= request.getParameter("upw");
String uname 		= request.getParameter("uname");
String ugender 	= request.getParameter("ugender");
String uhobby 		= request.getParameter("uhobby");

//관심분야
String[] fkind = request.getParameterValues("fkind");

if(uid == null || upw == null || uname == null || ugender == null || uhobby == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

switch (uhobby)
{
	case "001": uhobby = "낚시"; break;
	case "002": uhobby = "여행"; break;
	case "003": uhobby = "게임"; break;
}

/*
out.println("id: " + id);
out.println("pw: " + pw);
out.println("name: " + name);
out.println("gender: " + gender);
out.println("hobby: " + hobby);

out.println("interest: ");
for (int i=0; i<interest.length; i++)
{
	out.println(interest[i]);
}
*/
%>

<%@ include file="./include/header.jsp" %>
<%
Statement stmt = conn.createStatement(); //작업 처리용 클래스 할당

//회원 가입
String sql = "";
sql += "insert into user ";
sql += "(uid,upw,uname,ugender,uhobby) ";
sql += "values ('" + uid + "','" + upw + "', '" + uname + "', '" + ugender + "', '" + uhobby + "');";
stmt.executeUpdate(sql);

//해당 uno값 가져오기
String uno = null;

sql = "select last_insert_id() as uno;";
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true) uno = result.getString("no");

for (int i=0; i<fkind.length; i++)
{
	String fname = "";
	
	switch (fkind[i])
	{
		case "001": fname = "책"; break;
		case "002": fname = "영화"; break;
		case "003": fname = "유튜브"; break;
	}
	sql = "";
	sql += "insert into fav ";
	sql += "(uno,fkind,fname) ";
	sql += "values (" + uno + ", '" + fkind[i] + "', '" + fname +"');";
}

stmt.close(); //닫기
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
회원가입이 완료되었습니다.<br>
<a href="index.jsp">처음 화면으로 돌아가기</a>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>