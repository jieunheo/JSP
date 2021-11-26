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

//kind의 값 분석(J/H)
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

Statement stmt = conn.createStatement();
String sql = "";

//(1)게시물 갯수 확인
sql += "select count(*) as count from board ";
sql += "where bkind = '" + kind + "' ";
ResultSet result = stmt.executeQuery(sql);
result.next();
total = result.getInt("count");
result.close();

//(2)최대 페이지 갯수 계산
max_page = total/paging_list;
if ((total % paging_list) != 0) max_page++;

//(6)페이지 첫 게시물 번호 계산
start_no = (cur_page - 1) * paging_list;

//게시물 목록 조회
sql = "";
sql += "select u.uname,u.uno,bno,btitle,date_format(bwdate,'%Y.%m.%d') as bwdate,bhit ";
sql += "from board as b ";
sql += "inner join user as u ";
sql += "on b.uno = u.uno ";
sql += "where bkind = '" + kind + "' ";
sql += "order by bno desc ";
//(7)페이지 당 가져올 게시물 limit
sql += "limit " + start_no + ", " + paging_list + ";";
result = stmt.executeQuery(sql);
//(8)실행 및 consol에 SQL구문 확인 출력
System.out.println(sql);

//(9)페이징 시작 블록 번호와 끝 블록 번호 계산
start_block = ((cur_page - 1) / page_cut) * page_cut + 1;
end_block = start_block + page_cut - 1;
//(10)end_block이 maxpage보다 클 경우
if (end_block >= max_page)
{ //끝 페이지를 최대 페이지로
	end_block = max_page;
}

%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※
			<%
			if(kind.equals("J")) %>자바학습 게시판<% 
			else %>HTML학습 게시판<%
			%>
			</span>
		</td>
	</tr>
	<tr>
		<td style="height:25px; text-align:right;">
		<%
		if (o_uno == null)
		{
			%><a href="javascript:alert('로그인 해주세요');" onclick="WriteCheck()">글쓰기</a><%
		} else
		{
			%><a href="write.jsp" onclick="WriteCheck()">글쓰기</a><%
		}
		%>
		</td>
	</tr>						
	<tr>
		<td>
			<table border="0" style="width:100%;">
				<tr>
					<td style="text-align:center; background-color:#f2f2f2; width: 60px;">번호</td>
					<td style="text-align:center; background-color:#f2f2f2;">제목</td>
					<td style="text-align:center; background-color:#f2f2f2;width: 80px;">작성일</td>
					<td style="text-align:center; background-color:#f2f2f2;width: 80px;">작성자</td>
					<td style="text-align:center; background-color:#f2f2f2;width: 70px;">조회수</td>						
				</tr>
				<%
				//(14)게시물 번호 출력 -> 전체 게시물 - 시작 페이지 번호
				int seqno = total - start_no;
				while (result.next() == true)
				{
					String bno    = result.getString("bno");
					String btitle = result.getString("btitle");
					String bwdate = result.getString("bwdate");
					String bhit   = result.getString("bhit");
					String uname  = result.getString("uname");
					%>
					<tr>
						<td style="text-align:center;"><%= seqno-- %></td>
						<td><a href="view.jsp?bno=<%= bno %>"><%= btitle %></a></td>
						<td style="text-align:center;"><%= bwdate %></td>
						<td style="text-align:center;"><%= uname %></td>
						<td style="text-align:center;"><%= bhit %></td>
					</tr>
					<%
				}	
				%>
			</table>							
		</td>
	</tr>
	<tr>
		<td style="text-align:center;">
		<!--  ◀ 1 2 3 4 5 6 7 8 9  ▶ -->
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
		for (int pageno = 1; pageno<=max_page; pageno++)
		{
			%><a href="index.jsp?no=<%= pageno %>"> <%= pageno %> </a> |<%
		}
		*/
		//(13)이전 블럭 출력
		if( start_block >= page_cut ) //시작 페이지가 페이지 컷 기준보다 크면
		{
			%><a href="index.jsp?kind=<%= kind %>&page=<%= start_block - 1 %>">◀</a> |<%
		}
		//(11)시작 블록 번호부터 끝 블록 번호까지 출력
		for (int pageno = start_block; pageno <= end_block; pageno++)
		{
			%><a href="index.jsp?kind=<%= kind %>&page=<%= pageno %>" <% if (cur_page == pageno) {%>style="color:red;" <%} %>> <%= pageno %> </a>|<%
		}
		//(12)다음 블럭 출력
		if( end_block < max_page) //끝 페이지가 최대 페이지보다 작으면
		{
			%><a href="index.jsp?kind=<%= kind %>&page=<%= end_block + 1 %>">▶</a><%
		}
		%>
		</td>
	</tr>												
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>