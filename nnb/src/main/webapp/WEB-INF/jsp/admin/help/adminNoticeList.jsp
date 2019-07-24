<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 공지 게시판</title>



<head>
</head>

<body>
	<h1><div style="width:880px; margin: 0 auto; text-align: center;">게시판 관리</div></h1>
	<br/>
	
<div style="margin: 0 auto; width:880px; text-align: center;">
<button id="btn" type="button" onclick="location.href='adminNoticeList.jsp'" aria-current="page">공지 게시판</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn" type="button" onclick="location.href='adminRoomList.jsp'">방 게시판</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn" type="button" onclick="location.href='adminTermsList.jsp'">약관 관리</button></a>
</div>
<br/><br/><br/><br/><br/>

<div>
<ul>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">번호</li>
<li style="width: 20%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">공지유형</li>
<li style="width: 58%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">제목</li>
<li style="width: 6%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
<li style="width: 6%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
</ul>
<br/>
<ul>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${NT_NUM}</li>
<li style="width: 20%; height: 28px;background-color:white; float:left; list-style:none;">${NT_TYPE}</li>
<li style="width: 58%; height: 28px;background-color:white; float:left; list-style:none;">${NT_TITLE}</li>
<li style="width: 6%; height: 28px;background-color:white; float:left; list-style:none;"><button id="modify_btn" >수정</button></li>
<li style="width: 6%; height: 28px;background-color:white; float:left; list-style:none;"><button id="delete_btn">삭제</button></li>
</ul>
<br/>
<ul>
<li style= "float:right; list-style:none;"> <input type= button id="write_btn" value="새 공지 등록" onclick="writeForm()"></li>
</ul>
</div>

<script>
 
 // 폼을 변수에 저장
 var formObj = $("form[role='form']");
 
 // 수정 버튼 클릭
 $("#modity_btn").click(function(){
  
  formObj.attr("action", "/board/modify");
  formObj.attr("method", "get");  
  formObj.submit();     
  
 });
 
//삭제 버튼 클릭
 $("#delete_btn").click(function(){
  
  formObj.attr("action", "/board/delete");
  formObj.attr("method", "get");  
  formObj.submit();
  
 });
 
 //새공지 버튼 클릭
  $("#write_btn").click(function(){
  
  formObj.attr("action", "/board/write");
  formObj.attr("method", "get");  
  formObj.submit();
  
 });
 
 </script>






</body>
</html>