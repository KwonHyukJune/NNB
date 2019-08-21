<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 작성</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
</head>
<body>
<br/>
<h3>메시지작성</h3>
<br/>
<hr>	
<br/><br/>
<form action="messageWrite" method="post">
	<input type="hidden" name="RECEIVER" value="${param.id}">
	<div>
      	제목
       	<input type="text" id="TITLE" name="MESSAGE_TITLE"/>
 		</div>
 		<br/>
	<div>    
       	 내용
	<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="MESSAGE_CONTENT"></textarea>
    </div>

   <div>
   	<br/><br/>
   	<button type="submit">보내기</button>

   	<a href="javascript:frameclose()">취소</a>
   </div>
</form>


<br/>
</body>
</html>