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
	<h1 class="csAEhT">���̵� ã��</h1>
<form id="frm" method="post" action="/nnb/findIdResult">
	<input type="text" id="MEM_NAME" name="MEM_NAME" placeholder="�̸��� �Է��ϼ���" class="kEQJNp kTQnUD "><br><br>
	
	<input type="radio" id="findIdByPhone" name="findIdBy" value="phone">�޴���ȭ�� ã��<br>
	<input type="text" id="MEM_PHONE" name="MEM_PHONE" placeholder="�޴�����ȣ�� �Է��ϼ���" class="kEQJNp kTQnUD "><br><br>
	<input type="radio" id="findIdByEmail" name="findIdBy" value="email">�̸��Ϸ� ã��<br>
	<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="�̸����� �Է��ϼ���" class="kEQJNp kTQnUD "><br>
</form>
<div class="ewSpjL2">
	<a href="#" class="btn" onclick="fsubmit();">ã��</a>
	<a href="#" class="btn" onclick="javascript:window.close();">���</a>
</div>
</div>
</div>
</body>
</html>