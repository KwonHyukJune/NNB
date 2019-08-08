<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
	var memId = sessionStorage.getItem("MEM_ID");
	$(document).ready(function(){
		$("#submit").on("click",function(e){
			e.preventDefault();
			fn_submit();
		});
		$("#delete").on("click",function(e){
			e.preventDefault();
			fn_delete();
		});
	});
	
	function fn_submit(){
		var conSubmit = new ComSubmit("frm");
		conSubmit.setUrl("<c:url value='/myPage/myProfileModify'/>");
		conSubmit.submit();
	};
	function fn_delete(){
		var conSubmit = new ComSubmit("frm");
		conSubmit.setUrl("<c:url value='/myPage/myProfileDelete'/>");
		conSubmit.addParam("MEM_ID",memId);
		conSubmit.submit();
	};
	/*
	빈공간으 ㄴ안된다고 유효성
	*/
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myProfileModifyForm">
<div class="title">룸메이트 정보 등록</div>
<form id="frm" name="frm">
<div class="h">성별</div>
<div class="b">
	<input type="radio" name="gender" id="male" value="M">남
	<input type="radio" name="gender" id="female" value="F">여
</div>
<div class="h">부담가능금액</div>
<div class="b">
	보증금: <input type="text" name="loan_big" id="loan_big">만원<br>
	월세: <input type="text" name="loan_small" id="loan_small">만원
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
		<option value="${i}" id="${i}">${i}</option>
		</c:forEach>
	</select>년
	<select id="birth_month" name="birth_month">
		<c:forEach var="i" begin="1" end="12">
		<option value="${i}" id="${i}">${i}</option>
		</c:forEach>
	</select>월
	<select id="birth_date" name="birth_date">
		<c:forEach var="i" begin="1" end="31">
		<option value="${i}" id="${i}">${i}</option>
		</c:forEach>
	</select>일
</div>
<div class="h">입주시기</div>
<div class="b">
	<input type="date" id="date_start" name="date_start"> ~ 
	<input type="date" id="date_end" name="date_end">
</div>
<div class="h">자기소개</div>
<div class="b"><textarea id="profile" name="profile"></textarea></div>
<div class="h">검색허용</div>
<div class="b">
	<input type="radio" name="expose" id="Y">가능
	<input type="radio" name="expose" id="N">불가능
</div>
</form>

<a href="#" id="submit" class="btn">등록</a>
<a href="#" id="delete" class="btn">삭제</a>
<a href="<c:url value='/myPage/myProfile'/>" class="btn">취소</a>

</div>
<br>

<script type="text/javascript">
/* 헤드에 써도 되나? */
window.onload = function(){

	if(${map.RI_GENDER=="M"}){
		$("#male").prop("checked",true);
		else if(${map.RI_GENDER=="F"}; {
		$("#female").prop("checked",true);
	};
	
	if(${map.RI_LOAN_BIG!=null || map.RI_LOAN_BIG!=""}){
		$("#loan_big").prop("value","${map.RI_LOAN_BIG}");
	};
	
	if(${map.RI_LOAN_SMALL!=null || map.RI_LOAN_SMALL!=""}){
		$("#loan_small").prop("value","${map.RI_LOAN_SMALL}");
	};
	
	var b_year = "${map.RI_BIRTH}".slice(0,4);
	if("${map.RI_BIRTH}".slice(4,5)==0){
		var b_month = "${map.RI_BIRTH}".slice(5,6);
	}else{
		var b_month = "${map.RI_BIRTH}".slice(4,6);
	};
	
	if("${map.RI_BIRTH}".slice(6,7)==0){
		var b_date = "${map.RI_BIRTH}".slice(7,8);
	}else{
		var b_date = "${map.RI_BIRTH}".slice(6,8);
	};
	if(${map.RI_BIRTH!=null || map.RI_BIRTH!=""}){
		document.querySelector('#birth_year').value = b_year;
		document.querySelector('#birth_month').value = b_month;
		document.querySelector('#birth_date').value = b_date;
	};
	if(${map.RI_DATE_START!=null || map.RI_DATE_START!=""}){
		document.querySelector('#date_start').value = "${map.RI_DATE_START}";
	};
	if(${map.RI_DATE_END!=null || map.RI_DATE_END!=""}){
		document.querySelector('#date_end').value = "${map.RI_DATE_END}";
	};
	if(${map.RI_PROFILE!=null || map.RI_PROFILE!=""}){
		$("#profile").prop("value","${map.RI_PROFILE}");
	};
	if(${map.RI_EXPOSE=="Y"}){
		$("#Y").prop("checked",true);
	}else if(${map.RI_EXPOSE=="N"}){
		$("#N").prop("checked",true);
	};
};
</script>

<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
