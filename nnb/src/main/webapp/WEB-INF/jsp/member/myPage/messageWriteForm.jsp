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
		fn_submit();
	});
});

function fn_submit(){
	var conSubmit = new ComSubmit(frm);
	conSubmit.setUrl("<c:url value='/myPage/messageWrite'/>");
	conSubmit.addParam("SENDER","${MEM_ID}");
	conSubmit.submit();
};

/* function fn_confirm(){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/myPage/messageWriteForm'/>");
	comAjax.addParam("MEM",mem);
	comAjax.ajax();
} */
function validation(){
	var mem = document.getElementById("mem").value;
	if(mem==null || mem==""){
		alert("�������� �Է��ϼ���.");
		$("#mem").focus();
		return false;
	}
	var title = document.getElementById("title").value;
	if(title==null || title==""){
		alert("������ �Է��ϼ���.");
		$("#title").focus();
		return false;
	}
	var content = document.getElementById("content").value;
	if(content==null || content==""){
		alert("������ �Է��ϼ���.");
		$("#content").focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="subtitle">�޽��� �ۼ�</div>

<div class="messageWriteForm">
<form id="frm" name="frm">
	<ul>
	<li>
		<div class="left">������</div>
		<div class="right"><input type="text" name="mem" id="mem" value="${message.RECEIVER}"></div>
	</li>
	<li>
		<div class="left">����</div>
		<div class="right"><input type="text" name="title" id="title"></div>
	</li>
	<li>
		<div class="left">����</div>
		<div class="right"><textarea name="content" id="content"></textarea></div>
	</li>
	<li>
		<a href="#" id="submit" class="btn" onclick="validation()">������</a>
		<a href="<c:url value='/myPage/messageWrite'/>" id="cancle" class="btn">���</a>
	</li>
	</ul>
</form>
</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
