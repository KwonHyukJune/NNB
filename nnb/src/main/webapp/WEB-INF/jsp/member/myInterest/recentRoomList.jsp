<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
<script type="text/javascript">
/* 	$(document).ready(function(){
		$("#select").on("click",function(e){
			e.preventDefault();
			fn_select();
		});
	});
	function fn_select(){
		var conSubmit = new ComSubmit(frm);
		conSubmit.setUrl("<c:url value='/search/detailRoom'/>");
		conSubmit.addParam("ROOM_NUM",${ROOM_NUM});
		conSubmit.submit();
	}; */
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
/* ㅋㅋ써야됨 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myInterest.jspf" %>
<div class="recentRoomList">

<p>총 <span>${count}</span>개의 최근 본 방이 있습니다.</p>
<c:if test="${count!=0}">
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
	<a href="<c:url value='/room/roomDetail?ROOM_NUM=${room.ROOM_NUM}'/>">
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
<c:if test="${count eq 0}">
<a href="<c:url value='/search/openSearchRoomList'/>" class="btn">방 보러가기</a>
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
