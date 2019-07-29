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

<div class="myProfile">
<div class="title">나의 룸메이트 프로필</div>
<%-- <c:set var="check" value="1"></c:set> --%>
<c:choose>
<c:when test="${map.check==1}">
<div class="h">성별</div>
<div class="b">${map.RI_GENDER}</div>
<div class="h">부담가능금액</div>
<div class="b">보증금: ${map.RI_LOAN_BIG}, 월세:${map.RI_LOAN_SMALL}</div>
<div class="h">선호지역</div>
<div class="b">${map.RI_REGION1},${map.RI_REGION2},${map.RI_REGION3}</div>
<div class="h">생일</div>
<div class="b">${map.RI_BIRTH}</div>
<div class="h">입주시기</div>
<div class="b">${map.RI_DATE_START}~${map.RE_DATE_END}</div>
<div class="h">자기소개</div>
<div class="b">${map.RI_PROFILE}</div>
<a href="<c:url value='/myPage/myProfileModifyForm'/>">수정</a>
</c:when>
<c:otherwise>
<div>
등록된 프로필이 없습니다.
</div>
<a href="<c:url value='/myPage/registMyProfileForm'/>">새로 작성하기</a>
</c:otherwise>
</c:choose>

</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
