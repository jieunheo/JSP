<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%
int total = 0; //전체 게시물 갯수
int max_page = 0;  //최대 페이지 갯수
int cur_page = 0;  //현재 페이지 번호
int start_no = 0;  //페이지 첫 게시물 번호
int paging_list = 10; //한 페이지에 뿌려지는 글 갯수

int page_cut    = 10; //나열될 페이지 번호의 갯수
int start_block = 0;  //페이징 시작 블록 번호
int end_block   = 0;  //페이징 끝 블록 번호

String sql = ""; //sql문

if (request.getParameter("page") != null) //넘어온 페이지 번호
{
	cur_page = Integer.parseInt(request.getParameter("page"));
} else 
{
	cur_page = 1;
}

//전체 게시물 갯수
sql += "select count(*) as count from memo ";
dbms.OpenQuery(sql);
if (dbms.GetNext() == true)
{
	total = dbms.GetInteger("count");
}
dbms.CloseQuery();

//최개 페이지 계산
max_page = total/paging_list;
if ((total % paging_list) != 0) max_page++;

//시작 페이지번호
start_no = (cur_page - 1) * paging_list;

//한 페이지에 나올 내용 받아오기
sql = "";
sql += "select no,title ";
sql += "from memo ";
sql += "order by no desc ";
sql += "limit " + start_no + ", " + paging_list + ";";
dbms.OpenQuery(sql);

//페이지 시작/끝 번호 계산
start_block = ((cur_page - 1) / page_cut) * page_cut + 1;
end_block = start_block + page_cut - 1;
if (end_block >= max_page)
{ //끝 페이지를 최대 페이지로
	end_block = max_page;
}
%>
<div class="main">
	<div class="top clearfix">
		<a class="btn" href="write.jsp">글쓰기</a>
	</div>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<%
			//게시물 번호 출력 -> 전체 게시물 - 시작 페이지 번호
			int seqno = total - start_no;
			//페이지 뿌리기
			while (dbms.GetNext() == true)
			{
				String no = dbms.GetValue("no");
				String title = dbms.GetValue("title");
				%>
				<tr>
					<td><%= seqno-- %></td>
					<td>
						<a href="view.jsp?no=<%= no %>"><%= title %></a>
					</td>
				</tr>
				<%
			}
			dbms.CloseQuery();
			%>
		</tbody>
	</table>		
	<div class="paging">
		<p>전체게시물 :  <%= total %></p>
		<%
		//맨 앞으로
		if( start_block >= page_cut ) //끝 페이지가 최대 페이지보다 작으면
		{
			%><a href="index.jsp?page=1"> 맨처음 </a>|<%
		}
		//이전 페이지리스트
		if( start_block >= page_cut ) //시작 페이지가 페이지 컷 기준보다 크면
		{
			%><a href="index.jsp?page=<%= start_block - 1 %>"> ◀ </a>|<%
		}
		//페이지 리스트
		for ( int pageno = start_block; pageno <= end_block; pageno++ )
		{
			%><a href="index.jsp?page=<%= pageno %>" <% if (cur_page == pageno) {%>style="color:red;" <%} %>> <%= pageno %> </a>|<%
		}
		//다음 페이지리스트
		if( end_block < max_page ) //끝 페이지가 최대 페이지보다 작으면
		{
			%><a href="index.jsp?page=<%= end_block + 1 %>"> ▶ </a>|<%
		}
		//맨 뒤로
		if( end_block < max_page ) //끝 페이지가 최대 페이지보다 작으면
		{
			%><a href="index.jsp?page=<%= max_page %>"> 맨뒤 </a><%
		}
		%>
	</div>
</div>
<%@ include file="footer.jsp" %>
<%
dbms.DBClose();
%>