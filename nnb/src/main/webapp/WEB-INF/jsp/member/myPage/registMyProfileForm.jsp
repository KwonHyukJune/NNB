<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit").on("click",function(e){
		e.preventDefault();
		fn_submit();
	});
});

function fn_submit(){
	var conSubmit = new ComSubmit(frm);
	conSubmit.setUrl("<c:url value='/myPage/registMyProfile'/>");
	conSubmit.submit();
};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myProfileForm">
<div class="title">룸메이트 정보 등록</div>

<form id="frm" name="frm">
<div class="h">성별</div>
<div class="b">
	<input type="radio" name="gender" value="M">남
	<input type="radio" name="gender" value="F">여
</div>
<div class="h">부담가능금액</div>
<div class="b">
	보증금: <input type="number" name="loan_big" id="loan_big">만원<br>
	월세: <input type="number" name="loan_small" id="loan_small">만원
</div>
<div class="h">선호지역</div>
<div class="b">
	지도 API 사용해서 지역 선택하고 추가 누르면 3개까지 자동으로 추가되도록?
</div>
<div class="h">생년월일</div>
<div class="b">
	<c:set var="nowTime" value="<%=new Date() %>"/>
	<fmt:formatDate value="${nowTime}" type="date" var="currentYear" pattern="yyyy"/>
	<select id="birth_year" name="birth_year">
		<c:forEach var="i" begin="1900" end="${currentYear}">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>년
	<select id="birth_month" name="birth_month">
		<c:forEach var="i" begin="1" end="12">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>월
	<select id="birth_date" name="birth_date">
		<c:forEach var="i" begin="1" end="31">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>일
</div>
<div class="h">입주시기</div>
<div class="b">
	<input type="date" id="date_start" name="date_start"> ~ 
	<input type="date" id="date_end" name="date_end">
</div>
<div class="h">자기소개</div>
<div class="b"><textarea></textarea></div>
</form>

<a href="#" id="submit" class="btn">등록</a>
<a href="<c:url value='/myPage/myProfile'/>">취소</a>

</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
