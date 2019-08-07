<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 메인 페이지</title>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
</head>

<script>

function goPage1() {   // 새 약관 등록
	location.href="/nnb/adminLogin"
	}	
function fsubmit(){
	var id = $("#ADMIN_ID")[0].value;
	var pw = $("#ADMIN_PW")[0].value;
	if(id==null || id==''){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(pw==null || pw==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	loginForm.submit();
}
$(document).ready(function(){
	if("${ADMIN_ID}"!=null && "${ADMIN_ID}"!=''){
		$("#ADMIN_ID")[0].value = "${ADMIN_ID}";
	}
});
</script>
<br/>

<body>

<div class="loginForm">
관리자 로그인
<form id="loginForm" name="loginForm" action="/nnb/adminLogin" method="POST">
<input type="text" id="ADMIN_ID" name="ADMIN_ID" placeholder="아이디 입력"><br>
<input type="password" id="ADMIN_PW" name="ADMIN_PW" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}">
</form>
<br/>
	<a href="#" class="btn" onclick="fsubmit();">로그인</a>
	<a href="javascript:back()">취소</a>
	
</div>

<br/><br/><br/><br/><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
