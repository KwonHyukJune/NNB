<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/report.css'/>"/>
</head>
<body>
<h1 class="kuldyr">�Ű��ϱ�</h1>
<div class="iAegdM">	
	<div class="ogonX">
		
		<p align="center">
		${MEM_ID}���� <span>�Ű� ���������� �����Ǿ����ϴ�.</span></p><br>
		<p align="center">������ ������ �ǰ� �����մϴ�. �������� ���� ��ġ�ϵ��� �ϰڽ��ϴ�.</p><br>
	</div>
<div align="center">
	<button class="iEZQG" onclick="location.href='<c:url value='/search/openSearchRoomList'/>'">�������</button>
</div>
<br>
</div>
</body>
<div>
	<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</html>