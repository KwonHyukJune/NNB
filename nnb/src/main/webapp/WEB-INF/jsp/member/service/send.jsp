<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/qna.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="/WEB-INF/include/serviceHeader.jspf"%>

<div class="styled__Content-sc-1bvtbsc-1 iAegdM">
<div class="styled__Header-hqk9t8-0 ogonX">
	<p>${MEM_ID}���� <span>1:1 ���� ������ �Ϸ�Ǿ����ϴ�.</span></p>
	<p>���� ���ϳ��� �亯 �帮�ڽ��ϴ�!</p>
</div>
<div align="center">
	<button class="iEZQG" onclick="location.href='<c:url value='/main'/>'">����</button>
</div>
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
