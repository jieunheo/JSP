<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//회원정보
String uno			= "";															 //회원번호
String uid 			= request.getParameter("uid");		 //아이디
String upw 			= request.getParameter("upw");		 //비밀번호
String uname 		= request.getParameter("uname");	 //이름
String ugender 	= request.getParameter("ugender"); //성별
String uhobby 	= request.getParameter("uhobby");	 //취미

//관심분야
String[] fav   = null;																//관심분야 테이블
String[] fkind = request.getParameterValues("fkind"); //관심분야

//빈 값 확인
if(uid == null || upw == null || uname == null || ugender == null || uhobby == null)
{
	out.println("데이터 입력 오류입니다.");
	return;
}

System.out.println("id: " + uid);
System.out.println("pw: " + upw);
System.out.println("name: " + uname);
System.out.println("gender: " + ugender);
System.out.println("hobby: " + uhobby);
if (fkind != null) //관심분야 값이 있을 때만 출력
{
	for (int i=0; i<fkind.length; i++)
	{
		System.out.println("kind" + (i+1) + ": " + fkind[i]);
	}
}
%>

<%@ include file="./include/header.jsp" %>
<%
Statement stmt = conn.createStatement();

//아이디 중복 확인
String sql = "";
sql += "select uid from user where uid = '" + uid + "';";
System.out.println("SQL: " + sql);
ResultSet result = stmt.executeQuery(sql);
if (result.next() == true)
{
	%>중복된 아이디가 존재합니다.<%
} else
{
	//insert 처리
	sql = "";
	sql += "insert into user ";
	sql += "(uid,upw,uname,ugender,uhobby) ";
	sql += "values ('" + uid + "', md5('" + upw + "'), '" + uname + "', '" + ugender + "', '" + uhobby + "');";
	System.out.println("SQL: " + sql);
	stmt.executeUpdate(sql);

	//관심분야 값이 있을 때만
	if (fkind != null)
	{
		/*
		//마지막 글의 번호 가져오기
		sql = "";
		sql += "select uno from user where uid = '" + uid + "';";
		result = stmt.executeQuery(sql);
		if (result.next() == true) uno = result.getString("uno");
		result.close();
		*/
		
		//마지막 글의 번호 가져오기2
		sql = "select last_insert_id() as uno;";
		result = stmt.executeQuery(sql);
		if (result.next() == true)
		{
			uno = result.getString("uno");
		}
		result.close();
		
		
		for (int i=0; i<fkind.length; i++)
		{
			fav = fkind[i].split(":");
			sql = "";
			sql += "insert into fav ";
			sql += "(uno,fkind,fname) ";
			sql += "values ('" + uno + "', '" + fav[0] + "', '" + fav[1] + "');";
			System.out.println("SQL: " + sql);
			stmt.executeUpdate(sql);
		}
	}
	%>회원가입이 완료되었습니다.<%
}
stmt.close();

%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<br>
<a href="index.jsp">처음 화면으로 돌아가기</a>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>