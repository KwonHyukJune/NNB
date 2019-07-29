<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 상세보기</title>
<head>
<%@ include file="/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 

</script>

</head>

<br/><br/><br/>

<body>


<h1><div>약관보기</div></h1>
<br/>
<hr>
<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> message1 = new HashMap<String,Object>();
	message1.put("MESSAGE_NUM","1");
	message1.put("MEM_KIND","임대");
	message1.put("RECEIVER","ID4");
	message1.put("MESSAGE_TITLE","보세요 보시라구요~");
	message1.put("MESSAGE_CONTENT","보세요 보시라구요~!!!!!!!!!!");
	message1.put("SEND_DATE","2019-07-31");
		   
   
   List<Map<String,Object>> messageList = new ArrayList<Map<String,Object>>();
   messageList.add(message1);
 
   
 
   request.setAttribute("message",message1);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectMessageList">


<div class="MessageList">
   
   <div class="Message">      
	<ul>
		<li>번호 
		 ${message.MESSAGE_NUM} &nbsp;     
		</li>	
		<li>대상	  
         ${message.MEM_KIND}&nbsp;
      	</li>
      	<li>날짜  :&nbsp;      	
         ${message.SEND_DATE}&nbsp;
         </li>
         <li>제목  :&nbsp;      	
         ${message.MESSAGE_TITLE}&nbsp;
         </li>
         <li>내용  :&nbsp;
		${message.MESSAGE_CONTENT}    
         </li>	
          
      </ul>
    <br/><br/><br/> 
      <a href="javascript:frameclose()">닫기</a>

  
   </div>	
 
</div>

</div>
<br>
</body>
</html>