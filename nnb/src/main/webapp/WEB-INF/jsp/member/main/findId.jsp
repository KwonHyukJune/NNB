<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
이메일 value
찾기
취소
 */
</script>
</head>
<body>

<div class="findId">
	<img src="/nnb/images/NNBsmall.png" width="300px"><br>
	<h1>아이디 찾기</h1>
	<input type="radio" id="findIdByPhone" class="findIdBy">휴대전화로 찾기<br>
	<div class="findIdByPhone">
		<select id="phone1" name="phone1">
		<option>010</option>
		<option>011</option>
		<option>016</option>
		<option>017</option>
		<option>018</option>
		<option>019</option>
		</select>
		<input type="number" id="phone2" name="phone2">
		<input type="number" id="phone3" name="phone3">
	</div>
	<input type="radio" id="findIdByEmail" class="findIdBy">이메일로 찾기<br>
	<div>
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
	</div>
	<a href="#" class="btn" onclick="">찾기</a>
	<a href="#" class="btn" onclick="close();">취소</a>
</div>

</body>
</html>