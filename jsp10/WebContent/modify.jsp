<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<div>
	<h2>���� �ڷ� ���</h2>
	<form class="writeform" name="write" method="post" action="modifyok.jsp">
		<p>
			<span>������</span><input name="bookname" type="text" required value="�̰��� �ڹٴ�">
		</p>
		<p>
			<span>���ǻ�</span><input name="company" type="text" value="�������ǻ�">
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span><input name="author" type="text" value="ȫ����">
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span><input name="price" type="text" value="43,000">��
		</p>
		<p>
			<span>��&nbsp;&nbsp;&nbsp;��</span><input name="count" type="text" value="21">��
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
			<textarea name="review">¯ ���ƿ�~~
���� �����ؿ�~~</textarea>
		</p>
		<p>
			<span>�̹���</span><input name="file" type="file">
		</p>
		<div class="btnWrap">
			<input class="btn" type="submit" value="�����Ϸ�">
			<a class="btn" href="view.jsp">���</a>
		</div>
	</form>
</div>
<%@ include file="footer.jsp" %>