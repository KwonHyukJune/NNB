<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
/* 	$("input[name='findIdBy']").change(function(){
		$(this).siblings("div").hide();
		$(this).next().next().show();
	}); */
	$("#email").change(function(){
		$("#email2").val($(this).val());
	});
});
function fsubmit(){
	var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
	var email = $("#email1").val()+"@"+$("#email2").val();
	$("#MEM_PHONE").val(phone);
	$("#MEM_EMAIL").val(email);
/* 	var gsWin = window.open("about:blank","winName");
	frm.target = "winName"; */
	frm.submit();
}
</script>
</head>
<body>
<div class="findId">
<form id="frm" method="post" action="findIdResult">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>아이디 찾기</h1>
	<input type="text" name="MEM_NAME" id="MEM_NAME" placeholder="이름"><br>
	<input type="hidden" id="MEM_PHONE" name="MEM_PHONE">
	<input type="radio" id="findIdByPhone" name="findIdBy" value="phone">휴대전화로 찾기<br>
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
	<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
	<input type="radio" id="findIdByEmail" name="findIdBy" value="email">이메일로 찾기<br>
	<div class="findIdByEmail">
		<input type="text" id="email1" name="email1" placeholder="이메일">
		@
		<input type="text" id="email2" name="email2" value="">
		<select id="email">
		<option value="">직접입력</option>
		<option>naver.com</option>
		<option>hanmail.net</option>
		<option>gmail.com</option>
		<option>nate.com</option>
		</select>
	</div>
</form>
	<a href="#" class="btn" onclick="fsubmit();">찾기</a>
	<a href="#" class="btn" onclick="fclose();">취소</a>
</div>

</body>
</html>