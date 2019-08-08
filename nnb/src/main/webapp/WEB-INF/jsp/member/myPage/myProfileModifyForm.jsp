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
	������� ���ȵȴٰ� ��ȿ��
	*/
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myProfileModifyForm">
<div class="title">�����Ʈ ���� ���</div>
<form id="frm" name="frm">
<div class="h">����</div>
<div class="b">
	<input type="radio" name="gender" id="male" value="M">��
	<input type="radio" name="gender" id="female" value="F">��
</div>
<div class="h">�δ㰡�ɱݾ�</div>
<div class="b">
	������: <input type="text" name="loan_big" id="loan_big">����<br>
	����: <input type="text" name="loan_small" id="loan_small">����
</div>
<div class="h">��ȣ����</div>
<div class="b">
	���� API ����ؼ� ���� �����ϰ� �߰� ������ 3������ �ڵ����� �߰��ǵ���?
</div>
<div class="h">�������</div>
<div class="b">
	<c:set var="nowTime" value="<%=new Date() %>"/>
	<fmt:formatDate value="${nowTime}" type="date" var="currentYear" pattern="yyyy"/>
	<select id="birth_year" name="birth_year">
		<c:forEach var="i" begin="1900" end="${currentYear}">
		<option value="${i}" id="${i}">${i}</option>
		</c:forEach>
	</select>��
	<select id="birth_month" name="birth_month">
		<c:forEach var="i" begin="1" end="12">
		<option value="${i}" id="${i}">${i}</option>
		</c:forEach>
	</select>��
	<select id="birth_date" name="birth_date">
		<c:forEach var="i" begin="1" end="31">
		<option value="${i}" id="${i}">${i}</option>
		</c:forEach>
	</select>��
</div>
<div class="h">���ֽñ�</div>
<div class="b">
	<input type="date" id="date_start" name="date_start"> ~ 
	<input type="date" id="date_end" name="date_end">
</div>
<div class="h">�ڱ�Ұ�</div>
<div class="b"><textarea id="profile" name="profile"></textarea></div>
<div class="h">�˻����</div>
<div class="b">
	<input type="radio" name="expose" id="Y">����
	<input type="radio" name="expose" id="N">�Ұ���
</div>
</form>

<a href="#" id="submit" class="btn">���</a>
<a href="#" id="delete" class="btn">����</a>
<a href="<c:url value='/myPage/myProfile'/>" class="btn">���</a>

</div>
<br>

<script type="text/javascript">
/* ��忡 �ᵵ �ǳ�? */
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
