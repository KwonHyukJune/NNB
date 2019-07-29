<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageInfo">

	<div>�̸�</div>
		${map.MEM_NAME}
	<div>�г���</div>
		${map.MEM_NICK}
	<div>�̸���</div>
		${map.MEM_EMAIL}
	<div>����ó</div>
		${map.MEM_PHONE}
	<div>
		<a href="<c:url value='/myPage/myPageModifyForm'/>" class="btn">����</a>
	</div>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
