<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 방 게시판</title>



<head>

</head>
<body>
	<h1><div style="width:880px; margin: 0 auto;  text-align: center;">게시판 관리</div></h1>
	<br/>
<div style="width:880px; margin: 0 auto; text-align: center;">
<button id="btn" type="button" onclick="location.href='adminNoticeList.jsp'">공지 게시판</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn" type="button" onclick="location.href='adminRoomList.jsp'" aria-current="page">방 게시판</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn" type="button" onclick="location.href='adminTermsList.jsp'">약관 관리</button></a>
</div>
<br/><br/><br/><br/>

 <div id=tab1 style= "margin: 0 auto; text-align: center;">

 	<select name="searchType" style="height: 29px; ">

		<option value="n"

			<c:out value="${cri.searchType == null?'selected':''}"/>>

			---</option>

		<option value="t"

			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>

		<option value="c"

			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>매물 번호</option>

		<option value="w"

			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>임대인 ID</option>

	</select>
&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name='keyword' id="keywordInput"

		value='${cri.keyword }' style="height: 23px; ">
&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" id='searchBtn' style="height: 29px; ">검색</button>
</div>
	<br/>
 

<div style= "margin: 0 auto;" >
<ul>
<li style="width: 8%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">번호</li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">매물번호</li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">날짜</li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">임대인</li>
<li style="width: 30%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">제목</li>
<li style="width: 6%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
<li style="width: 6%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
</ul>
<br/>
<ul id=tab2>
<li style="width: 8%; height: 28px;background-color:white; float:left; list-style:none;">${BOARD_NUM}</li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${ROOM_NUM}</li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${UPLOAD_DATE}</li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${MEM_ID}</li>
<li style="width: 30%; height: 28px;background-color:white; float:left; list-style:none;">${DESC_TITLE}</li>
<li style="width: 6%; height: 28px;background-color:white; float:left; list-style:none;"><button id="modify_btn" >수정</button></li>
<li style="width: 6%; height: 28px;background-color:white; float:left; list-style:none;"><button id="delete_btn">삭제</button></li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;"><button id="adEnd_btn">광고종료</button></li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;"><button id="soldOut_btn">거래완료</button></li>
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
  
 //검색
 
 });
 
 </script>







</body>
</html>
