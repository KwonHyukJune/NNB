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
	Map<String,Object> room1 = new HashMap<String,Object>();
	room1.put("check","0");
	room1.put("ROOM_NUM","1");
	room1.put("STD_NAME","room1.png");
	room1.put("ROOM_TYPE","원룸");
	room1.put("TRADE_TYPE","월세");
	room1.put("MONTHLY_DEPOSIT","300");
	room1.put("MONTHLY_PAYMENT","30");
	room1.put("ROOM_FLOOR","2");
	room1.put("REAL_SIZE","20");
	room1.put("UTILITY_PRICE","5");
	room1.put("DESC_TITLE","싸다싸");
	Map<String,Object> room2 = new HashMap<String,Object>();
	room2.put("check","1");
	room2.put("ROOM_NUM","2");
	room2.put("STD_NAME","room1.png");
	room2.put("ROOM_TYPE","원룸");
	room2.put("TRADE_TYPE","전세");
	room2.put("JEONSE","3000");
	room2.put("ROOM_FLOOR","2");
	room2.put("REAL_SIZE","20");
	room2.put("DESC_TITLE","싸다싸");
	
	List<Map<String,Object>> roomList = new ArrayList<Map<String,Object>>();
	roomList.add(room1);
	roomList.add(room2);
	
	int count = roomList.size();
	request.setAttribute("count", count);
	request.setAttribute("roomList",roomList);
%>
<!-- 테스트용 세팅 끝 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
<script type="text/javascript">
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/search/list/addFavRoom'/>");
		comAjax.addParam("ROOM_NUM",num);
		comAjax.ajax();
	};
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/search/list/deleteFavRoom'/>");
		comAjax.addParam("ROOM_NUM",num);
		comAjax.ajax();
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myInterest.jspf" %>


<div class="favRoomList">

<p>총 ${count}개의 찜한 방이 있습니다.</p>
<c:if test="${count!=null && count!=''}">
	<div class="roomList">
	<c:forEach var="room" items="${roomList}">
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
		<a href="<c:url value='/search/detailRoom?num=${room.ROOM_NUM}'/>">
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
</c:if>
<c:if test="${count==null || count==''}">
<a href="<c:url value='/search/roomList'/>" class="btn">방 보러가기</a>
</c:if>

<%-- <div class="page">
	${pageHtml}
</div> --%>
	
</div>
<br>
<div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
