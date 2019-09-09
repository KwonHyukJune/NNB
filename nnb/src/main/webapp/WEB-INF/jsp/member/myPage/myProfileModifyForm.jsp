<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/room.css'/>" />
<script type="text/javascript">
$(document).ready(function(){
	$('#amyProfile').addClass('active');
}); 
</script>
<script type="text/javascript">
	var memId = sessionStorage.getItem("MEM_ID");
	function fn_submit(){
		var conSubmit = new ComSubmit("frm");
		conSubmit.setUrl("<c:url value='/myPage/myProfileModify'/>");
		conSubmit.submit();
	};
	/*
	빈공간으 ㄴ안된다고 유효성
	*/
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>


<div class="myProfileModifyForm cAeKOJ">
<%@ include file="myPage.jspf" %>
<br>
<br>
<div class="styled__Box-sc-1etgh1k-1 etFHhl" name="roomType">
	<h1>내 룸메이트 정보 변경하기</h1>
	<form id="frm" name="frm" method="post">
	<table>
		<colgroup><col width="150px"><col></colgroup>
		<tbody>
			<tr>
				<th>성별</th>
				<td class="styled__Td-loqpne-0 fNOtpc">
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="gender" id="male" value="M">
						<p>남자</p>
					</label>
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="gender" id="female" value="F">
						<p>여자</p>
					</label>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
					<td class="ggZjqG">
						<input class="kTQnUD MOVE_IN_DATE" type="date" name="birth" id="birth" value="${map.RI_BIRTH}">
					</td>
			</tr>
			<tr>
				<th>부담가능액</th>
					<td class="styled__Td-sc-1toww6o-0 iFmBhb">
						<div class="styled__Info-sc-1toww6o-5 bMtYCv">
							<input autocomplete="off" class="styled__Deposit-sc-1toww6o-7 fqDzuM Input-sfsekm-0 kTQnUD" name="loan_big" type="text" value="${map.RI_LOAN_BIG}">
							<p class="styled__Space-sc-1toww6o-8 ktwJnl">/</p>
							<input autocomplete="off" class="styled__Price-sc-1toww6o-9 ghUXBC Input-sfsekm-0 kTQnUD" name="loan_small" type="text" value="${map.RI_LOAN_SMALL}">
							<p class="styled__Won-sc-1toww6o-10 fIWZWk">만원 <span>(예 월세 1000만원/50만원)</span>
							</p>
						</div>
					</td>
			</tr>
			<tr>
				<th>입주 가능일</th>
					<td class="ggZjqG">
						<input class="kTQnUD MOVE_IN_DATE" type="date" name="MOVE_IN_DATE" id="move_in_date">
					</td>
			</tr>
			<tr>
				<th>선호 지역</th>
				<td class="ggZjqG">
					<div class="h">
						선호지역
						<button type="button" onclick="fn_addRegion($(this))">추가</button>
					</div>
					<div class="b" id="region">
						<input class="kTQnUD" type="text" readonly="readonly" name="region1" id="region1">
					</div>
					<div class="fUXvpI addressarea">   </div>
					<input type="hidden" name="RI_REGION1" id="sample6_address" size="50" placeholder="주소">

					<div class="map_wrap">
    					<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">  </div>
    					<div class="hAddr">
        						<span class="title">지도중심기준 행정동 주소정보</span>
        						<span id="centerAddr"></span>
    					</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>자기 소개</th>
					<td class="ggZjqG">
						<textarea class="kTQnUD" name="profile" id="profile" style="margin: 0px; width: 658px; height: 193px; padding:10px 15px;"></textarea>
					</td>
			</tr>
			<tr>
				<th>검색 노출 여부</th>
				<td class="styled__Td-loqpne-0 fNOtpc">
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="expose" id="Y" value="1">
						<p>가능</p>
					</label>
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="expose" id="N" value="0">
						<p>불가능</p>
					</label>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="RI_MEM_ID" value="${map.RI_MEM_ID}"/>
	</form>
</div>
<div style="text-align:center">
<button class="styled__EditBtn-qdiane-19 gsJtOS styled__Btn-qdiane-17 ejTRmD" type="button" onclick="fn_submit();" style=":center;'">등록</button>
</div>
<br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';
            
            var count = $("#region").children().length;
            console.log(count);
            $("#region"+count).val(result[0].address.address_name);
                   
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            document.getElementById("sample6_address").value = result[0].address.address_name;
            str = "<p><span>도로명:</span>" + result[0].road_address.address_name + "</p>"
        	+ "<p><span>지번:</span>" + result[0].address.address_name + "</p>";
        	$(".addressarea").html(str);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>
<script type="text/javascript">
/* 헤드에 써도 되나? */
window.onload = function(){

	if(${map.RI_GENDER=="M"}){
		$("#male").checked = true;
	};
	if(${map.RI_GENDER=="F"}) {
		$("#female").checked = true;
	};
	
	if(${map.RI_LOAN_BIG!=null || map.RI_LOAN_BIG!=""}){
		$("#loan_big").prop("value","${map.RI_LOAN_BIG}");
	};
	
	if(${map.RI_LOAN_SMALL!=null || map.RI_LOAN_SMALL!=""}){
		$("#loan_small").prop("value","${map.RI_LOAN_SMALL}");
	};
	
	var b_year = "${map.RI_BIRTH}".slice(0,4);
	if("${map.RI_BIRTH}".slice(4,5)==0){
		var b_month = "${map.RI_BIRTH}".slice(5,6);
	}else{
		var b_month = "${map.RI_BIRTH}".slice(4,6);
	};
	
	if("${map.RI_BIRTH}".slice(6,7)==0){
		var b_date = "${map.RI_BIRTH}".slice(7,8);
	}else{
		var b_date = "${map.RI_BIRTH}".slice(6,8);
	};
	if(${map.RI_BIRTH!=null || map.RI_BIRTH!=""}){
		document.querySelector('#birth_year').value = b_year;
		document.querySelector('#birth_month').value = b_month;
		document.querySelector('#birth_date').value = b_date;
	};
	if(${map.RI_DATE_START!=null || map.RI_DATE_START!=""}){
		document.querySelector('#date_start').value = "${map.RI_DATE_START}";
	};
	if(${map.RI_DATE_END!=null || map.RI_DATE_END!=""}){
		document.querySelector('#date_end').value = "${map.RI_DATE_END}";
	};
	if(${map.RI_PROFILE!=null || map.RI_PROFILE!=""}){
		$("#profile").prop("value","${map.RI_PROFILE}");
	};
	if(${map.RI_EXPOSE==1}){
		$("#Y").prop("checked",true);
	}else if(${map.RI_EXPOSE==0}){
		$("#N").prop("checked",true);
	};
};
</script>

<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
