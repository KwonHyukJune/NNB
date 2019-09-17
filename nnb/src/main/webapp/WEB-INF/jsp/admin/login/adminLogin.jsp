<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 메인 페이지</title>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
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
<br><br>
<div class="loginForm eaRvjJ">
	<div class='flwTzf'>
		<h1 class="csAEhT">관리자 로그인</h1>
		<form id="loginForm" name="loginForm" action="/nnb/adminLogin" method="POST">
			<input type="text" id="ADMIN_ID" name="ADMIN_ID" placeholder="아이디 입력" class="kEQJNp kTQnUD "><br>
			<input type="password" id="ADMIN_PW" name="ADMIN_PW" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}" class="kTQnUD bLigTE">
		</form>
		<br>
			<button class="hgemcD" type="button" onclick="fsubmit();">로그인</button>
	</div>
</div>
<br><br><br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
