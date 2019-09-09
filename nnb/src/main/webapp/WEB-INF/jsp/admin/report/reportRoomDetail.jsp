<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminReportRL.css'/>"/>

<script type="text/javascript">

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
		comSubmit.setUrl("<c:url value='/room/tradeStatus'/>");
		comSubmit.submit();
	}
});



function openPopup(url) {

	window.open(url,"name","width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes");
}
</script>

</head>

<br/>

<body>


<div style="text-align: center;"><h2>상세보기</h2></div>
<br/>
<hr>
<br/><br/>

<div class="selectReportRoomDetail">


		<div class="reportRoomList">
		   
		   <div class="report">      
			<ul>
				<li style="text-align: center; color: red; font-weight: bold">
				${map.REPORT_ID}님이 신고하셨습니다.				
				</li>
				<br/><br/>
				<div class="liG">
					<li class="lig1">
						<p>번 호</p>
					 	<p>&nbsp; ${map.REPORT_NUM} &nbsp;</p>     
					</li>
					<li class="lig2">
						<p>신고유형 </p>
			         	<p>&nbsp; ${map.REPORT_TYPE}&nbsp;</p>
			      	</li>
			      	<li class="lig3">
			      		<p>날 짜 </p>     	
			        	<p>&nbsp; ${map.REPORT_DATE}&nbsp;</p>
			         </li>
			         <li class="lig4">
			         	<p>아이디</p>     	
			         	<p>&nbsp; ${map.REPORT_D_ID}&nbsp;</p>
			         </li>
			         <li class="lig5">			        	
			         	<p>매물번호 </p> 
			         	<p><a class="rllink" href = javascript:openPopup("/nnb/admin/memberList")>&nbsp; ${map.REPORT_POST_NUM}&nbsp;</a></p> 
			         </li>
			         <li class="lig6">
			         	<p>제 목</p>     	
			         	<p>&nbsp; ${map.REPORT_TITLE}&nbsp;</p>
			         </li>
			         <li class="lig7">
			         	<p>내 용</p>
						<p>&nbsp; ${map.REPORT_REASON}</p>    
			         </li>	
		       	 </div>   
		      </ul>
		    <br/><br/><hr><br>
		    
	<form class="bttb" action="insertBan" method="post" id="frm" name="contents">     
		<select id="BAN_REMOVAL_DATE" name="BAN_REMOVAL_DATE">
	     	<option value="1">광고종료</option>
	     	<option value="2">거래완료</option>
	     	<option value="3">삭제처리</option>
	     </select> &nbsp;&nbsp;		 
	      
	   	<a class="rlDtl2" href="#" id="submit">확인</a> &nbsp;&nbsp;  
		<a class="rlDtl2" href="javascript:frameclose()">닫기</a>
	</form>
   		</div>	
	</div>
</div>


</body>
</html>