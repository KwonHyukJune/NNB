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
<%
	Map<String,Object> lessor = new HashMap<String,Object>();
	lessor.put("MEM_ID","withfour");
	lessor.put("MEM_NAME","최사랑");
	lessor.put("MEM_PHONE","010-0000-0000");

	request.setAttribute("lessor", lessor);
%>
<!--  -->
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
	<a href="<c:url value='/myPage/messageWrite?mem=${lessor.MEM_ID}'/>">메시지 작성으로 이동</a>
</div>
<div>
	
</div>
</div>

</body>
<script type="text/javascript">
</script>
</html>