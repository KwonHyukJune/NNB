<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>닉네임 중복 확인</title>
</head>
<body>
<c:if test="${nickCheck==1}">
같은 이름의 닉네임이 이미 존재합니다. 
</c:if>
<c:if test="${nickCheck==0}">
현재 닉네임을 사용하실 수 있습니다.
</c:if>
</body>
</html>