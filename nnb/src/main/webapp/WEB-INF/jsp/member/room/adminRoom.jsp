<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%-- <!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> room = new HashMap<String,Object>();
	room.put("ROOM_NUM","1");
	room.put("TRADE_STATUS","광고중");
	room.put("ROOM_TYPE","원룸");
	room.put("BUILDING_TYPE","단독주택");
	room.put("TRADE_TYPE","월세");
	room.put("MONTHLY_DEPOSIT","300");
	room.put("MONTHLY_PAYMENT","30");
	room.put("SUPPLY_SIZE","20");
	room.put("REAL_SIZE","20");
	room.put("BUILDING_STORY","20");
	room.put("ROOM_FLOOR","3");
	room.put("HEATING_SYSTEM","1");
	room.put("MOVE_IN_DATE","2019-08-08");	//데이터 이렇게 받아야 함;;
	room.put("UTILITY_CHECK","1");
	room.put("UTILITY_PRICE","10");
	room.put("UTILITY_TYPE","1,3,5");
	room.put("PARKING","1");
	room.put("PARKING_BILL","5");
	room.put("PET","1");
	room.put("ELEVATOR","1");
	room.put("BALCONY","1");
	room.put("BUILT_IN","1");
	room.put("STRUCTURES","1");
	room.put("OPTIONS","2,4,6");
	room.put("LOAN_ACCESS","0");
	room.put("DESC_TITLE","싸다싸");
	room.put("DESC_DETAIL","이가격에 이만한 퀄리티");
	room.put("DESC_SECRET","미끼");
	room.put("UPLOAD_DATE","2019-07-31");
	room.put("HIT_COUNT","4");
	room.put("FAV_COUNT","1");
	
	List<Map<String,Object>> roomList = new ArrayList<Map<String,Object>>();
	roomList.add(room);
	
	request.setAttribute("roomList", roomList);
	request.setAttribute("count",1);
%>
<!-- 테스트용 세팅 끝 --> --%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/room.css'/>"/>
<script type="text/javascript">
/* 버튼들 링크 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="room.jspf" %>

<div class="adminRoom">

<div class="inform">
<ul>
	<li>일반회원은 1개의 매물만 등록이 가능합니다. 등록한 매물은 최대 30일까지 공개 후 거래완료됩니다.</li>
	<li>광고중 : 내가 등록한 매물이 공개중인 상태</li>
	<li>거래완료 : 등록한 매물이 거래완료된 상태</li>
	<li>검수반려 : 운영원칙 위배 또는 신고로 비공개된 상태</li>
</ul>
</div>

<c:if test="${roomCount!=null && roomCount!=''}">
<c:forEach var="room" items="${list}">
	<div class="room">
		<div class="content">
			<div>매물번호</div>
			<div>${room.ROOM_NUM}</div>
			<div>${room.TRADE_STATUS}</div>
		</div>
		<div class="content">
			<c:if test="${room.TRADE_TYPE=='월세'}">
			<div>${room.ROOM_TYPE} ${room.TRADE_TYPE} ${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}</div>
			</c:if>
			<c:if test="${room.TRADE_TYPE=='전세'}">
			<div>${room.ROOM_TYPE} ${room.TRADE_TYPE} ${room.JEONSE}</div>
			</c:if>
		</div>
		<div class="content">
			<div>비공개 메모</div>
			<div>${room.DESC_SECRET}</div>
		</div>
		<div class="content">
			<div>등록일 ${room.UPLOAD_DATE} / 조회수 ${room.HIT_COUNT} / 찜 ${room.FAV_COUNT}</div>
			<div>
				<a href="#" class="btn" onclick="">수정</a>
				<a href="#" class="btn" onclick="">삭제</a>
				<c:if test="${room.TRADE_STATUS=='광고중'}">
				<a href="#" class="btn" onclick="">광고종료</a>
				<a href="#" class="btn" onclick="">거래완료</a>
				</c:if>
				<c:if test="${room.TRADE_STATUS=='광고종료'}">
				<a href="#" class="btn" onclick="">광고재개</a>
				<a href="#" class="btn" onclick="">거래완료</a>
				</c:if>
				<c:if test="${room.TRADE_STATUS=='거래완료'}">
				<a href="#" class="btn" onclick="">광고재개</a>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
</c:if>
<c:if test="${count==null || count==''}">
	등록된 매물이 없습니다.<br>
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