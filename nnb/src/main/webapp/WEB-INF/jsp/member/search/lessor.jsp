<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
</head>
<body>

<div class="lessor">
<div class="title">임대인 정보 보기</div>
<div>
	<p>${lessor.MEM_NAME}</p>
	<p>${lessor.MEM_PHONE}</p>
	<p>연락 시 니내방에서 보고 연락한다고 말씀하시면<br>
		원활하게 상담 받을 수 있습니다.</p>
</div>
<div>
	<p>메시지 보내기</p>
	<p>답변이 늦어질 수 있습니다.</p>
	<a href="<c:url value='/myPage/messageWriteForm?RECEIVER=${lessor.MEM_ID}'/>">메시지 작성으로 이동</a>
</div>
<div>
	
</div>
</div>

</body>
<script type="text/javascript">
</script>
</html>