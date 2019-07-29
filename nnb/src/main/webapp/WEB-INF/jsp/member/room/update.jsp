<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> room = new HashMap<String,Object>();
	room.put("check","1");
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
	
	request.setAttribute("room", room);
%>
<!-- 테스트용 세팅 끝 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	(function(){
		var value = "${room.ROOM_TYPE}";
		var key = $("input[name='ROOM_TYPE']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.BUILDING_TYPE}";
		var key = $("input[name='BUILDING_TYPE']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.TRADE_TYPE}";
		var key = $("input[name='TRADE_TYPE']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.MONTHLY_DEPOSIT}";
		var key = $("input[name='MONTHLY_DEPOSIT']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.MONTHLY_PAYMENT}";
		var key = $("input[name='MONTHLY_PAYMENT']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.JEONSE}";
		var key = $("input[name='JEONSE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.SUPPLY_SIZE}";
		var key = $("input[name='SUPPLY_SIZE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.REAL_SIZE}";
		var key = $("input[name='REAL_SIZE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.BUILDING_STORY}";
		var key = $("select[name='BUILDING_STORY']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].selected = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.ROOM_FLOOR}";
		var key = $("select[name='ROOM_FLOOR']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].selected = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.HEATING_SYSTEM}";
		var key = $("select[name='HEATING_SYSTEM']>option");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].selected = true;
			}
		};
	})();
	
	(function(){
		var value = "${room.MOVE_IN_DATE}";
		var key = $("input[name='MOVE_IN_DATE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.UTILITY_CHECK}";
		var key = $("input[name='UTILITY_CHECK']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.UTILITY_PRICE}";
		var key = $("input[name='UTILITY_PRICE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = eval("["+"${room.UTILITY_TYPE}"+"]");
		var key = $("input.UTILITY_TYPE");
		for(var i=0;i<key.length;i++){
			for(var j=0;j<value.length;j++){
				if(key[i].value==value[j]){
					key[i].checked = true;
				};
			};
		};
	})();
	
	(function(){
		var value = "${room.PARKING}";
		var key = $("input[name='PARKING']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.PARKING_BILL}";
		var key = $("input[name='PARKING_BILL']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.PET}";
		var key = $("input[name='PET']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.ELEVATOR}";
		var key = $("input[name='ELEVATOR']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.BALCONY}";
		var key = $("input[name='BALCONY']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.BUILT_IN}";
		var key = $("input[name='BUILT_IN']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = eval("["+"${room.STRUCTURES}"+"]");
		var key = $("input.STRUCTURES");
		for(var i=0;i<key.length;i++){
			for(var j=0;j<value.length;j++){
				if(key[i].value==value[j]){
					key[i].checked = true;
				};
			};
		};
	})();
	
	(function(){
		var value = eval("["+"${room.OPTIONS}"+"]");
		var key = $("input.OPTIONS");
		for(var i=0;i<key.length;i++){
			for(var j=0;j<value.length;j++){
				if(key[i].value==value[j]){
					key[i].checked = true;
				};
			};
		};
	})();
	
	(function(){
		var value = "${room.LOAN_ACCESS}";
		var key = $("input[name='LOAN_ACCESS']");
		for(var i=0;i<key.length;i++){
			if(key[i].value==value){
				key[i].checked = true;
			};
		};
	})();
	
	(function(){
		var value = "${room.DESC_TITLE}";
		var key = $("input[name='DESC_TITLE']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.DESC_DETAIL}";
		var key = $("textarea[name='DESC_DETAIL']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
	
	(function(){
		var value = "${room.DESC_SECRET}";
		var key = $("textarea[name='DESC_SECRET']");
		for(var i=0;i<key.length;i++){
			key[i].value = value;
		};
	})();
});
</script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/room.css'/>"/>
<script type="text/javascript">
/* 건물 유형에 따라 선택 옵션 달라지게 */
/* 주소 API */
/* 전세/월세 선택하면 금액입력 창 뜨게 */
/* 평수 입력하면 m2으로 뜨고 m2입력하면 평수 뜨게 */
/* div 선택하면 라디오 체크되고 div 스타일 바뀜 */
/* 관리비 있음 누르면 UTILITY_PRICE 보이게 */
/* div 선택하면 체크박스 체크되고 div 스타일 바뀜 */
/* 주차여부 1이면 주차금액 변경불가에서 변경가능으로 바뀌게 */
/* 주차여부 0이면 주차금액 변경가능에서 변경불가로 바뀌고 밸류 삭제 */
/* 파일 등록할 때 이미지 파일만 등록되게 가능한가? 물론 가능하겠지.. */
/* 허위매물 제재 정책 링크 */
/* 등록된 파일 불러오기 */
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
	function submit(){
		var comSubmit = new ComSubmit(frm);
		comSubmit.setUrl("<c:url value='/room/regist'/>");
		/* EXPIRATION_DATE는 자바에서 오늘날짜+30일로 */
		comSubmit.addParam("MEM_ID",mem);
		comSubmit.submit(frm);
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/footer.jspf" %>
<%@ include file="room.jspf" %>
<div class="roomUpdate">

<div class="inform">
등록한 매물은 30일 동안 어쩌구~
</div>
<form id="frm">
<div class="table">
	<div class="thead">매물 종류</div>
	<div class="tbody">
		<div class="h">종류 선택</div>
		<div class="b">
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="원룸"><div class="button">원룸</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="투룸"><div class="button">투룸</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="쓰리룸"><div class="button">쓰리룸</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="오피스텔"><div class="button">오피스텔</div>
			<input type="radio" name="ROOM_TYPE" class="ROOM_TYPE" value="아파트"><div class="button">아파트</div>
		</div>
		<div class="h">건물 유형</div>
		<div class="b" id="building">
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="단독주택"><div class="button">단독주택</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="다가구주택"><div class="button">다가구주택</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="빌라/연립/다세대"><div class="button">빌라/연립/다세대</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="상가주택"><div class="button">상가주택</div>
		</div>
		<div class="b" id="building_office">
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="오피스텔"><div class="button">오피스텔</div>
			<input type="radio" name="BUILDING_TYPE" class="BUILDING_TYPE" value="도시형생활주택"><div class="button">도시형생활주택</div>
		</div>
		<div class="b" id="building_apart">
			<input type="hidden" name="BUILDING_TYPE" value="아파트">
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">위치 정보</div>
	<div class="tbody">
		<div class="h">주소</div>
		<div class="b">
			주소API 지도랑 같이
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">거래 정보</div>
	<div class="tbody">
		<div class="h">거래 종류</div>
		<div class="b">
			<div>
				<input type="radio" name="TRADE_TYPE" class="TRADE_TYPE" value="월세"><div class="button">월세</div>
				<input type="radio" name="TRADE_TYPE" class="TRADE_TYPE" value="전세"><div class="button">전세</div>
			</div>
			<div id="monthly">
				<input type="number" name="MONTHLY_DEPOSIT" id="MONTHLY_DEPOSIT" placeholder="보증금">/
				<input type="number" name="MONTHLY_PAYMENT" id="MONTHLY_PAYMENT" placeholder="월세"> 만원
			</div>
			<div id="jeonsediv">
				<input type="number" name="JEONSE" id="JEONSE" placeholder="전세"> 만원
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
				공급 면적 
				<input type="number" name="SUPPLY_SIZE_P" id="SUPPLY_SIZE_P"> 평 
				<input type="number" name="SUPPLY_SIZE" id="SUPPLY_SIZE"> m2
			</div>
			<div>
				전용 면적 
				<input type="number" name="REAL_SIZE_P" id="REAL_SIZE_P"> 평 
				<input type="number" name="REAL_SIZE" id="REAL_SIZE"> m2
			</div>
		</div>
		<div class="h">건물 층수</div>
		<div class="b">
			<div>
				건물 층수
				<select name="BUILDING_STORY" id="BUILDING_STORY">
					<option>--건물 층수 선택--</option>
					<c:forEach var="i" begin="1" end="50">
					<option value="${i}">${i}층</option>
					</c:forEach>
				</select>
			</div>
			<div>
				해당 층수
				<select name="ROOM_FLOOR" id="ROOM_FLOOR">
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
			<select name="HEATING_SYSTEM" id="HEATING_SYSTEM">
				<option>--난방 종류 선택--</option>
				<option value="1">중앙난방</option>
				<option value="2">개별난방</option>
				<option value="3">지역난방</option>
			</select>
		</div>
		<div class="h">입주 가능일</div>
		<div class="b"><input type="date" name="MOVE_IN_DATE" id="MOVE_IN_DATE"></div>
	</div>
</div>
<div class="table">
	<div class="thead">추가정보</div>
	<div class="tbody">
		<div class="h">관리비</div>
		<div class="b">
			<div>
				<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK" value="0"><div class="button">없음</div>
				<input type="radio" class="UTILITY_CHECK" name="UTILITY_CHECK" value="1"><div class="button">있음</div>
				<div class="UTILITY_PRICE">
				<input type="text" name="UTILITY_PRICE" id="UTILITY_PRICE"> 만원
				</div>
			</div>
			<div>
				관리비 항목
				<input type="checkbox" class="UTILITY_TYPE" value="1"><div class="c_button">인터넷</div>
				<input type="checkbox" class="UTILITY_TYPE" value="2"><div class="c_button">유선TV</div>
				<input type="checkbox" class="UTILITY_TYPE" value="3"><div class="c_button">청소비</div>
				<input type="checkbox" class="UTILITY_TYPE" value="4"><div class="c_button">수도세</div>
				<input type="checkbox" class="UTILITY_TYPE" value="5"><div class="c_button">도시가스</div>
				<input type="checkbox" class="UTILITY_TYPE" value="6"><div class="c_button">전기세</div>
				<input type="checkbox" class="UTILITY_TYPE" value="7"><div class="c_button">기타</div>
			</div>
		</div>
		<div class="h">주차여부</div>
		<div class="b">
			<input type="radio" class="PARKING" name="PARKING" value="0"><div class="button">불가능</div>
			<input type="radio" class="PARKING" name="PARKING" value="1"><div class="button">가능</div>
			<input type="number" name="PARKING_BILL" id="PARKING_BILL"> 만원
		</div>
		<div class="h">반려동물</div>
		<div class="b">
			<input type="radio" class="PET" name="PET" value="0"><div class="button">불가능</div>
			<input type="radio" class="PET" name="PET" value="1"><div class="button">가능</div>
		</div>
		<div class="h">엘리베이터</div>
		<div class="b">
			<input type="radio" class="ELEVATOR" name="ELEVATOR" value="0"><div class="button">없음</div>
			<input type="radio" class="ELEVATOR" name="ELEVATOR" value="1"><div class="button">있음</div>
		</div>
		<div class="h">베란다/발코니</div>
		<div class="b">
			<input type="radio" class="BALCONY" name="BALCONY" value="0"><div class="button">없음</div>
			<input type="radio" class="BALCONY" name="BALCONY" value="1"><div class="button">있음</div>
		</div>
		<div class="h">빌트인</div>
		<div class="b">
			<input type="radio" class="BUILT_IN" name="BUILT_IN" value="0"><div class="button">없음</div>
			<input type="radio" class="BUILT_IN" name="BUILT_IN" value="1"><div class="button">있음</div>
		</div>
		<div class="h">구조</div>
		<div class="b">
			<input type="checkbox" class="STRUCTURES" value="1"><div class="c_button">복층</div>
			<input type="checkbox" class="STRUCTURES" value="2"><div class="c_button">1.5룸/주방분리형</div>
		</div>
		<div class="h">옵션항목</div>
		<div class="b">
			<input type="checkbox" class="OPTIONS" value="1"><div class="c_button">에어컨</div>
			<input type="checkbox" class="OPTIONS" value="2"><div class="c_button">세탁기</div>
			<input type="checkbox" class="OPTIONS" value="3"><div class="c_button">침대</div>
			<input type="checkbox" class="OPTIONS" value="4"><div class="c_button">책상</div>
			<input type="checkbox" class="OPTIONS" value="5"><div class="c_button">옷장</div>
			<input type="checkbox" class="OPTIONS" value="6"><div class="c_button">TV</div>
			<input type="checkbox" class="OPTIONS" value="7"><div class="c_button">신발장</div>
			<input type="checkbox" class="OPTIONS" value="8"><div class="c_button">냉장고</div>
			<input type="checkbox" class="OPTIONS" value="9"><div class="c_button">가스레인지</div>
			<input type="checkbox" class="OPTIONS" value="10"><div class="c_button">인덕션</div>
			<input type="checkbox" class="OPTIONS" value="11"><div class="c_button">전자레인지</div>
			<input type="checkbox" class="OPTIONS" value="12"><div class="c_button">전자도어락</div>
			<input type="checkbox" class="OPTIONS" value="13"><div class="c_button">비데</div>
		</div>
		<div class="h">전세자금대출</div>
		<div class="b">
			<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS" value="0"><div class="button">불가능</div>
			<input type="radio" class="LOAN_ACCESS" name="LOAN_ACCESS" value="1"><div class="button">가능</div>
		</div>
	</div>
</div>
<div class="table">
	<div class="thead">상세설명</div>
	<div class="tbody">
		<div class="h">제목</div>
		<div class="b"><input type="text" name="DESC_TITLE" id="DESC_TITLE" placeholder="예)"></div>
		<div class="h">상세설명</div>
		<div class="b"><textarea name="DESC_DETAIL" id="DESC_DETAIL" placeholder="상세설명 작성 시 주의사항&#13;&#10;ㅇㅇ"></textarea></div>
		<div class="h">비공개 메모</div>
		<div class="b"><textarea name="DESC_SECRET" id="DESC_SECRET" placeholder="외부에 공개되지 않으며, 등록자에게만 보여지는 메모입니다."></textarea></div>
	</div>
</div>
<div class="table">
	<div class="thead">사진 등록</div>
	<div class="tbody">
		<div>
			- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)<br>
			- 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.<br>
			- 사진은 최소 1장 이상 등록해야 하며, 최대 15장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.
		</div>
		<div id="fileDiv">
			<p>
				<input type="file" id="file" name="file_0">
				<a href="#" class="btn" id="delete" name="delete">삭제</a>
			</p>
		</div>
		<a href="#addFile" class="btn" id="addFile" onclick="addFile();">파일 추가</a>
		<div class="caution">
			허위 매물을 등록할 경우 니내방에서 임의로 계정 및 매물 전체 삭제 처리됩니다.
			<a href="#">허위매물 제재 정책 확인하기</a>
		</div>
	</div>
</div>
</form>
<div class="check">
	<input type="checkbox" id="check">매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.
</div>

<a href="#" class="btn" onclick="submit();">매물 등록</a>
<a href="<c:url value='/room/adminRoom'/>" class="btn">취소</a>

</div>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>