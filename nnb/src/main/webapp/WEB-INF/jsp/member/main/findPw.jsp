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
다음
취소
닫기
 */
</script>
</head>
<body>

<div class="findpw" style="display: block">
<form action="join/findPwConfirm" method="post" id="frm">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>비밀번호 찾기</h1>
	<input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디"><br>
	<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
	<input type="text" id="email1" name="email1" placeholder="이메일">
	@
	<input type="text" id="email2" name="email2" value="">
	<select id="email">
	<option>직접입력</option>
	<option>naver.com</option>
	<option>hanmail.net</option>
	<option>gmail.com</option>
	<option>nate.com</option>
	</select>
	<br>
</form>
	<a href="#" class="btn" onclick="fsubmit();">다음</a>
	<a href="#" class="btn" onclick="close();">취소</a>
</div>

</body>
</html>