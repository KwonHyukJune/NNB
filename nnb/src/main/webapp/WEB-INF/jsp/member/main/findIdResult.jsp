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
조회된 아이디가 없습니다.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
입력하신 정보로 등록된 아이디는 '${id.MEM_ID}'입니다.
</c:if>
<a href="#" class="btn" onclick="close();">닫기</a>
</div>

</body>
</html>