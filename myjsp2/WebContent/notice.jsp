<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<div class="main">
	<div class="notice">
		<h3>공지사항</h3>	
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
				for(int i=1; i<=10; i++)
				{
					%>
					<tr>
						<td><%= i %></td>
						<td><a href="#">공지사항 (<%= i %>)</a></td>
						<td>2021.11.1<%= i-1 %></td>
						<td>홍선생</td>
					</tr>
					<%
				}
				%>
			</tbody>
		</table>
		<div class="paging">
			<ul>
				<li><a href="#">◀</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#" class="now">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">▶</a></li>
			</ul>
		</div>
		<%
		if (login != null && login.getUserLevel().equals("A"))
		{
			%>
			<a class="btn" href="write.jsp">글쓰기</a>
			<%
		}
		%>
	</div>
</div>


<%@ include file="footer.jsp" %>