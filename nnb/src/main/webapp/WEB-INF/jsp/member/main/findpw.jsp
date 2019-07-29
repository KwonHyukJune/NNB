<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
다음
취소
닫기
 */
</script>
</head>
<body>

<div class="findpw" style="display: block">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>비밀번호 찾기</h1>
	<input type="text" id="id" name="id" placeholder="아이디"><br>
	<input type="text" id="email1" name="email1" placeholder="이메일">
	@
	<input type="text" id="email2" name="email2" value="">
	<select id="email">
	<option>직접입력</option>
	<option>naver.com</option>
	<option>hanmail.net</option>
	<option>gmail.com</option>
	<option>nate.com</option>
	</select>
	<br>
	<a href="#" class="btn" onclick="">다음</a>
	<a href="#" class="btn" onclick="close();">취소</a>
</div>

</body>
</html>