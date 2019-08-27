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
	function fn_addFav(obj){
		var str = window.location.href;
		var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
		var num = obj.children('#num').text();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/search/addFavRoom'/>");
		comSubmit.addParam("check", 0);
		comSubmit.addParam("ROOM_NUM", num);
		comSubmit.addParam("MEM_ID", idChk);
		comSubmit.addParam("url", url);
		comSubmit.submit();
	}
	function fn_deleteFav(obj){
		var str = window.location.href;
		var url = "redirect:"+str.split("<%=request.getContextPath()%>")[1];
		var num = obj.children('#num').text();
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/search/addFavRoom'/>");
		comSubmit.addParam("check", 1);
		comSubmit.addParam("ROOM_NUM", num);
		comSubmit.addParam("MEM_ID", idChk);
		comSubmit.addParam("url", url);
		comSubmit.submit();
	}
/* ㅋㅋ써야됨 */
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myInterest.jspf" %>
<div class="recentRoomList">

<p>총 <span id="count"></span>개의 최근 본 방이 있습니다.</p>
<div class="roomList">
	<ul id="roomList"></ul>
</div>
<div id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX">
</div>
<br>
<div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
	$("#PAGE_INDEX").val(PAGE_INDEX);
	fn_selectRecentRoomList(PAGE_INDEX);
});
	function fn_selectRecentRoomList(pageNo){
		var comAjax = new ComAjax(); 
		comAjax.setUrl("<c:url value='/myInterest/recentRoomList'/>"); 
		comAjax.setCallback("fn_selectRecentRoomListCallback"); 
		comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
		comAjax.addParam("PAGE_ROW", 15); 
		comAjax.ajax(); 
	}
	
	function fn_selectRecentRoomListCallback(data){ 
		var total = data.total;
		var body = $("ul#roomList"); 
		body.empty(); 
		
		if(total == 0){ 
			$("#count").empty();
			$("#count").append('0');
			var str = "<a href='<c:url value='/search/openSearchRoomList'/>' class='btn'>방 보러가기</a>"; 
			body.append(str); 
	        	
		} else{ 
			var params = { 
				divId : "PAGE_NAVI", 
				pageIndex : "PAGE_INDEX", 
				totalCount : total, 
				eventName : "fn_selectRecentRoomList" 
				}; 
			
			gfn_renderPaging(params); 
				var str = "";
				var count = data.total;
				$("#count").empty();
				$("#count").append(count);
				$.each(data.list, function(key, room){ 
					str	+=	"<li>"
						+	"<div>";	//position:relative 해야 div.fav가 잘 붙음
					str	+=	"<div class='fav'>";
					if(room.ROOM_NUM in data.favRoom){
					str	+=		"<div class='deleteFav' onclick='fn_deleteFav($(this))'>"
						+			"<div id='num' style='display:none;'>"
						+				room.ROOM_NUM
						+			"</div>"
						+		"</div>";
					}else{
					str +=		"<div class='insertFav' onclick='fn_addFav($(this))'>"
						+			"<div id='num' style='display:none;'>"
						+				room.ROOM_NUM
						+			"</div>"
						+		"</div>";	
					}
					str	+=	"</div>"
						+	"<a href='<c:url value='/room/roomDetail?ROOM_NUM=" + room.ROOM_NUM + "'/>'>"
							+	"<div class='img'>"
							+		"<img src='<c:url value='/roomImages/" + room.THUMBNAIL + "'/>'>"
							+	"</div>"
							+	"<div>" + room.ROOM_TYPE + "</div>"
							+	"<div>"
							+		room.TRADE_TYPE;
					if(room.TRADE_TYPE=='월세')
						str	+=		room.MONTHLY_DEPOSIT + "/" + room.MONTHLY_PAYMENT;
					if(room.TRADE_TYPE=='전세')
						str	+=		room.JEONSE;
					str	+=		"</div>"
						+		"<div>"
						+			room.ROOM_FLOOR + "층, " + room.REAL_SIZE + "m2, ";
					if(room.UTILITY_PRICE!=null && room.UTILITY_PRICE!='')
						str	+=		room.UTILITY_PRICE만;
					str	+=		"</div>"
						+		"<div>" + room.DESC_TITLE + "</div>"
						+	"</a>"
						+"</div>"
						+"</li>";
	        	}); 
	        	body.append(str); 
			} 
	}
</script>

</body>
</html>
