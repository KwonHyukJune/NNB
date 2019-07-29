<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>1:1 문의 관리</title>



<head>
</head>

<body>
	<h1><div style="width:880px; margin: 0 auto; text-align: center;">Q&A 관리</div></h1>
	<br/>
	
<div style="margin: 0 auto; width:880px; text-align: center;">
<button id="btn" type="button" onclick="location.href='adminFAQList.jsp'">자주 묻는 질문</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
<button id="btn" type="button" onclick="location.href='adminQNAList.jsp'" aria-current="page">1:1 질문</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<br/><br/><br/><br/>

<div id=tab1 style= "margin: 0 auto; text-align: center;">

<select name="searchType" style="height: 29px; ">

		<option value="n"

			<c:out value="${cri.searchType == null?'selected':''}"/>>

			---</option>

		<option value="t"

			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>번호</option>

		<option value="c"

			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>제목</option>

		<option value="w"

			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>아이디</option>

	</select>&nbsp;&nbsp;&nbsp;&nbsp;

 	<select name="searchType" style="height: 29px; ">

		<option value="n"

			<c:out value="${cri.searchType == null?'selected':''}"/>>

			---</option>

		<option value="t"

			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>검색 유형</option>

		<option value="c"

			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>허위 매물</option>

		<option value="w"

			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>과도한 광고</option>

	</select>&nbsp;&nbsp;&nbsp;&nbsp;

	<input type="text" name='keyword' id="keywordInput"

		value='${cri.keyword }' style="height: 23px; ">
		&nbsp;&nbsp;&nbsp;&nbsp;

	<button type="button" id='searchBtn' style="height: 29px; ">검색</button>
</div>
	<br/>

<div>
<ul>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">번호</li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">답변대기</li>
<li style="width: 15%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">날짜</li>
<li style="width: 10%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">아이디</li>
<li style="width: 43%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">제목</li>
<li style="width: 6%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
<li style="width: 6%; height: 28px;background-color:#D4F4FA; float:left; list-style:none;">  </li>
</ul>
<br/>
<ul>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${QNA_NUM}</li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${RES_STATE}</li>
<li style="width: 15%; height: 28px;background-color:white; float:left; list-style:none;">${QNA_DATE}</li>
<li style="width: 10%; height: 28px;background-color:white; float:left; list-style:none;">${MEM_ID}</li>
<li style="width: 43%; height: 28px;background-color:white; float:left; list-style:none;">${FAQ_TITLE}</li>
<li style="width: 6%; height: 28px;background-color:white; float:left; list-style:none;"><button id="modify_btn" >수정</button></li>
<li style="width: 6%; height: 28px;background-color:white; float:left; list-style:none;"><button id="delete_btn">삭제</button></li>
</ul>
<br/>
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

&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
