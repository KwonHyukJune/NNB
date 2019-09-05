<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">

var mem = sessionStorage.getItem("${RECEIVER}");
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
	conSubmit.setUrl("<c:url value='/roommate/detail/messageWrite'/>");
	conSubmit.submit();
};

/* function fn_confirm(){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/myPage/messageWriteForm'/>");
	comAjax.addParam("MEM",mem);
	comAjax.ajax();
} */
function validation(){
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
</head>
<body>

<div class="subtitle">메시지 작성</div>

<div class="messageWriteForm">
<form id="frm" name="frm" action="messageWrite" method="post">
	<ul>
	<li>
		<div class="left">수신인</div>
		<div class="right"><input name="RECEIVER" id="mem" value="${param.RECEIVER}" ></div>
	</li>
	
	<li>
		<div class="left">제목</div>
		<div class="right"><input type="text" name="MESSAGE_TITLE" id="title"></div>
	</li>
	<li>
		<div class="left">내용</div>
		<div class="right"><textarea name="MESSAGE_CONTENT" id="content"></textarea></div>
	</li>
	<li>
		<a href="#" id="submit" class="btn" onclick="validation()">보내기</a>
		<a href="<c:url value='/myPage/messageList'/>" id="cancle" class="btn">취소</a>
	</li>
	</ul>
</form>
</div>

<br>
<div>
</div>
</body>
</html>
