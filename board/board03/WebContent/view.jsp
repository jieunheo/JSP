<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 글보기</span>
		</td>
	</tr>
</table>
<table border="" style="width:100%;">
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">제목</td>
		<td>자바 기초 문법에 대한 강의 입니다.</td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">작성자</td>
		<td>홍길동</td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">작성일</td>
		<td>2021.11.10</td>
	</tr>
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">조회수</td>
		<td>10회</td>
	</tr>
	<tr>
		<td colspan="2">	
			자바 기초 문법에 대한 강의 입니다.<br>
			자바 기초 문법에 대한 강의 입니다.<br>
			자바 기초 문법에 대한 강의 입니다.
		</td>
	</tr>	
	<tr>
		<td style="background-color:#f4f4f4; width:120px;">첨부파일</td>
		<td>test.hwp</td>
	</tr>	
	<tr>
		<td colspan="2" align="center" style="height:40px;">
		<a href="index.jsp">글목록</a>&nbsp;|&nbsp;
		<a href="modify.jsp">글수정</a>&nbsp;|&nbsp;
		<a href="delete.jsp">글삭제</a>
		</td>
	</tr>																													
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>