<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<div>
	<h2>���� �ڷ� ���</h2>
	<form class="writeform" name="write" method="post" action="writeok.jsp">
		<p>
			<span>������</span><input name="bookname" type="text" required>
		</p>
		<p>
			<span>���ǻ�</span><input name="company" type="text">
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span><input name=author type="text">
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span><input name="price" type="text">��
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span><input name="count" type="text">��
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span>
			<input type="radio" name="category" checked> �ι���
			<input type="radio" name="category"> ��ȸ��
			<input type="radio" name="category"> ��������
			<input type="radio" name="category"> ����
			<input type="radio" name="category"> ��ġ/����
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span>
			<textarea name="review"></textarea>
		</p>
		<p>
			<span>�̹���</span><input name="file" type="file">
		</p>
		<div class="btnWrap">
			<input class="btn" type="submit" value="��ϿϷ�">
			<a class="btn" href="index.jsp">���</a>
		</div>
	</form>
</div>
<%@ include file="footer.jsp" %>