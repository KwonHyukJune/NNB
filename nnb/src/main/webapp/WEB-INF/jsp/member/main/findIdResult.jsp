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
��ȸ�� ���̵� �����ϴ�.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
<strong>�Է��Ͻ� ������ ��ϵ� ���̵�� '${id.MEM_ID}'�Դϴ�.</strong>
</c:if>
<br>
<br>
<div class="ewSpjL2">
	<a href="#" onclick="javascript:history.go(-1);" class="btn">�ڷΰ���</a>
	&nbsp;&nbsp;
	<a href="#" onclick="javascript:window.close();" class="btn">�ݱ�</a>
</div>
</div>
</div>
</body>
</html>