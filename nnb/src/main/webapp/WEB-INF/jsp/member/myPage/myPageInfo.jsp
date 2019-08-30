<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<style>
.myifl > p:first-child{
	float: left;
	width: 120px;
	text-align: center;
	background-color: #e6e6ec;
	box-shadow: inset 0px -2px white;
	color: black;
	font-weight: bold;
}
.myifl > p:nth-child(2){
	text-align: center;
    box-shadow: 0px -2px #e6e6ec;
}
.myifl > p:nth-child(3){
	float: left;
	width: 120px;
	text-align: center;
	background-color: #e6e6ec;
	box-shadow: inset 0px -2px white;
	color: black;
	font-weight: bold;
}
.myifl > p:nth-child(4){
	text-align: center;
    box-shadow: 0px -2px #e6e6ec;
}
.myifl > p:nth-child(5){
	float: left;
	width: 120px;
	text-align: center;
	background-color: #e6e6ec;
	box-shadow: inset 0px -2px white;
	color: black;
	font-weight: bold;
}
.myifl > p:nth-child(6){
	text-align: center;
    box-shadow: 0px -2px #e6e6ec;
	
}
.myifl > p:nth-child(7){
	float: left;
	width: 120px;
	text-align: center;
	background-color: #e6e6ec;
	box-shadow: inset 0px -2px #e6e6ec;
	color: black;
	font-weight: bold;
}
.myifl > p:nth-child(8){
	text-align: center;
    box-shadow: 0px -2px #e6e6ec;	
}
.myifl > p:nth-child(9){
	text-align: center;
    box-shadow: 0px -2px #e6e6ec;
    height: 20px;
}
.myifl > p:nth-child(10){
	text-align: center;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#amyPage').addClass('active');
}); 
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<div class="myPageInfo1">
<%@ include file="myPage.jspf" %>

	<div class="myPageInfo">
		<div class="myifl">

				<p>이름</p>
				<p>${map.MEM_NAME}</p>
				<p>닉네임</p>
				<p>${map.MEM_NICK}</p>
				<p>이메일</p>
				<p>${map.MEM_EMAIL}</p>
				<p>연락처</p>
				<p>${map.MEM_PHONE}</p>				
				<p>		</p>
				<p><a class="adminbtn" href="<c:url value='/myPage/modifyForm'/>" class="btn">수정</a></p>
					
		</div>
	</div>
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
