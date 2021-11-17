<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%@ page import="ezen.getDate"%>

<div class="main">
	<div class="modify">
		<h3>글쓰기</h3>
		<form name="modify" method="post" action="modifyok.jsp">
			<p><span>제목(*)</span> <input type="text" name="title" value="공지사항입니다." required></p>
			<p><span>작성일</span> <input type="text" name="date" value="2021.11.16" readonly></p>
			<p><span>작성자</span> 홍선생</p>
			<p><span>내용</span>
				<textarea name="contents">홈페이지 내에 수정하는 부분이 많습니다.
이용이 어려운 화면은 문의 부탁드립니다.				
				</textarea>
			</p>
			<a class="btn" href="view.jsp">뒤로가기</a>
			<input class="btn" type="submit" value="글수정">
		</form>
	</div>
</div>


<%@ include file="footer.jsp" %>