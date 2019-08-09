<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function goPage1(num) {   // 목록으로
	location.href="/nnb/admin/messageList?MEMSSAGE_NUM="+${map.MESSAGE_NUM}; 
	}	
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>메시지 보기</h1></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectMessageList">


<div class="MessageList">
   
   <div class="Message">      
	<ul>
		<li>번호 
		 ${map.MESSAGE_NUM} &nbsp;     
		</li>	
		<li>대상	  
         ${map.MEM_KIND}&nbsp;
      	</li>
      	<li>날짜  :&nbsp;      	
         ${map.SEND_DATE}&nbsp;
         </li>
         <li>제목  :&nbsp;      	
         ${map.MESSAGE_TITLE}&nbsp;
         </li>
         <li>내용  :&nbsp;
		${map.MESSAGE_CONTENT}    
         </li>	
          
      </ul>
    <br/><br/><br/> 
    <a href="#" onClick="goPage1(${map.MESSAGE_NUM})">목록으로</a>

  
   </div>	
 
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>