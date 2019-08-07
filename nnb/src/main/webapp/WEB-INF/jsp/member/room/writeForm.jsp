<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/room.css'/>" />
<script type="text/javascript">
/* 건물 유형에 따라 선택 옵션 달라지게 */
/* 주소 API */
/* 전세/월세 선택하면 금액입력 창 뜨게 */
/* div 선택하면 라디오 체크되고 div 스타일 바뀜 */
/* 관리비 있음 누르면 UTILITY_PRICE 보이게 */
/* div 선택하면 체크박스 체크되고 div 스타일 바뀜 */
/* 주차여부 1이면 주차금액 변경불가에서 변경가능으로 바뀌게 */
/* 주차여부 0이면 주차금액 변경가능에서 변경불가로 바뀌고 밸류 삭제 */
/* 파일 등록할 때 이미지 파일만 등록되게 가능한가? 물론 가능하겠지.. */
   var gfv_count = 1;
    var mem = sessionStorage.getItem("MEM_ID");
   function addFile(){
      var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
      $("#fileDiv").append(str);
      $("a[name='delete']").on("click",function(e){
         e.preventDefault();
         fn_deleteFile($(this));
      });
   };/* 흔한개발자 코드 그대로 긁어왔음 */
   function fn_deleteFile(obj){
      obj.parent().remove();
   };
   $('#chkBox:checked').each(function() { 
      alert($(this).val()); 
   });

   function fsubmit(){
      str = "<input type='hidden' name='MEM_ID' value='"+mem+"'>";
      $("#frm").append(str);
      frm.submit();
   };
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jspf"%>
	<%@ include file="room.jspf"%>
	<div class="roomWrite">

		<div class="inform">등록한 매물은 30일 동안 어쩌구~</div>

		<form id="frm" name="frm" enctype="multipart/form-data" action="write"
			method="post">
			<div class="table">
				<div class="thead">매물 종류</div>
				<div class="tbody">
					<div class="h">종류 선택</div>
					<div class="b">
						<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="원룸">
						<div class="button">원룸</div>
						<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="투룸">
						<div class="button">투룸</div>
						<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="쓰리룸">
						<div class="button">쓰리룸</div>
						<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE"
							value="오피스텔">
						<div class="button">오피스텔</div>
						<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="아파트">
						<div class="button">아파트</div>
					</div>
					<div class="h">건물 유형</div>
					<div class="b" id="building">
						<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
							value="단독주택">
						<div class="button">단독주택</div>
						<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
							value="다가구주택">
						<div class="button">다가구주택</div>
						<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
							value="빌라/연립/다세대">
						<div class="button">빌라/연립/다세대</div>
						<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
							value="상가주택">
						<div class="button">상가주택</div>
					</div>
					<div class="b" id="building_office">
						<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
							value="오피스텔">
						<div class="button">오피스텔</div>
						<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE"
							value="도시형생활주택">
						<div class="button">도시형생활주택</div>
					</div>
					<div class="b" id="building_apart">
						<input type="radio" name="BUILDING_TYPE" value="아파트">
					</div>
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------------------------- -->
			<div class="table">
				<div class="thead">위치 정보</div>
				<div class="tbody">
					<div class="h">주소</div>
					<div class="b">

						<input type="text" name="ZIPCODE" id="sample6_postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
						<input type="text" name="ADDRESS1" id="sample6_address" size="50"
							placeholder="주소">
						<input type="text" name="ADDRESS2" id="sample6_address2" size="50"
							placeholder="상세주소">


						<div id="map"
							style="width: 50%; height: 300px; margin-top: 10px; display: none"></div>
					</div>
				</div>
			</div>
			<!-- -------------------------------------------------------------------------------------------------------------------------------------------- -->

			<div class="table">
				<div class="thead">거래 정보</div>
				<div class="tbody">
					<div class="h">거래 종류</div>
					<div class="b">
						<div>
							<input type="radio" name="TRADE_TYPE" class="trade_type"
								value="월세">
							<div class="button">월세</div>
							<input type="radio" name="TRADE_TYPE" class="trade_type"
								value="전세">
							<div class="button">전세</div>
						</div>
						<div id="monthly">
							<input type="number" name="MONTHLY_DEPOSIT" id="deposit"
								placeholder="보증금">/ <input type="number"
								name="MONTHLY_PAYMENT" id="pay" placeholder="월세"> 만원
						</div>
						<div id="jeonsediv">
							<input type="number" name="JEONSE" id="jeonse" placeholder="전세">
							만원
						</div>
					</div>
				</div>
			</div>
			<div class="table">
				<div class="thead">기본 정보</div>
				<div class="tbody">
					<div class="h">건물 크기</div>
					<div class="b">
						<div>
							공급 면적 <input type="number" id="sup_p"> 평 <input
								type="number" name="SUPPLY_SIZE" id="sup_m"> m2
						</div>
						<div>
							전용 면적 <input type="number" id="real_p"> 평 <input
								type="number" name="REAL_SIZE" id="real_m"> m2
						</div>
					</div>
					<div class="h">건물 층수</div>
					<div class="b">
						<div>
							건물 층수 <select name="BUILDING_STORY" id="building_story">
								<option>--건물 층수 선택--</option>
								<c:forEach var="i" begin="1" end="50">
									<option value="${i}">${i}층</option>
								</c:forEach>
							</select>
						</div>
						<div>
							해당 층수 <select name="ROOM_FLOOR" id="room_floor">
								<option>--해당 층수 선택--</option>
								<option value="0">반지층</option>
								<option value="-1">옥탑</option>
								<c:forEach var="i" begin="1" end="50">
									<option value="${i}">${i}층</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="h">난방 종류</div>
					<div class="b">
						<select name="HEATING_SYSTEM" id="heating_system">
							<option>--난방 종류 선택--</option>
							<option value="1">중앙난방</option>
							<option value="2">개별난방</option>
							<option value="3">지역난방</option>
						</select>
					</div>
					<div class="h">입주 가능일</div>
					<div class="b">
						<input type="date" name="MOVE_IN_DATE" id="move_in_date">
					</div>
				</div>
			</div>
			<div class="table">
				<div class="thead">추가정보</div>
				<div class="tbody">
					<div class="h">관리비</div>
					<div class="b">
						<div>
							<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK"
								value="0">
							<div class="button">없음</div>
							<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK"
								value="1">
							<div class="button">있음</div>
							<div class="UTILITY_PRICE">
								<input type="text" name="UTILITY_PRICE" id="UTILITY_PRICE">
								만원
							</div>
						</div>
						<div>
							관리비 항목 <input type="checkbox" class="UTILITY_TYPE" value="1" name="UTILITY_TYPE">
							<div class="c_button">인터넷</div>
							<input type="checkbox" class="UTILITY_TYPE" value="2" name="UTILITY_TYPE">
							<div class="c_button">유선TV</div>
							<input type="checkbox" class="UTILITY_TYPE" value="3" name="UTILITY_TYPE">
							<div class="c_button">청소비</div>
							<input type="checkbox" class="UTILITY_TYPE" value="4" name="UTILITY_TYPE">
							<div class="c_button">수도세</div>
							<input type="checkbox" class="UTILITY_TYPE" value="5" name="UTILITY_TYPE">
							<div class="c_button">도시가스</div>
							<input type="checkbox" class="UTILITY_TYPE" value="6" name="UTILITY_TYPE">
							<div class="c_button">전기세</div>
							<input type="checkbox" class="UTILITY_TYPE" value="7" name="UTILITY_TYPE">
							<div class="c_button">기타</div>
						</div>
					</div>
					<div class="h">주차여부</div>
					<div class="b">
						<input type="radio" class="PARKING" name="PARKING" value="0">
						<div class="button">불가능</div>
						<input type="radio" class="PARKING" name="PARKING" value="1">
						<div class="button">가능</div>
						<input type="number" name="PARKING_BILL" id="PARKING_BILL">
						만원
					</div>
					<div class="h">반려동물</div>
					<div class="b">
						<input type="radio" class="PET" name="PET" value="0">
						<div class="button">불가능</div>
						<input type="radio" class="PET" name="PET" value="1">
						<div class="button">가능</div>
					</div>
					<div class="h">엘리베이터</div>
					<div class="b">
						<input type="radio" class="ELEVATOR" name="ELEVATOR" value="0">
						<div class="button">없음</div>
						<input type="radio" class="ELEVATOR" name="ELEVATOR" value="1">
						<div class="button">있음</div>
					</div>
					<div class="h">베란다/발코니</div>
					<div class="b">
						<input type="radio" class="BALCONY" name="BALCONY" value="0">
						<div class="button">없음</div>
						<input type="radio" class="BALCONY" name="BALCONY" value="1">
						<div class="button">있음</div>
					</div>
					<div class="h">빌트인</div>
					<div class="b">
						<input type="radio" class="BUILT_IN" name="BUILT_IN" value="0">
						<div class="button">없음</div>
						<input type="radio" class="BUILT_IN" name="BUILT_IN" value="1">
						<div class="button">있음</div>
					</div>
					<div class="h">구조</div>
					<div class="b">
						<input type="checkbox" class="STRUCTURES" value="1" name="STRUCTURES">
						<div class="c_button">복층</div>
						<input type="checkbox" class="STRUCTURES" value="2" name="STRUCTURES">
						<div class="c_button">1.5룸/주방분리형</div>
					</div>
					<div class="h">옵션항목</div>
					<div class="b">
						<input type="checkbox" class="OPTIONS" value="1" name="OPTIONS">
						<div class="c_button">에어컨</div>
						<input type="checkbox" class="OPTIONS" value="2" name="OPTIONS">
						<div class="c_button">세탁기</div>
						<input type="checkbox" class="OPTIONS" value="3" name="OPTIONS">
						<div class="c_button">침대</div>
						<input type="checkbox" class="OPTIONS" value="4" name="OPTIONS">
						<div class="c_button">책상</div>
						<input type="checkbox" class="OPTIONS" value="5" name="OPTIONS">
						<div class="c_button">옷장</div>
						<input type="checkbox" class="OPTIONS" value="6" name="OPTIONS">
						<div class="c_button">TV</div>
						<input type="checkbox" class="OPTIONS" value="7" name="OPTIONS">
						<div class="c_button">신발장</div>
						<input type="checkbox" class="OPTIONS" value="8" name="OPTIONS">
						<div class="c_button">냉장고</div>
						<input type="checkbox" class="OPTIONS" value="9" name="OPTIONS">
						<div class="c_button">가스레인지</div>
						<input type="checkbox" class="OPTIONS" value="10" name="OPTIONS">
						<div class="c_button">인덕션</div>
						<input type="checkbox" class="OPTIONS" value="11" name="OPTIONS">
						<div class="c_button">전자레인지</div>
						<input type="checkbox" class="OPTIONS" value="12" name="OPTIONS">
						<div class="c_button">전자도어락</div>
						<input type="checkbox" class="OPTIONS" value="13" name="OPTIONS">
						<div class="c_button">비데</div>
					</div>
					<div class="h">전세자금대출</div>
					<div class="b">
						<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS"
							value="0">
						<div class="button">불가능</div>
						<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS"
							value="1">
						<div class="button">가능</div>
					</div>
				</div>
			</div>
			<div class="table">
				<div class="thead">상세설명</div>
				<div class="tbody">
					<div class="h">제목</div>
					<div class="b">
						<input type="text" name="DESC_TITLE" id="DESC_TITLE"
							placeholder="예)">
					</div>
					<div class="h">상세설명</div>
					<div class="b">
						<textarea name="DESC_DETAIL" id="DESC_DETAIL"
							placeholder="상세설명 작성 시 주의사항&#13;&#10;ㅇㅇ"></textarea>
					</div>
					<div class="h">비공개 메모</div>
					<div class="b">
						<textarea name="DESC_SECRET" id="DESC_SECRET"
							placeholder="외부에 공개되지 않으며, 등록자에게만 보여지는 메모입니다."></textarea>
					</div>
				</div>
			</div>
			<div class="table">
				<div class="thead">사진 등록</div>
				<div class="tbody">
					<div>
						- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)<br> - 사진 용량은 사진 한
						장당 10MB까지 등록이 가능합니다.<br> - 사진은 최소 1장 이상 등록해야 하며, 최대 15장까지
						권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.
					</div>
					<div id="fileDiv">
						<p>
							<input type="file" id="file" name="file_0"> <a href="#"
								class="btn" id="delete" name="delete">삭제</a>
						</p>
					</div>
					<a href="#addFile" class="btn" id="addFile" onclick="addFile();">파일
						추가</a>
					<div class="caution">
						허위 매물을 등록할 경우 니내방에서 임의로 계정 및 매물 전체 삭제 처리됩니다. <a href="#">허위매물
							제재 정책 확인하기</a>
					</div>
				</div>
			</div>
		</form>
		<div class="check">
			<input type="checkbox" id="check">매물관리규정을 확인하였으며, 입력한 정보는 실제
			매물과 다름이 없습니다.
		</div>

		<a href="#" class="btn" onclick="fsubmit();">매물 등록</a> <a
			href="<c:url value='/room/adminRoom'/>" class="btn">취소</a>

	</div>

	<br>
	<div>
		<%@ include file="/WEB-INF/include/footer.jspf"%>
	</div>
</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.502541, 127.024711), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new daum.maps.Map(mapContainer, mapOption); //지도를 미리 생성

var geocoder = new daum.maps.services.Geocoder(); //주소-좌표 변환 객체를 생성
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
});
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}
</script>
</html>