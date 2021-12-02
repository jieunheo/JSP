<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//인코딩 방식
request.setCharacterEncoding("UTF-8");

MultipartRequest multi = 
new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

//값 받아오기
String bno      = multi.getParameter("no");     //게시물번호
String kind     = multi.getParameter("kind");   //구분
String cur_page = multi.getParameter("page");   //페이지번호
String key      = multi.getParameter("key");    //검색 키워드
if (key == null)	key = "";
//key = URLEncoder.encode(key);
key = key.replace("[", "%5B").replace("]", "%5D");

String btitle 	= multi.getParameter("btitle");	//제목
String bkind    = multi.getParameter("bkind");  //구분
String bnote 		= multi.getParameter("bnote");	//내용
String attach		= multi.getParameter("attach");	//첨부파일

System.out.println("btitle: " + btitle);
System.out.println("bkind: " + bkind);
System.out.println("bnote: " + bnote);

String sql = "";
//insert 처리
sql += "update board ";
sql += "set btitle = '" + btitle.replace("'","''") + "', ";
sql += "bkind = '" + bkind + "', ";
sql += "bnote = '" + bnote.replace("'","''") + "' ";
sql += "where bno = " + bno + ";";
System.out.println("SQL: " + sql);
dbms.RunSQL(sql);

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
		dbms.RunSQL(sql);
		
		//첨부파일 정보 등록
		sql = "";
		sql += "insert into attach ";
		sql += "(bno,uno,pname,fname) values (";
		sql += "'" + bno + "', ";
		sql += "'" + login.getNo() + "', ";
		sql += "'" + phyname + "', ";
		sql += "'" + filename + "');";
		System.out.println("SQL: " + sql);
		dbms.RunSQL(sql);
	}
}
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<script>
	alert("수정 되었습니다.");
	document.location = "view.jsp?no=<%= bno %>&kind=<%= bkind %>&page=<%= cur_page %>&key=<%= key %>";
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>