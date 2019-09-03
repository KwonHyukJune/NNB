<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminMessage.css'/>"/>
<style>
.MsgBox > p:first-child{
	float:left;
	width:25%;
	height:60px;
	line-height: 40px;
	text-align:center;	
	box-shadow: 0px 2px white;
	background-color: rgb(19, 116, 248);
	padding: 10px;
	color: white;
	
}
.MsgBox > p:nth-child(2){
	float:left;
	width:75%;
	text-align:left;
	height:60px;
	line-height: 40px;
	box-shadow: -2px 2px white;
	background-color: rgb(19, 116, 248);
	padding: 10px;
	color: white;
	
}
.MsgBox > p:nth-child(3){
	float:left;
	width:25%;
	height:60px;	
	line-height: 40px;
	text-align:center;
	box-shadow: 0px 2px rgb(19, 116, 248);
	padding: 10px;
}
.MsgBox > p:nth-child(4){
	float:left;
	width:75%;
	text-align:left;
	height:60px;
	line-height: 40px;
	box-shadow: -2px 2px rgb(19, 116, 248);
	padding: 10px;
	
}
.MsgBox > p:nth-child(5){
	float:left;
	width:25%;
	height:60px;
	line-height: 40px;
	text-align:center;
	box-shadow: 0px 2px rgb(19, 116, 248);
	padding: 10px;
}	
.MsgBox > p:nth-child(6){
	float:left;
	width:75%;
	text-align:left;
	height:60px;
	line-height: 40px;
	box-shadow: -2px 2px rgb(19, 116, 248);
	padding: 10px;
	
}
.MsgBox > p:nth-child(7){
	float:left;
	width:25%;
	height:60px;
	line-height: 40px;
	text-align:center;
	box-shadow: 0px 2px rgb(19, 116, 248);
	padding: 10px;
	
}
.MsgBox > p:nth-child(8){
	float:left;
	width:75%;
	text-align:left;
	height:60px;
	line-height: 40px;
	box-shadow: -2px 2px rgb(19, 116, 248);
	padding: 10px;
	
}
.MsgBox > p:nth-child(9){
	float:left;
	width:25%;
	height:60px;
	text-align:center;
	line-height: 40px;
	padding: 10px;
	
}
.MsgBox > p:nth-child(10){
	float:left;
	width:75%;
	height:auto;
	text-align:left;
	line-height: 40px;
	box-shadow: -2px 0px rgb(19, 116, 248);
	padding: 10px;

	
}

</style>
<script type="text/javascript">

function fn_openBoardList(obj){   // 목록으로
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/messageList'/>");
	comSubmit.addParam("PAGE_INDEX","${param.PAGE_INDEX}");
	comSubmit.submit();
}	
</script>

</head>

<br/><br/><br/>

<body>


<div class="mdTl">
<h1>메시지 보기</h1>
</div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectMessageList">


<div class="MessageList">
   
   <div class="Message">      
	<div class="MsgBox">
		<p>번 호 </p>
		
		 <p>&nbsp;${map.MESSAGE_NUM}</p>	
		 
		<p>대 상</p>	  
		
         <p>${map.MEM_ID} (
         	<c:if test="${map.MEM_KIND eq 'lessor'}">
         	임대회원
         	</c:if>
         	<c:if test="${map.MEM_KIND eq 'normal'}">
         	임차회원
         	</c:if>
         )
      	</p>
      	<p>날 짜 </p>
         <p>${map.SEND_DATE}</p>
         <p>제 목 </p>    	
         <p>${map.MESSAGE_TITLE}</p>
         <p>내 용 </p>
		<p>${map.MESSAGE_CONTENT}</p>&nbsp;
         </div> 
     
    <br/><br/><br/>
 
    <a class="adminbtn" href="#" onClick="fn_openBoardList($(this))">목록으로</a>

  
   </div>	
 
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>