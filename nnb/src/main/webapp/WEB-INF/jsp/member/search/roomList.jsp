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
	<div class="select">�� ����</div>
	<div class="select">�ŷ� ����</div>
	<div class="select">���ݴ�</div>
	<div class="select">������</div>
	<div class="select">��ũ��</div>
	<div class="select">�߰�����</div>
	<div class="option" id="roomType">
		<div>������</div>
		<div>�ߺ������� �����մϴ�.</div>
		<div>
			<input type="checkbox" class="ROOM_TYPE" value="����">����
			<input type="checkbox" class="ROOM_TYPE" value="����">����
			<input type="checkbox" class="ROOM_TYPE" value="������">������
			<input type="checkbox" class="ROOM_TYPE" value="���ǽ���">���ǽ���
			<input type="checkbox" class="ROOM_TYPE" value="����Ʈ">����Ʈ
		</div>
	</div>
	<div class="option" id="tradeType">
		<div>�Ź� ����</div>
		<div>�ߺ������� �����մϴ�.</div>
		<div>
			<input type="checkbox" class="TRADE_TYPE" value="����">����
			<input type="checkbox" class="TRADE_TYPE" value="����">����
		</div>
	</div>
	<div class="option" id="price">
		<div>������/������</div>
		<div>
			<input type="number" name="MONTHLY_DEPOSIT_MIN" id="MONTHLY_DEPOSIT_MIN">
			<input type="number" name="MONTHLY_DEPOSIT_MAX" id="MONTHLY_DEPOSIT_MAX">
			<input type="number" name="JEONSE_MIN" id="JEONSE_MIN">
			<input type="number" name="JEONSE_MAX" id="JEONSE_MAX">
		</div>
		<div>����</div>
		<div>
			<input type="number" name="MONTHLY_PAYMENT_MIN" id="MONTHLY_PAYMENT_MIN">
			<input type="number" name="MONTHLY_PAYMENT_MAX" id="MONTHLY_PAYMENT_MAX">
		</div>
	</div>
	<div class="option" id="utilityPrice">
		<div>������</div>
		<div>
			<input type="number" name="UTILITY_PRICE_MIN" id="UTILITY_PRICE_MIN">
			<input type="number" name="UTILITY_PRICE_MAX" id="UTILITY_PRICE_MAX">
		</div>
	</div>
	<div class="option" id="size">
		<div>��ũ��</div>
		<div>
			<input type="number" name="REAL_SIZE_MIN" id="REAL_SIZE_MIN">
			<input type="number" name="REAL_SIZE_MAX" id="REAL_SIZE_MAX">
		</div>
	</div>
	<div class="option" id="additional">
		<div>����</div>
		<div>
			<input type="checkbox" class="ROOM_FLOOR" value="" checked="checked">��ü
			<input type="checkbox" class="ROOM_FLOOR" value="1">1��
			<input type="checkbox" class="ROOM_FLOOR" value="2">2��
			<input type="checkbox" class="ROOM_FLOOR" value="3">3��
			<input type="checkbox" class="ROOM_FLOOR" value="4">4��
			<input type="checkbox" class="ROOM_FLOOR" value="5">5��
			<input type="checkbox" class="ROOM_FLOOR" value="6">6��
			<input type="checkbox" class="ROOM_FLOOR" value="7">7�� �̻�
			<input type="checkbox" class="ROOM_FLOOR" value="������">������
			<input type="checkbox" class="ROOM_FLOOR" value="��ž��">��ž��
		</div>
		<div>�� ����</div>
		<div>
			<input type="checkbox" class="STRUCTURES" value="2">�ֹ� �и���(1.5��)
			<input type="checkbox" class="STRUCTURES" value="1">����
		</div>
		<div>�߰��ɼ�</div>
		<div>�ߺ������� �����մϴ�.</div>
		<div>
			<input type="checkbox" class="PARKING" value="1">��������
			<input type="checkbox" class="PET" value="1">�ݷ�����
			<input type="checkbox" class="ELEVATOR" value="1">����������
			<input type="checkbox" class="BALCONY" value="1">������/���ڴ�
			<input type="checkbox" class="BUILT_IN" value="1">��Ʈ��
			<input type="checkbox" class="OPTIONS" value="1,2,8,9">Ǯ�ɼ�
			<input type="checkbox" class="LOAN_ACCESS" value="1">�����ڱݴ���
		</div>
	</div>
</div>
   <div>��ü �� ${count}��</div>
<div class="selectSearchRoomList">

</div>

<div id="PAGE_NAVI">  </div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

<br>

<div id="map"style="width: 50%; height: 300px; margin-top: 10px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e603a6f6c5db5707c8168383f3516651&libraries=services,clusterer,drawing"></script>
	<c:forEach var="address" items="${list}">
		<script>
            var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
            mapOption = { 
             center: new kakao.maps.LatLng(37.502541, 127.024711), // ������ �߽���ǥ
             level: 3 // ������ Ȯ�� ����
            };
            var map = new kakao.maps.Map(mapContainer, mapOption); //������ �̸� ����
            var geocoder = new kakao.maps.services.Geocoder(); // �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
            
            geocoder.addressSearch('${address.ADDRESS1}', function(result, status) { // �ּҷ� ��ǥ�� �˻��մϴ�
               // ���������� �˻��� �Ϸ������ 
            if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
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
		var str = "<div class='roomList'>" + "��ȸ�� ����� �����ϴ�. </div>"; 
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
								+ value.ROOM_FLOOR + "��," + value.SUPPLY_SIZE+ "m2,"
									+ "������  "+ value.UTILITY_PRICE + "��"
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