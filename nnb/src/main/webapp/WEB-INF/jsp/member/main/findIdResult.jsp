<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<div class="result" style="display: none">
<c:if test="${id.MEM_ID==null || id.MEM_ID==''}">
��ȸ�� ���̵� �����ϴ�.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
�Է��Ͻ� ������ ��ϵ� ���̵�� '${id.MEM_ID}'�Դϴ�.
</c:if>
<a href="#" class="btn" onclick="close();">�ݱ�</a>
</div>

</body>
</html>