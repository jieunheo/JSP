<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezen.*" %>

<%
//페이징을 위한 변수 선언
int total   = 0;  //전체 게시물 갯수
int max_page = 0;  //최대 페이지 갯수
int cur_page = 0;  //현재 페이지 번호
int start_no = 0;  //페이지 첫 게시물 번호
int paging_list = 10; //페이지에 나올 게시물 갯수

int page_cut    = 10; //나열될 페이지 번호의 갯수
int start_block = 0;  //페이징 시작 블록 번호
int end_block   = 0;  //페이징 끝 블록 번호


//(5)넘어온 값 page를 분석
if (request.getParameter("page") != null) //넘어온 페이지 번호
{ //비어있지 않으면 curpage에 해당 값 할당
	cur_page = Integer.parseInt(request.getParameter("page"));
} else
{ //비어있으면 1
	cur_page = 1;
}

String sql = "";

DBManager dbms = new DBManager();
dbms.DBOpen();

//(1)게시물 갯수 확인
sql += "select count(*) as count from memo ";
dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInteger("count");
out.println("전체 갯수: " + total);
dbms.CloseQuery();

//(2)최대 페이지 갯수 계산
max_page = total/paging_list;
if ((total % paging_list) != 0) max_page++;

//(6)페이지 첫 게시물 번호 계산
start_no = (cur_page - 1) * paging_list;

//게시물 목록 조회
sql = "";
sql += "select no,title ";
sql += "from memo ";
sql += "order by no desc ";
//(7)페이지 당 가져올 게시물 limit
sql += "limit " + start_no + ", " + paging_list + ";";
//(8)실행 및 consol에 SQL구문 확인 출력
dbms.OpenQuery(sql);

//(9)페이징 시작 블록 번호와 끝 블록 번호 계산
start_block = ((cur_page - 1) / page_cut) * page_cut + 1;
end_block = start_block + page_cut - 1;
//(10)end_block이 maxpage보다 클 경우
if (end_block >= max_page)
{ //끝 페이지를 최대 페이지로
	end_block = max_page;
}

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
			
			//(14)게시물 번호 출력 -> 전체 게시물 - 시작 페이지 번호
			int seqno = total - start_no;
			while (dbms.GetNext() == true)
			{
				String no = dbms.GetValue("no");
				String title = dbms.GetValue("title");
				%>
				<tr>
					<td><%= seqno-- %></td>
					<td style="text-align:left">
						<a href="view.jsp?no=<%= no %>"><%= title %></a>
					</td>
				</tr>
				<%
			}
			dbms.CloseQuery();
			%>
		</table>		
		<table border="1" align="center" style="width:600px">
			<tr>
				<td>전체게시물 :  <%= total %></td>
			</tr>
			<tr>
				<td>
				<!-- 이전페이지 | 1 | 2 | 3 | 4 | 5 | 다음페이지 -->
				<%
				//(3)최개 페이지 갯수만큼 페이지 표시
				/*
				for (int pageno = 1; pageno<=maxpage; pageno++)
				{
					%> <%= pageno %> |<%
				}
				*/
				/*
				//(4)최개 페이지 갯수만큼 페이지 표시
				for (int pageno = 1; pageno<=maxpage; pageno++)
				{
					%><a href="index.jsp?no=<%= pageno %>"> <%= pageno %> </a> |<%
				}
				*/
				//(13)이전 블럭 출력
				if( start_block >= page_cut ) //시작 페이지가 페이지 컷 기준보다 크면
				{
					%><a href="index.jsp?page=<%= start_block - 1 %>">◀</a> |<%
				}
				//(11)시작 블록 번호부터 끝 블록 번호까지 출력
				for (int pageno = start_block; pageno <= end_block; pageno++)
				{
					%><a href="index.jsp?page=<%= pageno %>" <% if (cur_page == pageno) {%>style="color:red;" <%} %>> <%= pageno %> </a>|<%
				}
				//(12)다음 블럭 출력
				if( end_block < max_page) //끝 페이지가 최대 페이지보다 작으면
				{
					%><a href="index.jsp?page=<%= end_block + 1 %>">▶</a><%
				}
				%>
				</td>
			</tr>
		</table>
	</body>
</html>
<%
dbms.DBClose();
%>