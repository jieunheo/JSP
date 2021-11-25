<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//회원정보
String id 			= request.getParameter("id");
String pw 			= request.getParameter("pw");
String name 		= request.getParameter("name");
String gender 	= request.getParameter("gender");
String hobby 		= request.getParameter("hobby");

//관심분야
String[] interest = request.getParameterValues("interest");

if(id == null || pw == null || name == null || gender == null || hobby == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

switch (hobby)
{
	case "001": hobby = "낚시"; break;
	case "002": hobby = "여행"; break;
	case "003": hobby = "게임"; break;
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
sql += "values ('" + id + "','" + pw + "', '" + name + "', '" + gender + "', '" + hobby + "');";
stmt.executeUpdate(sql);

//해당 uno값 가져오기
String uno = null;

sql = "select last_insert_id() as uno;";
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true) uno = result.getString("no");

for (int i=0; i<interest.length; i++)
{
	String fname = "";
	
	switch (interest[i])
	{
		case "001": fname = "책"; break;
		case "002": fname = "영화"; break;
		case "003": fname = "유튜브"; break;
	}
	sql = "";
	sql += "insert into fav ";
	sql += "(uno,fkind,fname) ";
	sql += "values (" + uno + ", '" + interest[i] + "', '" + fname +"');";
}

stmt.close(); //닫기
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
회원가입이 완료되었습니다.<br>
<a href="index.jsp">처음 화면으로 돌아가기</a>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>