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
function goPage1(num) {   
	location.href="/nnb/admin/report/list?num="+num; 
	}

$(document).ready(function(){
	
	$("#submit").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/ban' />");
		comSubmit.submit();
	}
});
</script>

</head>

<br/><br/><br/>

<body>


<div><h2>상세보기</h2></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectNoticeist">


		<div class="noticeList">
		   
		   <div class="notice">      
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
		         <li>제목  :     	
		         ${map.REPORT_TITLE}&nbsp;
		         </li>
		         <li>내용  :
				${map.REPORT_REASON}    
		         </li>	
		          
		      </ul>
		    <br/><br/><br/> 
		   <form action="insertBan" method="post" id="frm" name="contents">     
		    <select id="BAN_DATE" name="BAN_DATE">
		     	<option value="1">1일</option>
		     	<option value="3">3일</option>
		     	<option value="7">7일</option>
		     	<option value="30">30일</option>
		     </select>
		  
		    <a href="#" id="submit">확인</a>    
		    <a href="#" onClick="goPage1(${map.REPORT_NUM})">목록으로</a>
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