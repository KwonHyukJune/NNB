<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<script type="text/javascript">
/* 
�α���
���
 */
</script>
</head>
<body>

<div class="login">
LOGIN
<form id="loginForm">
<input type="text" id="id" name="id" placeholder="���̵� �Է�"><br>
<input type="password" id="password" name="password" placeholder="��й�ȣ �Է�">
</form>
	<a href="#" class="btn" onclick="">�α���</a>
	<a href="#" class="btn" onclick="back();">���</a><br>
<a href="<c:url value='/findId'/>">���̵� ã��</a>
<a href="<c:url value='/findpw'/>">��й�ȣ ã��</a>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>