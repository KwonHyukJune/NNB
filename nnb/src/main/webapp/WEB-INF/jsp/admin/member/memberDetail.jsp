<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<title>방 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
function showPopup1(){
    var url = "/nnb/admin/messageWriteForm?id="+"${memberDetail.MEM_ID}";
    var name = "메시지 작성";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
    window.open(url, name, option);
}
function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 

$(document).ready(function(){
	
	$("#submit").on("click", function(e){ //확인 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/memberDelete'/>");
		comSubmit.submit();
	}
});
</script>
<style type="text/css">
.box{
    margin: 50px;
}
.h{
    border-bottom: 1px solid rgb(200 200 200);
    text-align: center;
    padding-bottom: 20px;
    margin: 20px 0;
}
ul>li{
	height: 40px;
	line-height: 40px;
}
ul>li>p:nth-child(1){
	float: left;
	width: 20%;
}
ul>li>p:nth-child(2), ul>li>div:nth-child(2){
	float: left;
	width: 80%;
}
ul>li:last-child, ul>li>div:last-child{
	margin-bottom:20px;
}
.hRFrgm {
    height: 46px;
    color: rgb(68, 68, 68);
    font-size: 15px;
    box-sizing: border-box;
    -webkit-appearance: none;
    padding: 0px 15px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(208, 210, 214);
    border-image: initial;
    border-radius: 0px;
    background: url(/nnb/media/arrow.svg) right 15px center / 10px no-repeat rgb(255, 255, 255);
    outline: none;
}
a {
    display: inline-block;
    color: rgb(34, 34, 34);
    font-size: 15px;
    line-height: 27px;
    position: relative;
    cursor: pointer;
    padding: 5px 0px;
    margin-left: 20px;
}
a:hover {
    color: rgb(21, 100, 249);
}
</style>
</head>

<body>
<div class="box">
<div class="h"><h1>회원 정보</h1></div>

	<div class="adminMemberDetail">
		<ul>
			<li>
				<p>번호</p>
				<p>${memberDetail.MEM_NUM}</p>
			</li>
			<li>
				<p>아이디</p>
				<p>${memberDetail.MEM_ID}</p>
			</li>
			<li>
				<p>이름</p>
				<p>${memberDetail.MEM_NAME}</p>
			</li>
			<li>
				<p>이메일</p>
				<p>${memberDetail.MEM_EMAIL}</p>
			</li>
			<li>
				<p>연락처</p>
				<p>${memberDetail.MEM_PHONE}</p>
			</li>
			<li>
				<p>제제내역</p>
				<div>
					<c:forEach var="memberDetails" items="${memberDetails}">
					<p>${memberDetails.RNUM}. ${memberDetails.BAN_REASON} (${memberDetails.BAN_REMOVAL_DATE})</p>
					</c:forEach>
				</div>
			</li>
		</ul>
	</div>
	<hr>
	<div class="h"><h1>추가 정보</h1></div>
<c:choose>
<c:when test='${memberDetail.MEM_KIND eq "normal"}'>
	<div class="임차">
		<ul>
			<li>
				<p>회원종류</p>
				<p>임차회원</p>
			</li>
			<li>
				<p>닉네임</p>
				<p>${memberDetail.MEM_NICK}</p>
			</li>
			<li>
				<p>이름</p>
				<p>${memberDetail.MEM_NAME}</p>
			</li>
			<li>
				<p>성별</p>
				<p>
					<c:if test="${memberDetail.RI_GENDER=='F'}">
					여자
					</c:if>
					<c:if test="${memberDetail.RI_GENDER=='M'}">
					남자
					</c:if>
				</p>
			</li>
			<li>
				<p>생일</p>
				<p>${memberDetail.RI_BIRTH}</p>
			</li>
			<li>
				<p>연락처</p>
				<p>${memberDetail.MEM_PHONE}</p>
			</li>
			<li>
				<p>이메일</p>
				<p>${memberDetail.MEM_EMAIL}</p>
			</li>
			<li>
				<p>가입일</p>
				<p>${memberDetail.MEM_JOINDATE}</p>
			</li>
			<li>
				<p>자기소개</p>
				<p>${memberDetail.RI_PROFILE}</p>
			</li>
		</ul>
	</div>
</c:when>
<c:when test='${memberDetail.MEM_KIND eq "lessor"}'>

<div class="임대">      
	<ul>
		<li>
			<p>회원종류</p>
			<p>임대회원</p>
		</li>
		<li>
			<p>닉네임</p>
			<p>${memberDetail.MEM_NICK}</p>
		</li>
		<li>
			<p>방 정보</p>
			<div>
<%-- 				<c:forEach var="memberDetails" items="${memberDetails}">
				<p>${memberDetails.RNUM}. ${memberDetails.BAN_REASON} (${memberDetails.BAN_REMOVAL_DATE})</p>
				</c:forEach> --%>
			</div>
		</li>
	</ul>
</div> 
</c:when>
</c:choose>      
<div>
<form action="/admin/memberDelete" method="post" id="frm" name="frm">   

	<input type="hidden" id="BAN_NUM" name="BAN_NUM" value="${memberDetail.BAN_NUM}">
	<input type="hidden" id="MEM_ID" name="MEM_ID" value="${memberDetail.MEM_ID}">
	<input type="hidden" id="MEM_NAME" name="MEM_NAME" value="${memberDetail.MEM_NAME}"> 
	<input type="hidden" id="MEM_PHONE" name="MEM_PHONE" value="${memberDetail.MEM_PHONE}"> 
	<input type="hidden" name="MEM_NUM" value="${memberDetail.MEM_NUM}">

	  	<select id="BAN_REMOVAL_DATE" name="BAN_REMOVAL_DATE" class="hRFrgm" style="width:100px;">
	     	<option value="1">1일</option>
	     	<option value="3">3일</option>
	     	<option value="7">7일</option>
	     	<option value="30">30일</option>
	     </select>
	     <select id="BAN_REASON" name="BAN_REASON" class="hRFrgm">
	     	<option value="허위광고">허위광고</option>
	     	<option value="욕설">욕설</option>
	     	<option value="불쾌한 아이디">불쾌한 아이디</option>
	     	<option value="4">4</option>
	     </select>
		
		  	<a href="#" onClick="javascript:showPopup1()">메시지 보내기</a> &nbsp;&nbsp;
			
		   	<a href="#" id="submit">확인</a> &nbsp;&nbsp;  
		    <a href="javascript:frameclose()">닫기</a>
		   	
</form>
</div>
</div>
</body>
</html>