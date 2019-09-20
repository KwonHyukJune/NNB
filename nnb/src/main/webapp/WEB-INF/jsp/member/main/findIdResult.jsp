<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>"/>
</head>
<body>
<div class="eaRvjJ">
<div class='flwTzf' style=text-align:center;>
<c:if test="${id.MEM_ID==null || id.MEM_ID==''}">
조회된 아이디가 없습니다.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
<strong>입력하신 정보로 등록된 아이디는 '${id.MEM_ID}'입니다.</strong>
</c:if>
<br>
<br>
<div class="ewSpjL2">
	<a href="#" onclick="javascript:history.go(-1);" class="btn">뒤로가기</a>
	&nbsp;&nbsp;
	<a href="#" onclick="javascript:window.close();" class="btn">닫기</a>
</div>
</div>
</div>
</body>
</html>