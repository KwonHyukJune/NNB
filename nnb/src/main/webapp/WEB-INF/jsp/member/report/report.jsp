<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/report.css'/>"/>
</head>
<body>
<h1 class="kuldyr">신고하기</h1>
<div class="iAegdM">	
	<div class="ogonX">
		
		<p align="center">
		${MEM_ID}님의 <span>신고가 정상적으로 접수되었습니다.</span></p><br>
		<p align="center">고객님의 소중한 의견 감사합니다. 빠른시일 내에 조치하도록 하겠습니다.</p><br>
	</div>
<div align="center">
	<button class="iEZQG" onclick="location.href='<c:url value='/search/openSearchRoomList'/>'">목록으로</button>
</div>
<br>
</div>
</body>
<div>
	<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</html>