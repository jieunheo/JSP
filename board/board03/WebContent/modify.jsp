<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="width:100%;">
	<tr>
		<td style="height:40px">
			<span style="font-weight:bold; color:red;">※ 글수정</span>
		</td>
	</tr>
</table>		
<form name="login" method="post" action="writeok.jsp">
	<table border="0" style="width:100%; margin:0px 0px 0px 0px;padding:0px 0px 0px 0px ; border: 1px;">
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">제목</td>
			<td><input type="text" name="title" style="width:95%" value="자바 기초 문법에 대한 강의 입니다."></td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">구분</td>
			<td>
				<input type="radio" name="subject" checked>자바 학습 게시판
				<input type="radio" name="subject">HTML 학습 게시판
			</td>
		</tr>						
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">내용</td>
			<td>
				<textarea name="contents" style="width:95%; height:200px;">자바 기초 문법에 대한 강의 입니다.
자바 기초 문법에 대한 강의 입니다.
자바 기초 문법에 대한 강의 입니다.
자바 기초 문법에 대한 강의 입니다.
자바 기초 문법에 대한 강의 입니다.
자바 기초 문법에 대한 강의 입니다.
				</textarea>
			</td>
		</tr>
		<tr>
			<td style="width:120px; text-align:center; background-color:#f4f4f4">첨부파일</td>
			<td><input name="attach" type="file" style="width:95%"></td>
		</tr>
		<tr>
			<td colspan="2" style="height:1px;background-color:#cccccc"></td>
		</tr>
		<tr>
			<td style="text-align:center;" colspan="2">
				<input type="submit" value="글수정 완료">
				<a href="view.jsp">글수정 취소</a>
			</td>
		</tr>
	</table>					
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="./include/footer.jsp" %>