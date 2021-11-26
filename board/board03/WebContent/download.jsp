<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<%
//첨부파일 번호 받아오기
String ano = request.getParameter("fno");
if (ano == null) //없으면 메인으로
{
	response.sendRedirect("index.jsp");
	return;
}

//JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

//db연결할 변수
String host = "jdbc:mysql://localhost:3306/boarddb";
host += "?useUnicode=ture&characterEncoding=utf-8&serverTimezone=UTC"; //db주소
String userid = "root"; //id
String userpw = "ezen"; //pw

//db연결
Connection conn = null;
conn = DriverManager.getConnection(host, userid, userpw);

Statement stmt = conn.createStatement();
String sql = "";

//파일 이름 검색
sql += "select pname,fname ";
sql += "from attach ";
sql += "where ano=" + ano;
ResultSet result = stmt.executeQuery(sql);

String pname = ""; //첨부파일 번호
String fname = ""; //첨부파일 이름
if (result.next() == false)
{
	response.sendRedirect("index.jsp");
	return;
}
pname = result.getString("pname");
fname = result.getString("fname");

stmt.close();
conn.close();

//out.print(pname + "<br>");
//out.print(fname);

//파일 경로
String uploadPath = "C:\\hje\\WorkSpace\\Board03\\WebContent\\upload";
String fullname    = uploadPath + "\\" + pname;

//파일 이름 한글 인코딩 - 크롬
//fname = new String(fname.getBytes("UTF-8"), "ISO-8859-1");
fname = URLEncoder.encode(fname, "UTF-8");

response.setContentType("application/octet-stream"); //읽어들일 방식   
response.setHeader("Content-Disposition","attachment; filename=" + fname + "");
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

<%--
//브라우저별 한글 파일 이름 깨짐 인코딩 처리
String name = "파일이름";

String header = request.getHeader("User-Agent");
if (header.contains("Edge")){
    name = URLEncoder.encode(name, "UTF-8").replaceAll("\\+", "%20");
    response.setHeader("Content-Disposition", "attachment;filename=\"" + name + "\".xls;");
} else if (header.contains("MSIE") || header.contains("Trident")) { // IE 11버전부터 Trident로 변경되었기때문에 추가해준다.
    name = URLEncoder.encode(name, "UTF-8").replaceAll("\\+", "%20");
    response.setHeader("Content-Disposition", "attachment;filename=" + name + ".xls;");
} else if (header.contains("Chrome")) {
    name = new String(name.getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\".xls");
} else if (header.contains("Opera")) {
    name = new String(name.getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\".xls");
} else if (header.contains("Firefox")) {
    name = new String(name.getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("Content-Disposition", "attachment; filename=" + name + ".xls");
}
--%>