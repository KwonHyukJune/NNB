<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<div style="display:none">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
</div>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/room.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#aadmin').addClass('active');
});
/* 버튼들 링크 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="adminRoom ggiCSo">
<%@ include file="room.jspf" %>

<div class="inform">
<ul class="WQwFT">
	<li>등록한 매물은 최대 30일까지 공개 후 거래완료됩니다.</li>
	<li>광고중 : 내가 등록한 매물이 공개중인 상태</li>
	<li>거래완료 : 등록한 매물이 거래완료된 상태</li>
	<li>검수반려 : 운영원칙 위배 또는 신고로 비공개된 상태</li>
</ul>
</div>

<c:if test="${roomCount!=null && roomCount!=''}">
<div class="jkdKlr">
<c:forEach var="room" items="${list}">
<fmt:parseDate var="dateString" value="${room.UPLOAD_DATE}" pattern="yyyy-MM-dd"/>
	<div class="room kcaUIg">
		<div class="content dUvncE">
			<p class="iTcrkc">매물번호</p>
			<button class="kkaIZb2" type="button" onclick="location.href='roomDetail?num=${room.ROOM_NUM}'">${room.ROOM_NUM}</button>
			<p class="eRbhvo">${room.TRADE_STATUS}</p>
		</div>
		<a terget="_blank" rel="noopener noreferrer" class="jsEbdN" href="roomDetail?num=${room.ROOM_NUM}">
			<div class="lloFGK">
			</div>
			<h1>
				<span>${room.ROOM_TYPE}</span>
				<span>${room.TRADE_TYPE}</span>
				<span>${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}</span>
				<span>${room.JEONSE}</span>
			</h1>
		</a>
		<div class="content gQXat">
			<div class="kvgsgP">${room.DESC_SECRET}</div>
		</div>
		<div class="content idxnWu">
			<div class="bSemOn">
				<p>등록일 <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/></p>
				<p>조회수 <span>${room.HIT_COUNT}</span></p>
				<p>찜 <span>${room.FAV_COUNT}</span></p>
			</div>
			<div class="fLTNNO">
				<c:if test="${room.TRADE_STATUS=='광고중'}">
				<button class="eMNveq llAgXp" type="button" onclick="location.href='updateForm?num=${room.ROOM_NUM}'">수정</button>
				<button class="ivmhMO llAgXp" type="button" onclick="location.href='delete?num=${room.ROOM_NUM}'">삭제</button>
				<button class="ANDVz llAgXp" type="button" onclick="">광고종료</button>
				<button class="HCCsy llAgXp" type="button" onclick="">거래완료</button>
				</c:if>
				<c:if test="${room.TRADE_STATUS=='광고종료'}">
				<button class="eMNveq llAgXp" type="button" onclick="location.href='updateForm?num=${room.ROOM_NUM}'">수정</button>
				<button class="ivmhMO llAgXp" type="button" onclick="location.href='delete?num=${room.ROOM_NUM}'">삭제</button>
				<button class="ANDVz llAgXp" type="button" onclick="">광고재등록</button>
				<button class="HCCsy llAgXp" type="button" onclick="">거래완료</button>
				</c:if>
				<c:if test="${room.TRADE_STATUS=='거래완료'}">
				<button class="hxvBac llAgXp" type="button" onclick="location.href='updateForm?num=${room.ROOM_NUM}'">수정</button>
				<button class="dPcOsn llAgXp" type="button" onclick="location.href='delete?num=${room.ROOM_NUM}'">삭제</button>
				<button class="bDSVrJ llAgXp" type="button" onclick="">광고재등록</button>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
</div>
</c:if>
<c:if test="${roomCount==null || roomCount==''}">
<div class="cbeboU">
	<p>등록된 매물이 없습니다.</p>
</div>
</c:if>

</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
<script type="text/javascript">
</script>
</html>