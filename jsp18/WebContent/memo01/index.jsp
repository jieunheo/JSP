<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String page_no = request.getParameter("page");
//String max_page = request.getParameter("maxpage");
int    cur_page_no = 1; //기본 페이지
if (page_no != null)    //넘어온 페이지 번호
{
	cur_page_no = Integer.parseInt(page_no);
}

/*//초과된 페이지인 경우 마지막 페이지로 이동
if (max_page != null)
{
	if (cur_page_no > Integer.parseInt(max_page)) {
		//out.println(page_no + "페이지는 없는 페이지 입니다.");
		response.sendRedirect("index.jsp?page=" + max_page);
	}
}*/
int paging_list = 10;

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
			
			int start_no = (cur_page_no - 1) * paging_list; //시작 페이지번호
			sql = "";
			sql += "select no,title ";
			sql += "from memo ";
			//sql += "where title like = '%2%' ";
			sql += "order by no desc ";
			sql += "limit " + start_no + ", " + paging_list + ";";
			result = stmt.executeQuery(sql);
			
			//게시물 번호
			int seqno = total - start_no; //전체 게시물 - 시작 페이지 번호
			while (result.next() == true)
			{
				String no = result.getString("no");
				String title = result.getString("title");
				%>
				<tr>
					<td><%= seqno-- %></td>
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
				<td colspan="2">
					<%
					//최대 페이지 갯수 - 전체 게시물 페이지 갯수
					int maxpage = total/paging_list;
					if ((total % paging_list) != 0) maxpage++; //10개 미만 게시물이 있으면 1 추가
					
					//페이지 나열 번호 나누기
					int page_cut = 10; //나열될 페이지 번호의 숫자
					//시작 페이지 블럭 - 최대 페이지를 단위로 끊은 구간의 시작
					int start_block = ((cur_page_no - 1) / page_cut) * page_cut + 1;
					//끝 페이지 블럭 - 최대 페이지를 단위로 끊은 구간의 끝
					int end_block = start_block + page_cut - 1;
					if( end_block >= maxpage) //전체 페이지보다 넘을 경우
					{
						end_block = maxpage;    //끝페이지를 전체 페이지만큼
					}
					
					//이전페이지로
					if( start_block >= page_cut ) //시작 페이지가 페이지 컷 기준보다 크면
					{
						%><a href="index.jsp?page=<%= start_block - 1 %>">이전 페이지</a> |<%
					}
					
					for (int pageno = start_block; pageno <= end_block; pageno++)
					{
						%><a href="index.jsp?page=<%= pageno %>" <% if (cur_page_no == pageno) {%>style="color:red;" <%} %>> <%= pageno %> </a>|<%
					}
					
					//다음페이지로
					if( end_block < maxpage) //끝 페이지가 최대 페이지보다 작으면
					{
						%><a href="index.jsp?page=<%= end_block + 1 %>">다음 페이지</a><%
					}
					%>
					<!-- 페이지 검색 -->
					<%--
					<form name="look_up_page" method="get" action="index.jsp">
						<input type="hidden" name="maxpage" value="maxpage">
						<input type="text" name="page" size="3">
						<input type="submit" value="페이지로 이동">
					</form>
					 --%>
					</td>
				</tr>
		</table>
	</body>
</html>
<%
conn.close();
%>