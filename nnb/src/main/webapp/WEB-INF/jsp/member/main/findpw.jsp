<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
����
���
�ݱ�
 */
</script>
</head>
<body>

<div class="findpw" style="display: block">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>��й�ȣ ã��</h1>
	<input type="text" id="id" name="id" placeholder="���̵�"><br>
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
	<a href="#" class="btn" onclick="">����</a>
	<a href="#" class="btn" onclick="close();">���</a>
</div>

</body>
</html>