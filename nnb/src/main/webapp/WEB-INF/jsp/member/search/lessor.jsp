<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- �׽�Ʈ�� ���� -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> lessor = new HashMap<String,Object>();
	lessor.put("MEM_ID","withfour");
	lessor.put("MEM_NAME","�ֻ��");
	lessor.put("MEM_PHONE","010-0000-0000");

	request.setAttribute("lessor", lessor);
%>
<!--  -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
</head>
<body>

<div class="lessor">
<div class="title">�Ӵ��� ���� ����</div>
<div>
	<p>${lessor.MEM_NAME}</p>
	<p>${lessor.MEM_PHONE}</p>
	<p>���� �� �ϳ��濡�� ���� �����Ѵٰ� �����Ͻø�<br>
		��Ȱ�ϰ� ��� ���� �� �ֽ��ϴ�.</p>
</div>
<div>
	<p>�޽��� ������</p>
	<p>�亯�� �ʾ��� �� �ֽ��ϴ�.</p>
	<a href="<c:url value='/myPage/messageWrite?mem=${lessor.MEM_ID}'/>">�޽��� �ۼ����� �̵�</a>
</div>
<div>
	
</div>
</div>

</body>
<script type="text/javascript">
</script>
</html>