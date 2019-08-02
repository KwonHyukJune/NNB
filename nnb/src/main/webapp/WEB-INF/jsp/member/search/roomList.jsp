<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<script type="text/javascript">
/* 추가필터-층수 : 전체 누르면 다른거 체크해제되고 다른거 누르면 전체 해제되고 */
/* 추가필터-층수 : 7층 이상은 어떻게 값을 줄지 */
/* 추가필터-방구조 : 원룸일 때만 뜨게 */
/* 추라필터-추가옵션 : 풀옵션 어떻게 줄지 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="roomList">

<div id="searchOption">
	<input type="text" name="region" class="search" id="region">
	<div class="select">방 종류</div>
	<div class="select">거래 종류</div>
	<div class="select">가격대</div>
	<div class="select">관리비</div>
	<div class="select">방크기</div>
	<div class="select">추가필터</div>
	<div class="option" id="roomType">
		<div>방종류</div>
		<div>중복선택이 가능합니다.</div>
		<div>
			<input type="checkbox" class="ROOM_TYPE" value="원룸">원룸
			<input type="checkbox" class="ROOM_TYPE" value="투룸">투룸
			<input type="checkbox" class="ROOM_TYPE" value="쓰리룸">쓰리룸
			<input type="checkbox" class="ROOM_TYPE" value="오피스텔">오피스텔
			<input type="checkbox" class="ROOM_TYPE" value="아파트">아파트
		</div>
	</div>
	<div class="option" id="tradeType">
		<div>매물 종류</div>
		<div>중복선택이 가능합니다.</div>
		<div>
			<input type="checkbox" class="TRADE_TYPE" value="월세">월세
			<input type="checkbox" class="TRADE_TYPE" value="전세">전세
		</div>
	</div>
	<div class="option" id="price">
		<div>보증금/전세가</div>
		<div>
			<input type="number" name="MONTHLY_DEPOSIT_MIN" id="MONTHLY_DEPOSIT_MIN">
			<input type="number" name="MONTHLY_DEPOSIT_MAX" id="MONTHLY_DEPOSIT_MAX">
			<input type="number" name="JEONSE_MIN" id="JEONSE_MIN">
			<input type="number" name="JEONSE_MAX" id="JEONSE_MAX">
		</div>
		<div>월세</div>
		<div>
			<input type="number" name="MONTHLY_PAYMENT_MIN" id="MONTHLY_PAYMENT_MIN">
			<input type="number" name="MONTHLY_PAYMENT_MAX" id="MONTHLY_PAYMENT_MAX">
		</div>
	</div>
	<div class="option" id="utilityPrice">
		<div>관리비</div>
		<div>
			<input type="number" name="UTILITY_PRICE_MIN" id="UTILITY_PRICE_MIN">
			<input type="number" name="UTILITY_PRICE_MAX" id="UTILITY_PRICE_MAX">
		</div>
	</div>
	<div class="option" id="size">
		<div>방크기</div>
		<div>
			<input type="number" name="REAL_SIZE_MIN" id="REAL_SIZE_MIN">
			<input type="number" name="REAL_SIZE_MAX" id="REAL_SIZE_MAX">
		</div>
	</div>
	<div class="option" id="additional">
		<div>층수</div>
		<div>
			<input type="checkbox" class="ROOM_FLOOR" value="" checked="checked">전체
			<input type="checkbox" class="ROOM_FLOOR" value="1">1층
			<input type="checkbox" class="ROOM_FLOOR" value="2">2층
			<input type="checkbox" class="ROOM_FLOOR" value="3">3층
			<input type="checkbox" class="ROOM_FLOOR" value="4">4층
			<input type="checkbox" class="ROOM_FLOOR" value="5">5층
			<input type="checkbox" class="ROOM_FLOOR" value="6">6층
			<input type="checkbox" class="ROOM_FLOOR" value="7">7층 이상
			<input type="checkbox" class="ROOM_FLOOR" value="반지층">반지층
			<input type="checkbox" class="ROOM_FLOOR" value="옥탑방">옥탑방
		</div>
		<div>방 구조</div>
		<div>
			<input type="checkbox" class="STRUCTURES" value="2">주방 분리형(1.5룸)
			<input type="checkbox" class="STRUCTURES" value="1">복층
		</div>
		<div>추가옵션</div>
		<div>중복선택이 가능합니다.</div>
		<div>
			<input type="checkbox" class="PARKING" value="1">주차가능
			<input type="checkbox" class="PET" value="1">반려동물
			<input type="checkbox" class="ELEVATOR" value="1">엘리베이터
			<input type="checkbox" class="BALCONY" value="1">베란다/발코니
			<input type="checkbox" class="BUILT_IN" value="1">빌트인
			<input type="checkbox" class="OPTIONS" value="1,2,8,9">풀옵션
			<input type="checkbox" class="LOAN_ACCESS" value="1">전세자금대출
		</div>
	</div>
</div>

<div id="searchResult">
	<div>조건에 맞는 방 ${count}개</div>
	<div class="roomList">
		<c:forEach var="room" items="${list}">
		<div class="room">
	<!-- 	<a href="#" onclick="select()"> -->
			<div class="fav">
				<c:if test="${room.check=='0'}">
				<div class="insertFav" onclick="insertFav(${room.ROOM_NUM});">
				</div>
				</c:if>
				<c:if test="${room.check=='1'}">
				<div class="deleteFav" onclick="deleteFav(${room.ROOM_NUM});">
				</div>
				</c:if>
			</div>
		<a href="<c:url value='/room/detail?ROOM_NUM=${room.ROOM_NUM}'/>">
			<div class="img">
			<img src="<c:url value='/files/${room.STD_NAME}'/>">
			</div>
			<div>${room.ROOM_TYPE}</div>
			<div>
				${room.TRADE_TYPE} 
				<c:if test="${room.TRADE_TYPE=='월세'}">
				${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}
				</c:if>
				<c:if test="${room.TRADE_TYPE=='전세'}">
				${room.JEONSE}
				</c:if>
			</div>
			<div>
				${room.ROOM_FLOOR}층, ${room.REAL_SIZE}m2,
				<c:if test="${room.UTILITY_PRICE!=null && room.UTILITY_PRICE!=''}">
				관리비 ${room.UTILITY_PRICE}만
				</c:if>
			</div>
			<div>${room.DESC_TITLE}</div>
		</a>
		</div>
		</c:forEach>
	</div>
</div>

<div id="map">
지도 영역..ㅡㅡ
</div>

</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
<script type="text/javascript">
</script>
</html>