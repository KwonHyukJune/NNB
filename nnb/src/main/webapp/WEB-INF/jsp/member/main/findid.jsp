<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
�̸��� value
ã��
���
 */
</script>
</head>
<body>

<div class="findId">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>���̵� ã��</h1>
	<input type="radio" id="findIdByPhone" class="findIdBy">�޴���ȭ�� ã��<br>
	<div class="findIdByPhone">
		<select id="phone1" name="phone1">
		<option>010</option>
		<option>011</option>
		<option>016</option>
		<option>017</option>
		<option>018</option>
		<option>019</option>
		</select>
		<input type="number" id="phone2" name="phone2">
		<input type="number" id="phone3" name="phone3">
	</div>
	<input type="radio" id="findIdByEmail" class="findIdBy">�̸��Ϸ� ã��<br>
	<div>
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
	</div>
	<a href="#" class="btn" onclick="">ã��</a>
	<a href="#" class="btn" onclick="close();">���</a>
</div>

</body>
</html>