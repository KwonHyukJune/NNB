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
	������� ���ȵȴٰ� ��ȿ��
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
	<h1>�� �����Ʈ ���� �����ϱ�</h1>
	<form id="frm" name="frm" method="post">
	<table>
		<colgroup><col width="150px"><col></colgroup>
		<tbody>
			<tr>
				<th>����</th>
				<td class="styled__Td-loqpne-0 fNOtpc">
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="gender" id="male" value="M">
						<p>����</p>
					</label>
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="gender" id="female" value="F">
						<p>����</p>
					</label>
				</td>
			</tr>
			<tr>
				<th>�������</th>
					<td class="ggZjqG">
						<input class="kTQnUD MOVE_IN_DATE" type="date" name="birth" id="birth" value="${map.RI_BIRTH}">
					</td>
			</tr>
			<tr>
				<th>�δ㰡�ɾ�</th>
					<td class="styled__Td-sc-1toww6o-0 iFmBhb">
						<div class="styled__Info-sc-1toww6o-5 bMtYCv">
							<input autocomplete="off" class="styled__Deposit-sc-1toww6o-7 fqDzuM Input-sfsekm-0 kTQnUD" name="loan_big" type="text" value="${map.RI_LOAN_BIG}">
							<p class="styled__Space-sc-1toww6o-8 ktwJnl">/</p>
							<input autocomplete="off" class="styled__Price-sc-1toww6o-9 ghUXBC Input-sfsekm-0 kTQnUD" name="loan_small" type="text" value="${map.RI_LOAN_SMALL}">
							<p class="styled__Won-sc-1toww6o-10 fIWZWk">���� <span>(�� ���� 1000����/50����)</span>
							</p>
						</div>
					</td>
			</tr>
			<tr>
				<th>���� ������</th>
					<td class="ggZjqG">
						<input class="kTQnUD MOVE_IN_DATE" type="date" name="MOVE_IN_DATE" id="move_in_date">
					</td>
			</tr>
			<tr>
				<th>��ȣ ����</th>
				<td class="ggZjqG">
					<div class="h">
						��ȣ����
						<button type="button" onclick="fn_addRegion($(this))">�߰�</button>
					</div>
					<div class="b" id="region">
						<input class="kTQnUD" type="text" readonly="readonly" name="region1" id="region1">
					</div>
					<div class="fUXvpI addressarea">   </div>
					<input type="hidden" name="RI_REGION1" id="sample6_address" size="50" placeholder="�ּ�">

					<div class="map_wrap">
    					<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">  </div>
    					<div class="hAddr">
        						<span class="title">�����߽ɱ��� ������ �ּ�����</span>
        						<span id="centerAddr"></span>
    					</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>�ڱ� �Ұ�</th>
					<td class="ggZjqG">
						<textarea class="kTQnUD" name="profile" id="profile" style="margin: 0px; width: 658px; height: 193px; padding:10px 15px;"></textarea>
					</td>
			</tr>
			<tr>
				<th>�˻� ���� ����</th>
				<td class="styled__Td-loqpne-0 fNOtpc">
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="expose" id="Y" value="1">
						<p>����</p>
					</label>
					<label class="styled__Radio-loqpne-1 bVNPCb styled__RadioBtn-j1kyvo-0 fSFsCh">
						<input type="radio" name="expose" id="N" value="0">
						<p>�Ұ���</p>
					</label>
				</td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="RI_MEM_ID" value="${map.RI_MEM_ID}"/>
	</form>
</div>
<div style="text-align:center">
<button class="styled__EditBtn-qdiane-19 gsJtOS styled__Btn-qdiane-17 ejTRmD" type="button" onclick="fn_submit();" style=":center;'">���</button>
</div>
<br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 1 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//�Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
var mapTypeControl = new kakao.maps.MapTypeControl();

// ������ ��Ʈ���� �߰��ؾ� �������� ǥ�õ˴ϴ�
// kakao.maps.ControlPosition�� ��Ʈ���� ǥ�õ� ��ġ�� �����ϴµ� TOPRIGHT�� ������ ���� �ǹ��մϴ�
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�

// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>���� �ּ� : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">������ �ּ�����</span>' + 
                            detailAddr + 
                        '</div>';
            
            var count = $("#region").children().length;
            console.log(count);
            $("#region"+count).val(result[0].address.address_name);
                   
            // ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
            infowindow.setContent(content);
            infowindow.open(map, marker);
            document.getElementById("sample6_address").value = result[0].address.address_name;
            str = "<p><span>���θ�:</span>" + result[0].road_address.address_name + "</p>"
        	+ "<p><span>����:</span>" + result[0].address.address_name + "</p>";
        	$(".addressarea").html(str);
        }   
    });
});

// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // �������� region_type ���� 'H' �̹Ƿ�
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>
<script type="text/javascript">
/* ��忡 �ᵵ �ǳ�? */
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
