<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
		$("#email").change(function(){
			$("#email2").val($(this).val());
		});
	});
function fsubmit(){
	var email = $("#email1").val()+"@"+$("#email2").val();
	$("#MEM_EMAIL").val(email);
	frm.submit();
}
/* 
����
���
�ݱ�
 */
</script>
</head>
<body>

<div class="findpw" style="display: block">
<form action="join/findPwConfirm" method="post" id="frm">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>��й�ȣ ã��</h1>
	<input type="text" id="MEM_ID" name="MEM_ID" placeholder="���̵�"><br>
	<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
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
</form>
	<a href="#" class="btn" onclick="fsubmit();">����</a>
	<a href="#" class="btn" onclick="close();">���</a>
</div>

</body>
</html>