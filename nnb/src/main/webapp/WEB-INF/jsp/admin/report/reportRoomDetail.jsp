<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

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

<br/><br/><br/>

<body>


<div><h2>상세보기</h2></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectReportRoomDetail">


		<div class="reportRoomList">
		   
		   <div class="report">      
			<ul>
				<li>
				${map.REPORT_ID}님이 신고하셨습니다.
				</li>
				<br/>
				<li>번호 :
				 ${map.REPORT_NUM} &nbsp;     
				</li>
				<li>신고유형 :
		         ${map.REPORT_TYPE}&nbsp;
		      	</li>
		      	<li>날짜  :     	
		         ${map.REPORT_DATE}&nbsp;
		         </li>
		         <li>아이디  :     	
		         ${map.REPORT_D_ID}&nbsp;
		         </li>
		         <li>    			        	
		         <a href = javascript:openPopup("/nnb/admin/memberList")>매물번호  : ${map.REPORT_POST_NUM}&nbsp;</a> 
		         </li>
		         <li>제목  :     	
		         ${map.REPORT_TITLE}&nbsp;
		         </li>
		         <li>내용  :
				${map.REPORT_REASON}    
		         </li>	
		          
		      </ul>
		    <br/><br/><br/> 
		    
	<form action="insertBan" method="post" id="frm" name="contents">     
		<select id="BAN_REMOVAL_DATE" name="BAN_REMOVAL_DATE">
	     	<option value="1">광고종료</option>
	     	<option value="2">거래완료</option>
	     	<option value="3">삭제처리</option>
	     </select> &nbsp;&nbsp;		 
	      
	   	<a href="#" id="submit">확인</a> &nbsp;&nbsp;  
		<a href="javascript:frameclose()">닫기</a>
	</form>
   		</div>	
	</div>
</div>
<br><hr><br><br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>