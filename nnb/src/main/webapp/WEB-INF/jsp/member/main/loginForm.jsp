<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<script type="text/javascript">
function fsubmit(){
	var id = $("#MEM_ID")[0].value;
	var pw = $("#MEM_PW")[0].value;
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
	if("${MEM_ID}"!=null && "${MEM_ID}"!=''){
		$("#MEM_ID")[0].value = "${MEM_ID}";
	}
});
</script>
</head>
<body>

<div class="loginForm">
LOGIN
<form id="loginForm" action="login" method="POST">
<input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디 입력"><br>
<input type="password" id="MEM_PW" name="MEM_PW" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}">
</form>
	<a href="#" class="btn" onclick="fsubmit();">로그인</a>
	<a href="#" class="btn" onclick="back();">취소</a><br>
<a href="<c:url value='/findId'/>" target="javascript:window.open();">아이디 찾기</a>
<a href="<c:url value='/findPw'/>" target="javascript:window.open();">비밀번호 찾기</a>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>