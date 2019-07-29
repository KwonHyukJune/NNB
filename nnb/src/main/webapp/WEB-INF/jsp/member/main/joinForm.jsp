<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
/* 
폼 입력 확인
아이디, 닉네임 중복확인
이메일 value
인증번호 확인
동의합니다 확인
제출
취소
 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="join">
<img src="NINAEBANG">
<form id="joinForm">
	<input type="text" id="id" name="id" placeholder="아이디">
	<br>
	<input type="password" id="password" name="password" placeholder="비밀번호">
	<br>
	<input type="password" id="password2" placeholder="비밀번호 확인">
	<br>
	<input type="text" id="name" name="name" placeholder="이름">
	<br>
	<input type="text" id="nickname" name="nickname" placeholder="닉네임">
	<br>
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
	<p>휴대폰 인증</p>
	<select id="phone1" name="phone1">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>
	</select>
	<input type="number" id="phone2" name="phone2">
	<input type="number" id="phone3" name="phone3">
	<button type="button" onclick="">인증번호 전송</button>
	<br>
	<input type="text" id="phoneId" placeholder="인증번호 입력">
	<button type="button" onclick="">인증번호 확인</button>
	<br>
	<div class="terms">
	<iframe src=""></iframe>
	</div>
	<input type="checkbox">동의합니다.<br>
	<input type="radio" id="normal" name="type" value="normal">일반회원
	<input type="radio" id="lessor" name="type" value="lessor">임대회원
</form>

	<a href="#" class="btn" onclick="">회원가입</a>
	<a href="#" class="btn" onclick="back();">취소</a>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>