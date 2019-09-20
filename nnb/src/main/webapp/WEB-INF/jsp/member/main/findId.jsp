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
	<p align="center"><img src="/nnb/images/NNBsmall.png" width="100px"></p>
	<h1 class="csAEhT">아이디 찾기</h1>
<form id="frm" method="post" action="/nnb/findIdResult">
	<input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="이름을 입력하세요" class="kEQJNp kTQnUD "><br><br>
	
	<input type="radio" id="findIdByPhone" name="findIdBy" value="phone">휴대전화로 찾기<br>
	<input type="text" id="MEM_PHONE" name="MEM_PHONE" placeholder="휴대폰번호를 입력하세요" class="kEQJNp kTQnUD "><br><br>
	<input type="radio" id="findIdByEmail" name="findIdBy" value="email">이메일로 찾기<br>
	<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="이메일을 입력하세요" class="kEQJNp kTQnUD "><br>
</form>
<div class="ewSpjL2">
	<a href="#" class="btn" onclick="fsubmit();">찾기</a>
	<a href="#" class="btn" onclick="javascript:window.close();">취소</a>
</div>
</div>
</div>
</body>
</html>