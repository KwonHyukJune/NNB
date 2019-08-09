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
		         <li>    	
		         <a href="<c:url value='/admin/memberDetail?MEM_NUM=${memberDetail.MEM_NUM}&MEM_ID=${map.REPORT_D_ID}'/>">아이디  :  ${map.REPORT_D_ID}&nbsp;</a>
		         </li>
		         <li>제목  :     	
		         ${map.REPORT_TITLE}&nbsp;
		         </li>
		         <li>내용  :
				${map.REPORT_REASON}    
		         </li>	
		          
		      </ul>
		    <br/><br/><br/> 
		    		  
		    <a href="#" id="submit">확인</a>    

   		</div>	
	</div>
</div>
<br><hr><br><br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>