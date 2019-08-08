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
$(document).ready(function(){
	$("#submit").on("click",function(e){
		e.preventDefault();
		frm_submit();
	});
});

function frm_submit(){
	var conSubmit = new ConSubmit(frm);
	conSubmit.setUrl("<c:url value='/myPage/registMyProfile'/>");
	conSubmit.submit();
};

function validation(){
	var gender = document.getElementById("gender").value;
	if(gender==null || gender==""){
		alert("������ �Է��ϼ���.");
		$("#gender").focus();
		return false;
	}
	var birth_ymd = document.getElementById("birth_ymd").value;
	if(birth_ymd==null || birth_ymd==""){
		alert("������ �Է��ϼ���.");
		$("#birth_ymd").focus();
		return false;
	}
	var date_start = document.getElementById("date_start").value;
	if(date_start==null || date_start==""){
		alert("���ֳ�¥�� �����ϼ���.");
		$("#date_start").focus();
		return false;
	}
	frm.submit();
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myProfileForm">
<div class="title">�����Ʈ ���� ���</div>

<form id="frm" name="frm" action="registmyProfile" method="post">
<div class="h">����</div>
<div class="b">
	<input type="radio" name="gender" value="M">��
	<input type="radio" name="gender" value="F">��
</div>
<div class="h">�δ㰡�ɱݾ�</div>
<div class="b">
	������: <input type="number" name="loan_big" id="loan_big">����<br>
	����: <input type="number" name="loan_small" id="loan_small">����
</div>
<div class="h">��ȣ����</div>
<div class="b">
	���� API ����ؼ� ���� �����ϰ� �߰� ������ 3������ �ڵ����� �߰��ǵ���?
</div>
<div class="h">�������</div>
<div class="b">
<input type="date" id="birth_ymd" name="birth_ymd">
</div>
<!--  
<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:formatDate value="${now}" var="currentYear" pattern="yyyy" /> <br>
	<select id="birth_year" name="birth_year">
		<c:forEach var="i" begin="2000" end="1900">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>��
	<select id="birth_month" name="birth_month">
		<c:forEach var="i" begin="1" end="12">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>��
	<select id="birth_date" name="birth_date">
		<c:forEach var="i" begin="1" end="31">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>��
</div>
-->
<div class="h">���ֽñ�</div>
<div class="b">
	<input type="date" id="date_start" name="date_start"> ~ 
	<input type="date" id="date_end" name="date_end">
</div>
<div class="h">�ڱ�Ұ�</div>
<div class="b"><textarea></textarea></div>

<a href="#" id="submit" class="btn">���</a>
<a href="<c:url value='/myPage/myProfile'/>" id="cancle" class="btn">���</a>
</form>
</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
