<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%
request.setCharacterEncoding("UTF-8");

//업로드 할 폴더 경로
String uploadPath = "C:\\hje\\WorkSpace\\WebEx09\\WebContent\\upload";

//업로드가 가능한 최대 파일 크기를 지정한다.
int size = 10 * 1024 * 1024;

MultipartRequest multi = 
	new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
//										 						경로			 크기		 인코딩		  겹치는 파일이름인 경우 이름 바꿔 저장

//타이틀명 얻어오기
String title = multi.getParameter("title");
out.print("제목:" + title + "<br>");

//업로드된 파일명을 얻는다.
Enumeration files = multi.getFileNames();
String fileid = (String) files.nextElement();
String filename = (String) multi.getFilesystemName("attach");
out.print("파일명 : " + filename + "<br>");

//랜덤한 파일명 만들기
String phyname = UUID.randomUUID().toString();   //랜덤이름 만들기
String srcName    = uploadPath + "/" + filename; //다운로드한 파일 경로
String targetName = uploadPath + "/" + phyname;  //바꿀 파일 경로
//파일이름 바꾸기
File srcFile = new File(srcName);
File targetFile = new File(targetName); 
srcFile.renameTo(targetFile);

out.print("파일명: " + phyname + "<br>");
%>
<a href="download.jsp?file=<%= phyname %>">다운로드</a>