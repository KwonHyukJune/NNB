<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>룸메이트 등록</title>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

</head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="title">룸메이트 정보 등록</div>

<form id="frm" name="frm" method="post" action="registMyProfile">
<div class="h">성별</div>
<div class="b">
	<input type="radio" name="gender" value="M">남
	<input type="radio" name="gender" value="F">여
</div>
<div class="h">부담가능금액</div>
<div class="b">
	보증금: <input type="number" name="loan_big" id="loan_big">만원<br>
	월세: <input type="number" name="loan_small" id="loan_small">만원
</div>
<div class="h">
선호지역
	<button type="button" onclick="fn_addRegion($(this))">추가</button>
</div>
<div class="b" id="region">
	<input type="text" readonly="readonly" name="region1" id="region1">
</div>

<!----------------------------------------------------------------------------------------------------->

<br><br><br><br><br><br>
<div class="fUXvpI addressarea">   </div>
<input type="hidden" name="RI_REGION1" id="sample6_address" size="50"
	placeholder="주소">

<div class="map_wrap">
    <div id="map" style="width:50%;height:100%;position:relative;overflow:hidden;">  </div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>

<!----------------------------------------------------------------------------------------------------->
<br><br><br><br><br><br>
<div class="b">
</div>
<div class="h">생년월일</div>
<div class="b">
	<c:set var="nowTime" value="<%=new Date() %>"/>
	<fmt:formatDate value="${nowTime}" type="date" var="currentYear" pattern="yyyy"/>
	<select id="birth_year" name="birth_year">
		<c:forEach var="i" begin="1900" end="${currentYear}">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>년
	<select id="birth_month" name="birth_month">
		<c:forEach var="i" begin="1" end="12">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>월
	<select id="birth_date" name="birth_date">
		<c:forEach var="i" begin="1" end="31">
		<option value="${i}">${i}</option>
		</c:forEach>
	</select>일
</div>
<div class="h">입주시기</div>
<div class="b">
	<input type="date" id="date_start" name="date_start"> ~ 
	<input type="date" id="date_end" name="date_end">
</div>
<div class="h">자기소개</div>
<div class="b"><textarea name="profile"></textarea></div>
<div class="h">검색 노출 여부</div>
<div class="b">
<input type="radio" name="expose" value="1">가능
<input type="radio" name="expose" value="0">블가능
</div>
</form>

<button type="button" onclick="fn_submit();">등록</button>
<a href="#" id="submit" class="btn">등록</a>
<a href="<c:url value='/myPage/myProfile'/>">취소</a>

<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>


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
$(document).ready(function(){
	$("#submit").on("click",function(e){
		e.preventDefault();
		fn_submit();
	});
});

function fn_submit(){
	var conSubmit = new ComSubmit("frm");
	conSubmit.setUrl("<c:url value='/myPage/registMyProfile'/>");
	conSubmit.submit();
};

function fn_addRegion(obj){
	var count = obj.parent().next().children().length + 1;
	if(count<=3){
		var str = "<div>"
				+ "<input type='text' readonly='readonly' name='region"+count+"' id='region"+count+"'>"
				+ "<button type='button' onclick='fn_deleteRegion($(this))'>삭제</button>"
				+ "</div>";
		obj.parent().next().append(str);
	}else{
		obj.siblings("span").remove();
		obj.parent().append("<span style='color:red;'></span>");
		obj.siblings("span").text("선호지역은 최대 3개까지 설정 가능합니다.");
	}
}

function fn_deleteRegion(obj){
	obj.parent().remove();
}

function fn_submit(){
	var year = $("#birth_year option:selected").val();
	var month = $("#birth_month option:selected").val();
	if(month.length==1){
		month = "0"+month;
	}
	var date = $("#birth_date option:selected").val();
	if(date.length==1){
		date = "0"+date;
	}
	var birth = year.toString()+month.toString()+date.toString();
	$("#frm").append("<input type='hidden' name='birth' value='"+birth+"'>");
	frm.submit();
}
</script>
</body>
</html>
