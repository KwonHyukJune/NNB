<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
</head>
<!-------------------------------------------------------------- -->
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

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
   <div>전체 방 ${count}개</div>
<div class="selectSearchRoomList">

</div>

<div id="PAGE_NAVI">  </div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
<br>

<div id="map"style="width: 50%; height: 300px; margin-top: 10px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
	<c:forEach var="address" items="${list}">
		<script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
             center: new kakao.maps.LatLng(37.502541, 127.024711), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); //지도를 미리 생성
            var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성합니다
            
            geocoder.addressSearch('${address.ADDRESS1}', function(result, status) { // 주소로 좌표를 검색합니다
               // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
                });
                map.setCenter(coords);
              } 
            });    
         </script>
	</c:forEach>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

<script type="text/javascript">
$(document).ready(function(){
	fn_selectSearchRoomList(1);
});


function fn_selectSearchRoomList(pageNo){
	var comAjax = new ComAjax(); 
	comAjax.setUrl("<c:url value='/search/roomList'/>"); 
	comAjax.setCallback("fn_selectSearchRoomListCallback"); 
	comAjax.addParam("PAGE_INDEX",pageNo); 
	comAjax.addParam("PAGE_ROW", 15); 
	comAjax.ajax(); }

function fn_selectSearchRoomListCallback(data){ 
	var total = data.TOTAL; 
	var body = $("div.selectSearchRoomList"); 
	body.empty(); 
	
	if(total == 0){ 
		var str = "<div class='roomList'>" + "조회된 결과가 없습니다. </div>"; 
		body.append(str); 
        	
	} else{ 
		var params = { 
			divId : "PAGE_NAVI", 
			pageIndex : "PAGE_INDEX", 
			totalCount : total, 
			eventName : "fn_selectSearchRoomList" 
			}; 
		
		gfn_renderPaging(params); 
			var str = ""; 
			$.each(data.list, function(key, value){ 
				str += 
					"<div class='roomList'>" 
						+ "<a href='<c:url value='/room/detail?ROOM_NUM="+ value.ROOM_NUM + "'/>'>"
							+ "<div class='img'>"
								+ "<img src='<c:url value='/files/"+ value.THUMBNAIL + "'/>'>"
							+ "</div>"
							+ "<div>"+ value.ROOM_TYPE + "</div>"
							+"<div>"
								+ value.TRADE_TYPE
									+ value.MONTHLY_DEPOSIT + "/" + value.MONTHLY_PAYMENT
									+ value.JEONSE
							+ "</div>"
							+ "<div>"
								+ value.ROOM_FLOOR + "층," + value.SUPPLY_SIZE+ "m2,"
									+ "관리비  "+ value.UTILITY_PRICE + "만"
							+ "</div>"
							+ "<div>" + value.DESC_TITLE + "</div>"
						+ "</a>"
    				+ "</div>";

        	}); 
        	body.append(str); 
		} 
}
        
</script>

</body>
</html>