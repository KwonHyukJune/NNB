<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%-- <!-- �׽�Ʈ�� ���� -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> room = new HashMap<String,Object>();
	room.put("ROOM_NUM","1");
	room.put("TRADE_STATUS","������");
	room.put("ROOM_TYPE","����");
	room.put("BUILDING_TYPE","�ܵ�����");
	room.put("TRADE_TYPE","����");
	room.put("MONTHLY_DEPOSIT","300");
	room.put("MONTHLY_PAYMENT","30");
	room.put("SUPPLY_SIZE","20");
	room.put("REAL_SIZE","20");
	room.put("BUILDING_STORY","20");
	room.put("ROOM_FLOOR","3");
	room.put("HEATING_SYSTEM","1");
	room.put("MOVE_IN_DATE","2019-08-08");	//������ �̷��� �޾ƾ� ��;;
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
	room.put("DESC_TITLE","�δٽ�");
	room.put("DESC_DETAIL","�̰��ݿ� �̸��� ����Ƽ");
	room.put("DESC_SECRET","�̳�");
	room.put("UPLOAD_DATE","2019-07-31");
	room.put("HIT_COUNT","4");
	room.put("FAV_COUNT","1");
	
	List<Map<String,Object>> roomList = new ArrayList<Map<String,Object>>();
	roomList.add(room);
	
	request.setAttribute("roomList", roomList);
	request.setAttribute("count",1);
%>
<!-- �׽�Ʈ�� ���� �� --> --%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/room.css'/>"/>
<script type="text/javascript">
/* ��ư�� ��ũ */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="room.jspf" %>

<div class="adminRoom">

<div class="inform">
<ul>
	<li>�Ϲ�ȸ���� 1���� �Ź��� ����� �����մϴ�. ����� �Ź��� �ִ� 30�ϱ��� ���� �� �ŷ��Ϸ�˴ϴ�.</li>
	<li>������ : ���� ����� �Ź��� �������� ����</li>
	<li>�ŷ��Ϸ� : ����� �Ź��� �ŷ��Ϸ�� ����</li>
	<li>�˼��ݷ� : ���Ģ ���� �Ǵ� �Ű�� ������� ����</li>
</ul>
</div>

<c:if test="${roomCount!=null && roomCount!=''}">
<c:forEach var="room" items="${list}">
	<div class="room">
		<div class="content">
			<div>�Ź���ȣ</div>
			<div>${room.ROOM_NUM}</div>
			<div>${room.TRADE_STATUS}</div>
		</div>
		<div class="content">
			<c:if test="${room.TRADE_TYPE=='����'}">
			<div>${room.ROOM_TYPE} ${room.TRADE_TYPE} ${room.MONTHLY_DEPOSIT}/${room.MONTHLY_PAYMENT}</div>
			</c:if>
			<c:if test="${room.TRADE_TYPE=='����'}">
			<div>${room.ROOM_TYPE} ${room.TRADE_TYPE} ${room.JEONSE}</div>
			</c:if>
		</div>
		<div class="content">
			<div>����� �޸�</div>
			<div>${room.DESC_SECRET}</div>
		</div>
		<div class="content">
			<div>����� ${room.UPLOAD_DATE} / ��ȸ�� ${room.HIT_COUNT} / �� ${room.FAV_COUNT}</div>
			<div>
				<a href="#" class="btn" onclick="">����</a>
				<a href="#" class="btn" onclick="">����</a>
				<c:if test="${room.TRADE_STATUS=='������'}">
				<a href="#" class="btn" onclick="">��������</a>
				<a href="#" class="btn" onclick="">�ŷ��Ϸ�</a>
				</c:if>
				<c:if test="${room.TRADE_STATUS=='��������'}">
				<a href="#" class="btn" onclick="">�����簳</a>
				<a href="#" class="btn" onclick="">�ŷ��Ϸ�</a>
				</c:if>
				<c:if test="${room.TRADE_STATUS=='�ŷ��Ϸ�'}">
				<a href="#" class="btn" onclick="">�����簳</a>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
</c:if>
<c:if test="${count==null || count==''}">
	��ϵ� �Ź��� �����ϴ�.<br>
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