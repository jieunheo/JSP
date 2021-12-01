<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//페이징을 위한 변수 선언
int total    = 0;  //전체 게시물 갯수
int max_page = 0;  //최대 페이지 갯수
int cur_page = 0;  //현재 페이지 번호
int start_no = 0;  //페이지 첫 게시물 번호
int paging_list = 10; //페이지에 나올 게시물 갯수

int page_cut    = 10; //나열될 페이지 번호의 갯수
int start_block = 0;  //페이징 시작 블록 번호
int end_block   = 0;  //페이징 끝 블록 번호

//kind 값 분석(J/H)
String kind = request.getParameter("kind");
if (kind == null)	kind = "J"; //값이 없으면 J로

//(5)넘어온 값 page를 분석
if (request.getParameter("page") != null) //넘어온 페이지 번호
{ //비어있지 않으면 curpage에 해당 값 할당
	cur_page = Integer.parseInt(request.getParameter("page"));
} else
{ //비어있으면 1
	cur_page = 1;
}

String sql = "";

//(1)게시물 갯수 확인
sql = "";
sql += "select count(*) as count from board ";
sql += "where bkind = '" + kind + "' ";
dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInteger("count");
dbms.CloseQuery();

//(6)페이지 첫 게시물 번호 계산
start_no = (cur_page - 1) * paging_list;

//(2)최대 페이지 갯수 계산
max_page = total/paging_list;
if ((total % paging_list) != 0) max_page++; //나머지가 있는 경우 +1

//게시물 목록 조회
sql = "";
sql += "select u.uname,u.uno,bno,btitle,date_format(bwdate,'%Y.%m.%d') as bwdate,bhit ";
sql += "from board as b ";
sql += "inner join user as u ";
sql += "on b.uno = u.uno ";
sql += "where bkind = '" + kind + "' "; //구분에 따른 전체 갯수
sql += "order by bno desc ";
//(7)페이지 당 가져올 게시물 limit
sql += "limit " + start_no + ", " + paging_list + ";";
dbms.OpenQuery(sql);
%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<h3>
	<%
	if(kind.equals("J")) %>※ 자바학습 게시판<% 
	else %>※ HTML학습 게시판<%
	%>
</h3>
<table border="0" style="width:100%;">
	<tr>
		<td style="height:25px; text-align:right;">
		<%
		if (login == null)
		{
			%>
			<a class="btn" href="javascript:alert('로그인 해주세요');" onclick="WriteCheck()">글쓰기</a>
			<%
		} else
		{
			%><a class="btn" href="write.jsp?kind=<%= kind %>" onclick="WriteCheck()">글쓰기</a><%
		}
		%>
		</td>
	</tr>						
	<tr>
		<td>
			<table class="contents">
				<thead>
					<tr>
						<th style="text-align:center; background-color:#f2f2f2; width: 60px;">번호</th>
						<th style="text-align:center; background-color:#f2f2f2;">제목</th>
						<th style="text-align:center; background-color:#f2f2f2;width: 100px;">작성일</th>
						<th style="text-align:center; background-color:#f2f2f2;width: 80px;">작성자</th>
						<th style="text-align:center; background-color:#f2f2f2;width: 70px;">조회수</th>						
					</tr>
				</thead>
				<tbody>
				<%
				while (dbms.GetNext() == true)
				{
					String bno    = dbms.GetValue("bno");
					String btitle = dbms.GetValue("btitle");
					String bwdate = dbms.GetValue("bwdate");
					String bhit   = dbms.GetValue("bhit");
					String uname  = dbms.GetValue("uname");
					%>
					<tr>
						<td style="text-align:center;"><%= bno %></td>
						<td><a href="view.jsp?no=<%= bno %>&kind=<%= kind %>&page=<%= cur_page %>"><%= btitle %></a></td>
						<td style="text-align:center;"><%= bwdate %></td>
						<td style="text-align:center;"><%= uname %></td>
						<td style="text-align:center;"><%= bhit %></td>
					</tr>
					<%
				}	
				%>
				</tbody>
			</table>							
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
		<!-- ◀ 1 2 3 4 5 6 7 8 9  ▶ -->
		<%
		//(3),(4)최대 페이지 갯수만큼 페이지 표시
		for (int pageno = 1; pageno<=max_page; pageno++)
		{
			%><a href="index.jsp?kind=<%= kind %>&page=<%= pageno %>" <% if (cur_page == pageno) %>style="color:red;"<%; %>>
					<%= pageno %> 
				</a> | 
			<%
		}
		%>
		</td>
	</tr>												
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>