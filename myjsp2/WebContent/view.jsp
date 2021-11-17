<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%@ page import="ezen.getDate"%>
<%
getDate now = new getDate();
String today = now.getToday();
%>

<div class="main">
	<div class="center view">
		<h3>글쓰기</h3>
		<form name="write" method="post" action="modify.jsp">
			<p><span>제목</span> 공지사항입니다.</p>
			<p><span>작성일</span> 2021.11.16</p>
			<p><span>작성자</span> 홍선생</p>
			<p><span>내용</span>
				<div class="contents">홈페이지 내에 수정하는 부분이 많습니다.<br>
이용이 어려운 화면은 문의 부탁드립니다.				
				</div>
			</p>
			<a class="btn" href="index.jsp">뒤로가기</a>
			<input class="btn" type="submit" value="글수정">
		</form>
	</div>
</div>


<%@ include file="footer.jsp" %>