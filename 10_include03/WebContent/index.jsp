<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<div>
	<div class="maintop clearfix">
		<form action="index.jsp" class="search" name="search" method="post">
			������ <input name="bookname" type="text">
			<input class="btn" type="submit" value="�˻�">
		</form>
		<a class="btn bookwrite" href="write.jsp">�������</a>
	</div>
	<table>
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>������</th>
				<th>����</th>
				<th>���� �� ��</th>
			</tr>
		</thead>
		<tbody>
		<% 
			for (int i=1; i<=10; i++)
			{
			%>
			<tr>
				<td><%= i %></td>
				<td><a href="view.jsp">�̰��� �ڹٴ�</td>
				<td>ȫ����</td>
				<td>21</td>
			</tr>
			<% 
			}
		%>
		</tbody>
	</table>
	<ul class="list">
		<li><a href="#">��</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#" class="now">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">6</a></li>
		<li><a href="#">7</a></li>
		<li><a href="#">8</a></li>
		<li><a href="#">9</a></li>
		<li><a href="#">10</a></li>
		<li><a href="#">��</a></li>
	</ul>
</div>
<%@ include file="footer.jsp" %>