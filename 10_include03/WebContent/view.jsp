<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<div>
	<h2>도서 조회</h2>
	<div class="viewform">
		<p>
			<span>도서명</span>이것이 자바다
		</p>
		<p class="bookimg">
		</p>
		<p>
			<span>출판사</span>생능출판사
		</p>
		<p>
			<span>저&nbsp;&nbsp;&nbsp;자</span>홍선생
		</p>
		<p>
			<span>가&nbsp;&nbsp;&nbsp;격</span>43,000원
		</p>
		<p>
			<span>권&nbsp;&nbsp;&nbsp;수</span>21권
		</p>
		<p>
			<span>분&nbsp;&nbsp;&nbsp;류</span>인문학
		</p>
		<p>
			<span>서&nbsp;&nbsp;&nbsp;평</span>
			<div class="textarea">
				짱 좋아요~~<br>
				정말 유익해요~~
			</div>
		</p>
		<div class="btnWrap">
			<a class="btn" href="modify.jsp">정보 수정</a>
			<a class="btn" href="delete.jsp">정보 삭제</a>
			<a class="btn" href="index.jsp">취소</a>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>