<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String page_no = request.getParameter("page");
int    cur_page_no = 1; //기본 페이지
if (page_no != null)    //넘어온 페이지 번호
{
	cur_page_no = Integer.parseInt(page_no);
}

//JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");

//db연결할 변수
String host = "jdbc:mysql://localhost:3306/memodb";
host += "?useUnicode=ture&characterEncoding=utf-8&serverTimezone=UTC"; //db주소
String userid = "root"; //id
String userpw = "ezen"; //pw

//db연결
Connection conn = null;
conn = DriverManager.getConnection(host, userid, userpw);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메모목록</title>
	</head>
	<body>
		<style>
			td
			{
				text-align:center;
			}
		</style>
		<table border="1" align="center" style="width:600px">
			<tr>
				<td colspan="2" style="text-align:right">
				<a href="write.jsp">글쓰기</a>
				</td>
			</tr>
			<tr>
				<td style="width:100px;">번호</td>
				<td>제목</td>
			</tr>
			<%
			Statement stmt = conn.createStatement();

			//전체 개시물 갯수
			String sql = "";
			sql += "select count(*) as count from memo ";
			//sql += "where title like = '%2%' ";
			ResultSet result = stmt.executeQuery(sql);
			result.next();
			int total = result.getInt("count");
			out.println("전체 갯수: " + total);
			
			int start_no = (cur_page_no - 1) * 10; //페이지번호
			sql = "";
			sql += "select no,title ";
			sql += "from memo ";
			//sql += "where title like = '%2%' ";
			sql += "order by no desc ";
			sql += "limit " + start_no + ", 10;";
			
			result = stmt.executeQuery(sql);
			while (result.next() == true)
			{
				String no = result.getString("no");
				String title = result.getString("title");
				%>
				<tr>
					<td><%= no %></td>
					<td style="text-align:left">
						<a href="view.jsp?no=<%= no %>"><%= title %></a>
					</td>
				</tr>
				<%
			}
			%>
		</table>
		<table border="1" align="center" style="width:600px">
			<tr>
				<td colspan="2" style="text-align:right">
					<%
					//최대 페이지 갯수
					int maxpage = total/10;
					if ((total % 10) != 0) maxpage++;
					
					for (int pageno=1; pageno<=maxpage; pageno++)
					{
						%><a href="index.jsp?page=<%= pageno %>"> <%= pageno %> |</a><%
					}
					%>
					</td>
				</tr>
		</table>
	</body>
</html>
<%
conn.close();
%>