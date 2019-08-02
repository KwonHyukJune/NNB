<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>"/>
<script type="text/javascript">
/* �߰�����-���� : ��ü ������ �ٸ��� üũ�����ǰ� �ٸ��� ������ ��ü �����ǰ� */
/* �߰�����-���� : 7�� �̻��� ��� ���� ���� */
/* �߰�����-�汸�� : ������ ���� �߰� */
/* �߶�����-�߰��ɼ� : Ǯ�ɼ� ��� ���� */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="roomList">

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

<div id="searchResult">
	<div>���ǿ� �´� �� ${count}��</div>
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
				<c:if test="${room.TRADE_TYPE=='����'}">
				${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}
				</c:if>
				<c:if test="${room.TRADE_TYPE=='����'}">
				${room.JEONSE}
				</c:if>
			</div>
			<div>
				${room.ROOM_FLOOR}��, ${room.REAL_SIZE}m2,
				<c:if test="${room.UTILITY_PRICE!=null && room.UTILITY_PRICE!=''}">
				������ ${room.UTILITY_PRICE}��
				</c:if>
			</div>
			<div>${room.DESC_TITLE}</div>
		</a>
		</div>
		</c:forEach>
	</div>
</div>

<div id="map">
���� ����..�Ѥ�
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