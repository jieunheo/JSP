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
			<a href="write.jsp">글쓰기</a>
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
				for (int i=1; i<=10; i++)
				{
					%>
					<tr>
						<td style="text-align:center;"><%= i %></td>
						<td><a href="view.jsp">자바 기초 문법 <%= i %> 강의 입니다.</a> <span style="color:#ff6600">(12)</span></td>
						<td style="text-align:center;">2021.11.10</td>
						<td style="text-align:center;">홍길동</td>
						<td style="text-align:center;">10</td>
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