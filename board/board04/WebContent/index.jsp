<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
//kind 값 분석(J/H)
String kind = request.getParameter("kind");
if (kind == null)	kind = "J"; //값이 없으면 J로


//게시물 목록 조회
String sql = "";
sql += "select u.uname,u.uno,bno,btitle,date_format(bwdate,'%Y.%m.%d') as bwdate,bhit ";
sql += "from board as b ";
sql += "inner join user as u ";
sql += "on b.uno = u.uno ";
sql += "where bkind = '" + kind + "' "; //구분에 따른 전체 갯수
sql += "order by bno desc ";
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
						<td><a href="view.jsp?kind=<%= kind %>&no=<%= bno %>"><%= btitle %></a></td>
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
		◀ 1 2 3 4 5 6 7 8 9  ▶
		</td>
	</tr>												
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>