<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 자바학습 게시판</span>
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
				Statement stmt = conn.createStatement();
				
				String sql = "";
				sql += "select u.uname,u.uno,bno,btitle,date_format(bwdate,'%Y.%m.%d') as bwdate,bhit ";
				sql += "from board as b ";
				sql += "inner join user as u ";
				sql += "on b.uno = u.uno ";
				sql += "order by bno desc ";
				
				ResultSet result = stmt.executeQuery(sql);
				while (result.next() == true)
				{
					String bno    = result.getString("bno");
					String btitle = result.getString("btitle");
					String bwdate = result.getString("bwdate");
					String bhit   = result.getString("bhit");
					String uname  = result.getString("uname");
					%>
					<tr>
						<td style="text-align:center;"><%= bno %></td>
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
		◀ 1 2 3 4 5 6 7 8 9  ▶
		</td>
	</tr>												
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>