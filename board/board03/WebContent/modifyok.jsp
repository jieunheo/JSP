<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="./include/header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

//업로드 할 폴더 경로
String uploadPath = "C:\\hje\\WorkSpace\\Board03\\WebContent\\upload";

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = 
	new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

//회원정보
String bno    = multi.getParameter("bno");    //게시물 번호
String pageno = multi.getParameter("page");   //페이지번호
String uno		= o_uno;												//회원번호
String btitle = multi.getParameter("btitle");	//제목
String bkind 	= multi.getParameter("bkind");	//구분
String bnote 	= multi.getParameter("bnote");	//내용

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


//첨부파일이 있으면 추가
Enumeration files = multi.getFileNames(); //업로드된 파일명을 얻기
if (files != null) //첨부파일이 있다면 
{
	String fileid   = (String) files.nextElement();
	String filename = (String) multi.getFilesystemName("attach");
	if (filename != null) //attach 값이 있다면
	{
		System.out.println("파일명 : " + filename);
		
		//랜덤한 파일명 만들기
		String phyname = UUID.randomUUID().toString();   //랜덤이름 만들기
		String srcName    = uploadPath + "/" + filename; //다운로드한 파일 경로
		String targetName = uploadPath + "/" + phyname;  //바꿀 파일 경로
		//파일이름 바꾸기
		File srcFile = new File(srcName);
		File targetFile = new File(targetName); 
		srcFile.renameTo(targetFile);
		
		//기존 파일 삭제
		sql = "";
		sql += "delete from attach where bno = " + bno + ";";
		System.out.println("SQL: " + sql);
		stmt.executeUpdate(sql);
		
		//첨부파일 정보 등록
		sql = "";
		sql += "insert into attach ";
		sql += "(bno,uno,pname,fname) values (";
		sql += "'" + bno + "', ";
		sql += "'" + uno + "', ";
		sql += "'" + phyname + "', ";
		sql += "'" + filename + "');";
		System.out.println("SQL: " + sql);
		stmt.executeUpdate(sql);
	}
}

stmt.close();
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	alert("수정이 완료되었습니다.");
	document.location = "view.jsp?kind=<%= bkind %>&page=<%= pageno %>&bno=<%= bno %>";
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>