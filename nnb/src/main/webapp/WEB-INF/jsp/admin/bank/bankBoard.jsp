<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 메인 페이지</title>



<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
</head>
<br/><br/>

<body>
<h1><div">제휴은행 관리</div></h1>
	<br/>
	<hr>
		<div style="margin: 0 auto;">
<ul>
	<li style="float:left; list-style:none;">번호</li>
	<li style="float:left; list-style:none;">은행종류</li>
	<li style="float:left; list-style:none;">날짜</li>
	<li style="float:left; list-style:none;">조회수</li>
	<li style="float:left; list-style:none;">제목</li>
	<li style="float:left; list-style:none;">수정</li>
	<li style="float:left; list-style:none;">삭제</li>
	
</ul>
<br/>

<ul>
	<li style="float:left; list-style:none;">${BANK_NUM}</li>
	<li style="float:left; list-style:none;">${BANK_KIND}</li>
	<li style="float:left; list-style:none;">${BANK_REGDATE}</li>
	<li style="float:left; list-style:none;">${BANK_HITCOUNT}</li>
	<li style="float:left; list-style:none;">${BANK_TITLE}</li>
	<li style="float:left; list-style:none;"><button id="modify_btn" >수정</button></li>
	<li style="float:left; list-style:none;"><button id="delete_btn">삭제</button></li>
</ul>

<br/>

<ul>
<li style= "float:right; list-style:none;"> <input type= button id="write_btn" value="새 글 등록" onclick="writeForm()"></li>
</ul>

<br/><br/><br/><br/><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>

</body>
</html>
