<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
	var check = 0;
	function modifyHP(){
		$("#modifybt").hide();
		$("#identifybt").show();
		$(".identify").show();
		check = 1;
	};
	$(document).ready(function(){
		$("#submit").on("click",function(e){
			e.preventDefault();
			fn_submit();
		});
	});
	function fn_submit(){
		var conSubmit = new ComSubmit(frm);
		conSubmit.setUrl("<c:url value='/myPage/myPageModify'/>");
		conSubmit.submit();
	};
	/*
	휴대폰인증 스크립트 -> identify()
	번호 바꿨으면 인증 완료해달라는 스크립트 -> validation()
	닉네임 중복확인
	*/
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageInfoForm">

	<form id="frm" name="frm">
	<div>이름</div>
		<input type="text" id="name" name="name" value="${name}">
	<div>비밀번호</div>
		<input type="password" id="password" name="password">
	<div>닉네임</div>
		<input type="text" id="nickname" name="nickname" value="${nickname}">
		<a href="checknick()">중복확인</a>
	<div>이메일</div>
		<input type="text" id="email1" name="email1" value="${email1}">
		@
		<input type="text" id="email2" name="email2" value="${email2}">
		<select id="email">
			<option>직접입력</option>
			<option>naver.com</option>
			<option>hanmail.net</option>
			<option>gmail.com</option>
			<option>nate.com</option>
		</select>
	<div>연락처</div>
		<div>
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
			<button type="button" onclick="modifyHP()" id="modifybt" style="display:block;">변경</button>
			<button type="button" onclick="idenfity()" id="identifybt" style="display:none;">인증번호 전송</button>
		</div>
		<div class="identify" style="display:none;">
			<input type="text" id="phoneId" placeholder="인증번호 입력">
			<button type="button" onclick="">인증번호 확인</button>
		</div>
		
	</form>
	<div>
	<a href="#" id="submit" class="btn" onclick="validation()">확인</a>
	<a href="<c:url value='/myPage/myPageInfo'/>" id="cancle" class="btn">취소</a>
	</div>
	<div><a href="<c:url value='/myPage/myPageDeleteComfirm'/>">회원탈퇴</a></div>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
