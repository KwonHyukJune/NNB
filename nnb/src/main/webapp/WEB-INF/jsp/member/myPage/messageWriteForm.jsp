<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	$(document).ready(function(){
		$('#amessage').addClass('active');
	}); 
});

function fn_submit(){
	var conSubmit = new ComSubmit(frm);
	conSubmit.setUrl("<c:url value='/myPage/messageWrite'/>");
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
		alert("수신인을 입력하세요.");
		$("#mem").focus();
		return false;
	}
	var title = document.getElementById("title").value;
	if(title==null || title==""){
		alert("제목을 입력하세요.");
		$("#title").focus();
		return false;
	}
	var content = document.getElementById("content").value;
	if(content==null || content==""){
		alert("내용을 입력하세요.");
		$("#content").focus();
		return false;
	}
	frm.submit();
}
</script>
<style>
.bddd{
	width: 600px;
	height: 500px;
	    background-image: url(/nnb/css/msgbg4.png); no-repeat;
	
</style>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>



<div class="messageWriteForm">

<div class="bddd">
<div style="padding: 5px 50px 5px 50px; text-align:center" class="subtitle">메시지 작성</div>
<form id="frm" style="margin-bottom: 60px;" name="frm" action="messageWrite" method="post">
	<ul>
	<li style="padding: 5px 50px 5px 50px;">
		<div class="left">수신인</div>
		<div class="right"><input type="text" style="background-color:#fffdfd57; border: 1px solid rgb(34, 34, 34);" name="RECEIVER" id="mem" value="${RECEIVER}"></div>
	</li>
	<li style="padding: 5px 50px 5px 50px;">
		<div class="left">제목</div>
		<div class="right"><input type="text" style="background-color:#fffdfd57; border: 1px solid rgb(34, 34, 34);" name="MESSAGE_TITLE" id="title"></div>
	</li>
	<li style="padding: 5px 50px 0px 50px;">
		<div class="left">내용</div>
		<div class="right"><textarea style="width:480px; background-color:#fffdfd57; border: 1px solid rgb(34, 34, 34); height: 290px; "name="MESSAGE_CONTENT" id="content"></textarea></div>
	</li>
	</ul>
	
	
</form>
<div style="padding: 0px 50px 5px 50px; text-align:center">
		<a href="#" id="submit" class="adminbtn1" onclick="validation()">보내기</a>
		<a class="adminbtn1" href="<c:url value='/myPage/messageList'/>" id="cancle" >취소</a>
	</div>
</div>
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
