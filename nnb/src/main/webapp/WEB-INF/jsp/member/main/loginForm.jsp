<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<script type="text/javascript">
function submit(){
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
<input type="password" id="MEM_PW" name="MEM_PW" placeholder="비밀번호 입력">
</form>
	<a href="#" class="btn" onclick="submit();">로그인</a>
	<a href="#" class="btn" onclick="back();">취소</a><br>
<a href="<c:url value='/findId'/>">아이디 찾기</a>
<a href="<c:url value='/findpw'/>">비밀번호 찾기</a>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>