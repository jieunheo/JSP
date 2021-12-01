<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

MultipartRequest multi = 
new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

//회원정보
String bno			= "";														 //게시물번호
String uno			= login.getNo();								 //회원번호
String btitle 	= multi.getParameter("btitle");	 //제목
String bkind 		= multi.getParameter("bkind");	 //구분
String bnote 		= multi.getParameter("bnote");	 //내용
String pageno   = multi.getParameter("page");    //페이지번호
if (pageno == null) pageno = "1";

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

//insert 처리
String sql = "";
sql = "insert into board ";
sql += "(uno,btitle,bkind,bnote) values ('";
sql += uno + "', '";
sql += btitle.replace("'","''") + "', '";
sql += bkind + "', '";
sql += bnote.replace("'","''") + "');";
System.out.println("SQL: " + sql);
dbms.RunSQL(sql);

sql = "select last_insert_id() as bno;";
dbms.OpenQuery(sql);
dbms.GetNext();
bno = dbms.GetValue("bno");
dbms.CloseQuery();

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
		
		//첨부파일 정보 등록
		sql = "";
		sql += "insert into attach ";
		sql += "(bno,uno,pname,fname) values (";
		sql += "'" + bno + "', ";
		sql += "'" + uno + "', ";
		sql += "'" + phyname + "', ";
		sql += "'" + filename + "');";
		System.out.println("SQL: " + sql);
		dbms.RunSQL(sql);
	}
}
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	document.location= "view.jsp?kind=<%= bkind %>&no=<%= bno %>";
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>