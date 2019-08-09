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
    var url = "/nnb/admin/messageWriteForm"
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

</head>

<br/><br/><br/>

<body>


<div><h1>회원 정보</h1></div>
<br/>
<hr>
<br/><br/><br/>

   <div class="adminMemberDetail">      

		
		<p>번호 :
		 ${memberDetail.MEM_NUM} &nbsp; 
		 </p> 
		<p>아이디 :
		 ${memberDetail.MEM_ID} &nbsp;     
		</p>
		<p>이름 :
		 ${memberDetail.MEM_NAME} &nbsp;     
		</p>
		<p>이메일 : 
         ${memberDetail.MEM_EMAIL}&nbsp;
      	</p>
      	<p>연락처  :      	
         ${memberDetail.MEM_PHONE}&nbsp;
         </p>
    </div>
    <div id="adminMemberBanDetail">
	    제제내역
    	<c:forEach var="memberDetails" items="${memberDetails}">
	  <div>${memberDetails.RNUM}. 제재 사유 : ${memberDetails.BAN_REASON}</div>
	  <div>제재 날짜 : ${memberDetails.BAN_REMOVAL_DATE}</div>
	
	     
    	</c:forEach>
     </div>
     <br/><br/><br/>
      <div><h1>추가 정보</h1></div>
		<br/>
		<hr>
		<br/><br/><br/>
<c:choose>
<c:when test='${memberDetail.MEM_KIND eq "임차"}'>
<div class="임차">      
		<b>임차회원</b>
		<br/><br/>
		<p>닉네임 :
			${memberDetail.MEM_NICK} &nbsp;     
		</p>	
		<p>이름 :
			${memberDetail.MEM_NAME} &nbsp;     
		</p>	
		<p>성별 :
		 	${memberDetail.RI_GENDER} &nbsp;     
		</p>	
		<p>생일 : 
         	${memberDetail.RI_BIRTH}&nbsp;
      	</p>
      	<p>연락처 : 
         	${memberDetail.MEM_PHONE}&nbsp;
      	</p>
      	<p>E-mail: 
         	${memberDetail.MEM_EMAIL}&nbsp;
      	</p>
        <p>가입일  :      	
        	 ${memberDetail.MEM_JOINDATE}&nbsp;
        </p>     
      	<p>자기소개  :      	
        	 ${memberDetail.RI_PROFILE}&nbsp;
        </p>
</div>
</c:when>
<c:when test='${memberDetail.MEM_KIND eq "임대"}'>

<div class="임대">      
		<b>임대회원</b>
		<br/><br/>
		<p>닉네임 :
			${memberDetail.MEM_NICK} &nbsp;     
		</p>	
		<p>이름 :
			${memberDetail.MEM_NAME} &nbsp;     
		</p>	
		<p>성별 :
		 	${memberDetail.RI_GENDER} &nbsp;     
		</p>	
		<p>생일 : 
         	${memberDetail.RI_BIRTH}&nbsp;
      	</p>
      	<p>연락처 : 
         	${memberDetail.MEM_PHONE}&nbsp;
      	</p>
      	<p>E-mail: 
         	${memberDetail.MEM_EMAIL}&nbsp;
      	</p>
        <p>가입일  :      	
        	 ${memberDetail.MEM_JOINDATE}&nbsp;
        </p>     
      	<p>자기소개  :      	
        	 ${memberDetail.RI_PROFILE}&nbsp;
        </p>
      
</div> 
</c:when>
</c:choose>      


      
<br/><br/><br/> 

  	
<form action="/admin/memberDelete" method="post" id="frm" name="frm">   

<br/><br/>
	<input type="hidden" id="BAN_NUM" name="BAN_NUM" value="${memberDetail.BAN_NUM}">
	<input type="hidden" id="MEM_ID" name="MEM_ID" value="${memberDetail.MEM_ID}">
	<input type="hidden" id="MEM_NAME" name="MEM_NAME" value="${memberDetail.MEM_NAME}"> 
	<input type="hidden" id="MEM_PHONE" name="MEM_PHONE" value="${memberDetail.MEM_PHONE}"> 
	<input type="hidden" name="MEM_NUM" value="${memberDetail.MEM_NUM}">

	  	<select id="BAN_REMOVAL_DATE" name="BAN_REMOVAL_DATE">
	     	<option value="1">1일</option>
	     	<option value="3">3일</option>
	     	<option value="7">7일</option>
	     	<option value="30">30일</option>
	     </select> &nbsp;&nbsp;
	     <select id="BAN_REASON" name="BAN_REASON">
	     	<option value="허위광고">허위광고</option>
	     	<option value="욕설">욕설</option>
	     	<option value="불쾌한 아이디">불쾌한 아이디</option>
	     	<option value="4">4</option>
	     </select> &nbsp;&nbsp;
		
		  	<a href="#" onClick="javascript:showPopup1()">메시지 보내기</a> &nbsp;&nbsp;
			
		   	<a href="#" id="submit">확인</a> &nbsp;&nbsp;  
		    <a href="javascript:frameclose()">닫기</a>
		   	
</form>
   

<br>
</body>
</html>