<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminReport.css'/>"/>

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
		if(confirm("광고상태를 변경하시겠습니까?")){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/report/roomStatus'/>");
			comSubmit.submit();
		}
	}
});
function openPopup(url) {

	window.open(url,"name","width = 700, height = 700, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes");
}
</script>

</head>

<br/><br/><br/>

<body>


<div class="jtRefx">
	<h2 class="kuldyr">상세보기</h2>
</div>
<br/>
<div class="eugBve">		
	<form action="insertBan" method="post" id="frm" name="contents">   
	<input type='hidden' name='ROOM_NUM' value='${map.REPORT_POST_NUM}'/>  
	<input type='hidden' name='num' value='${map.REPORT_NUM}'/>  
	<ul class="hIJwlj">
		<li>
			<p class="efvxco">신고자</p>
			<p class="efvxco">${map.REPORT_ID}</p>
		</li>
		<li>
			<p class="efvxco">번호</p>
			<p class="efvxco">${map.REPORT_NUM}</p>
		</li>
		<li>
			<p class="efvxco">신고유형</p> 
		    <p class="efvxco">
		    	<c:if test="${map.REPORT_TYPE==1}">
		    	거래가 완료된 매물
		    	</c:if>
		    	<c:if test="${map.REPORT_TYPE==2}">
		    	정보가 다른 매물
		    	</c:if>
		    </p>
		</li>
		<li>
			<p class="efvxco">날짜</p>   	
		    <p class="efvxco">${map.REGDATE}</p>
		</li>
		<li>
			<p class="efvxco">신고당한 회원 아이디</p>     	
		    <p class="efvxco">${map.REPORT_D_ID}</p>
		</li>
		<li>
			<p class="efvxco">매물 번호</p>    			        	
		    <p class="efvxco"><a href = "javascript:openPopup('/nnb/room/roomDetail?ROOM_NUM=${map.REPORT_POST_NUM}')">${map.REPORT_POST_NUM}</a></p> 
		</li>
		<li>
			<p class="efvxco">내용</p>
			<p class="efvxco">${map.REPORT_REASON}</p>    
		</li>
		<li>
			<p class="efvxco">처리</p>
			<select class="hRFrgm freEbZ" id="TRADE_STATUS" name="TRADE_STATUS">
	     		<option value="광고종료">광고종료</option>
			</select>
		</li>		
	 </ul>
	 <br><br>
	<div align="center">
	   	<button class="iEZQG" id="submit">확인</button>
		<button class="kcMULl" onClick="javascript:frameclose()">닫기</button>
	</div>
	</form>
   		</div>	
<br><hr><br><br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>