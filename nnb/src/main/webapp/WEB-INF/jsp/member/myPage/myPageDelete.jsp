<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
 	var id = sessionStorage.getItem("MEM_ID");
	$("#submit").on("click",function(e){
		e.preventDefault();
		fn_submit(id);
	});
});
function fn_submit(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myPage/myPageDelete'/>");
	comSubmit.addParam("MEM_ID",id);
	comSubmit.submit();
};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageDelete">

<div class="subtitle">È¸¿øÅ»Åð</div>
<div>
ºñ¹Ð¹øÈ£ È®ÀÎ
<form>
<input type="password" id="password" name="password">
</form>
</div>
<a href="#" class="btn" id="submit">Å»ÅðÇÏ±â</a>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
