<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<div>
	<h2>도서 자료 등록</h2>
	<form class="writeform" name="write" method="post" action="writeok.jsp">
		<p>
			<span>도서명</span><input name="bookname" type="text" required>
		</p>
		<p>
			<span>출판사</span><input name="company" type="text">
		</p>
		<p>
			<span>저&nbsp;&nbsp;&nbsp;자</span><input name=author type="text">
		</p>
		<p>
			<span>가&nbsp;&nbsp;&nbsp;격</span><input name="price" type="text">원
		</p>
		<p>
			<span>권&nbsp;&nbsp;&nbsp;수</span><input name="count" type="text">권
		</p>
		<p>
			<span>분&nbsp;&nbsp;&nbsp;류</span>
			<input type="radio" name="category" checked> 인문학
			<input type="radio" name="category"> 사회학
			<input type="radio" name="category"> 전기전자
			<input type="radio" name="category"> 역사
			<input type="radio" name="category"> 정치/경제
		</p>
		<p>
			<span>서&nbsp;&nbsp;&nbsp;평</span>
			<textarea name="review"></textarea>
		</p>
		<p>
			<span>이미지</span><input name="file" type="file">
		</p>
		<div class="btnWrap">
			<input class="btn" type="submit" value="등록완료">
			<a class="btn" href="index.jsp">취소</a>
		</div>
	</form>
</div>
<%@ include file="footer.jsp" %>