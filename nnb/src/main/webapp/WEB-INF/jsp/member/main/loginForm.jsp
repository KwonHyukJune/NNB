<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<script type="text/javascript">
/* 
로그인
취소
 */
</script>
</head>
<body>

<div class="login">
LOGIN
<form id="loginForm">
<input type="text" id="id" name="id" placeholder="아이디 입력"><br>
<input type="password" id="password" name="password" placeholder="비밀번호 입력">
</form>
	<a href="#" class="btn" onclick="">로그인</a>
	<a href="#" class="btn" onclick="back();">취소</a><br>
<a href="<c:url value='/findId'/>">아이디 찾기</a>
<a href="<c:url value='/findpw'/>">비밀번호 찾기</a>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>