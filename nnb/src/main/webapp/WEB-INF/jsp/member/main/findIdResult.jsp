<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<div class="result">
<c:if test="${id.MEM_ID==null || id.MEM_ID==''}">
��ȸ�� ���̵� �����ϴ�.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
�Է��Ͻ� ������ ��ϵ� ���̵�� '${id.MEM_ID}'�Դϴ�.
</c:if>
<br>
<a href="#" onclick="javascript:history.go(-1);" class="btn">�ڷΰ���</a>
<a href="#" onclick="javascript:window.close();" class="btn">�ݱ�</a>
</div>

</body>
</html>