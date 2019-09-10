<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminReportRL.css'/>"/>

<script type="text/javascript">

function frameclose(){
	window.close();
}
</script>

</head>

<br/>

<body>


<div style="text-align: center;"><h2>상세보기</h2></div>
<br/>
<hr>
<br/><br/>

<div class="selectNoticeist">


		<div class="noticeList">
		   
		   <div class="notice">      
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
			      		<p>아이디 </p>     	
			        	<p>&nbsp;  <a href="<c:url value='/admin/memberDetail?MEM_NUM=${memberDetail.MEM_NUM}&MEM_ID=${map.REPORT_D_ID}'/>">${map.REPORT_D_ID}&nbsp;</a></p>
			         </li>
			         <li class="lig5">
			         	<p>제 목</p>     	
			         	<p>&nbsp; ${map.REPORT_TITLE}&nbsp;</p>
			         </li>
			         <li class="lig6">
			         	<p>내 용</p>
						<p>&nbsp; ${map.REPORT_REASON}</p>    
			         </li>	
				<br/>
				<br/>
					          
		      </ul>
		    <br/><br/><hr><br/> 
		    <div style="text-align: center;">		  
		    <a class="rlDtl2" href="javascript:frameclose()" id="submit">확인</a>    
			</div>
   		</div>	
	</div>
</div>


</body>
</html>