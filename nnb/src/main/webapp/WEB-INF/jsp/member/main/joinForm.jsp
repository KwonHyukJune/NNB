<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
�� �Է� Ȯ��
���̵�, �г��� �ߺ�Ȯ��
�̸��� value
������ȣ Ȯ��
�����մϴ� Ȯ��
����
���
 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="join">
<img src="NINAEBANG">
<form id="joinForm">
	<input type="text" id="id" name="id" placeholder="���̵�">
	<br>
	<input type="password" id="password" name="password" placeholder="��й�ȣ">
	<br>
	<input type="password" id="password2" placeholder="��й�ȣ Ȯ��">
	<br>
	<input type="text" id="name" name="name" placeholder="�̸�">
	<br>
	<input type="text" id="nickname" name="nickname" placeholder="�г���">
	<br>
	<input type="text" id="email1" name="email1" placeholder="�̸���">
	@
	<input type="text" id="email2" name="email2" value="">
	<select id="email">
	<option>�����Է�</option>
	<option>naver.com</option>
	<option>hanmail.net</option>
	<option>gmail.com</option>
	<option>nate.com</option>
	</select>
	<br>
	<p>�޴��� ����</p>
	<select id="phone1" name="phone1">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>
	</select>
	<input type="number" id="phone2" name="phone2">
	<input type="number" id="phone3" name="phone3">
	<button type="button" onclick="">������ȣ ����</button>
	<br>
	<input type="text" id="phoneId" placeholder="������ȣ �Է�">
	<button type="button" onclick="">������ȣ Ȯ��</button>
	<br>
	<div class="terms">
	<iframe src=""></iframe>
	</div>
	<input type="checkbox">�����մϴ�.<br>
	<input type="radio" id="normal" name="type" value="normal">�Ϲ�ȸ��
	<input type="radio" id="lessor" name="type" value="lessor">�Ӵ�ȸ��
</form>

	<a href="#" class="btn" onclick="">ȸ������</a>
	<a href="#" class="btn" onclick="back();">���</a>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>