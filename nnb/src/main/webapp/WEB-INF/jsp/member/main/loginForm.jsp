<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
<script type="text/javascript">
function fsubmit(){
	var id = $("#MEM_ID")[0].value;
	var pw = $("#MEM_PW")[0].value;
	if(id==null || id==''){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(pw==null || pw==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if($(".Checkbox__CheckboxStd-ifp1yz-1").is(":checked")){
		var id = $("#MEM_ID").val();
		document.cookie = "storedId="+id;
		document.cookie = "idStore=true";
	}else{
		document.cookie = "storedId=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
		document.cookie = "idStore=; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
	}
	var cookie = document.cookie.match('(^|;) ?'+'storedId'+'=([^;]*)(;|$)');
	loginForm.submit();
}
$(document).ready(function(){
	if("${MEM_ID}"!=null && "${MEM_ID}"!=''){
		$("#MEM_ID")[0].value = "${MEM_ID}";
	}
	var cookie = document.cookie.match('(^|;) ?'+'storedId'+'=([^;]*)(;|$)');
	var store = document.cookie.match('(^|;) ?'+'idStore'+'=([^;]*)(;|$)');
	if(cookie){
		$('#MEM_ID').val(cookie[2]);
	}
	if(store){ 
		$('.Checkbox__CheckboxStd-ifp1yz-1')[0].checked=true;
	}
});
</script>
</head>
<body>

<div class="loginForm eaRvjJ">
	<div class='flwTzf'>
		<h1 class="csAEhT">로그인</h1>
		<form id="loginForm" action="login" method="POST">
		<input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디 입력" class="kEQJNp kTQnUD "><br>
		<input type="password" id="MEM_PW" name="MEM_PW" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}" class="kTQnUD bLigTE">
		<div class="styled__CheckWrap-jsiei0-4 kqUpLp">
			<label class="clearfix Checkbox__Label-ifp1yz-0 kAqGVi" size="22">
				<input type="checkbox" class="Checkbox__CheckboxStd-ifp1yz-1 PcMeW" name="isSaved" value="">
				<span class="CheckBox"></span>
				<p class="styled__CheckText-jsiei0-5 etlPzr">아이디 저장</p>
			</label>
		</div>
		</form>
			<button class="hgemcD" type="button" onclick="fsubmit();">로그인</button>
			<div class="ewSpjL2">
				<a class="styled__FindPassword-jsiei0-6 ewSpjL" href="<c:url value='/findId'/>" target="javascript:window.open();">아이디 찾기</a>
				<span> | </span>
				<a class="styled__FindPassword-jsiei0-6 ewSpjL" href="<c:url value='/findPw'/>" target="javascript:window.open();">비밀번호 찾기</a>
			</div>
	</div>
</div>

<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>