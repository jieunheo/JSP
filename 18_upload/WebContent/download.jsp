<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
//파일 이름 가져오기
String filename = request.getParameter("file");

//파일 경로
String uploadPath = "C:\\hje\\WorkSpace\\WebEx09\\WebContent\\upload";
String fullname    = uploadPath + "\\" + filename;
//out.print(fullname);

response.setContentType("application/octet-stream"); //읽어들일 방식   
response.setHeader("Content-Disposition","attachment; filename=" + filename + "");
//																															다운할 때의 파일 이름 

//파일 받아서 브라우저로 뿌리기
File file = new File(fullname); //파일경로
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();

byte[] outputByte = new byte[4096]; //읽어들일 바이트 크기
//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();
%>