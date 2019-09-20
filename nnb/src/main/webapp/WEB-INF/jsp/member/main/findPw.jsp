<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
<script type="text/javascript">	
function fsubmit(){
	frm.submit();
}
</script>
</head>
<body>

<div class="loginForm eaRvjJ">
	<div class='flwTzf'>
	<p align="center"><img src="/nnb/images/NNBsmall.png" width="100px"/><p>
	<br>
	<h1 class="csAEhT">비밀번호 찾기</h1>
<form action="/nnb/findPwConfirm" method="post" id="frm">
	<input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디를 입력하세요" class="kEQJNp kTQnUD "><br>
	<br>
	<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="이메일을 입력하세요" class="kEQJNp kTQnUD "><br>
</form>
<div class="ewSpjL2">
	<a href="#" class="styled__FindPassword-jsiei0-6 ewSpjL" onclick="fsubmit();">다음</a>
	&nbsp;
	<a href="#" class="styled__FindPassword-jsiei0-6 ewSpjL" onclick="javascript:window.close();">취소</a>
</div>
</div>
</div>

</body>
</html>