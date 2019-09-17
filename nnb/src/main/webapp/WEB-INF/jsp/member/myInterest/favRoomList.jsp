<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myInterest.jspf" %>
<script type="text/javascript">
$('.tabmenu:nth-child(2)').addClass('active');
</script>

<div style="text-align:center;" class="favRoomList hVYleu">

<div class="jZuXcw">
	<p class="fxSxol">총 <span id="count"></span>개의 찜한 방이 있습니다.</p>
</div>

<ul id="roomList" class="hHBQOD"></ul>
<div id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX">
	
</div>
<br>
<div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
<script type="text/javascript">
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
$(document).ready(function() {
	var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
	$("#PAGE_INDEX").val(PAGE_INDEX);
	fn_selectFavRoomList(PAGE_INDEX);
});
	function fn_selectFavRoomList(pageNo){
		var comAjax = new ComAjax(); 
		comAjax.setUrl("<c:url value='/myInterest/openFavRoomList'/>"); 
		comAjax.setCallback("fn_selectFavRoomListCallback"); 
		comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val()); 
		comAjax.addParam("PAGE_ROW", 15); 
		comAjax.ajax(); 
	}
	
	function fn_selectFavRoomListCallback(data){ 
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
				eventName : "fn_selectFavRoomList" 
				}; 
			
			gfn_renderPaging(params); 
				var str = "";
				var count = data.total;
				$("#count").empty();
				$("#count").append(count);
				$.each(data.list, function(key, room){ 
					str	+=	"<div class='laZlue'>"
						+	"<div class='OUJOU'>"	//position:relative 해야 div.fav가 잘 붙음
						+	"<div class='fav'>"
						+		"<div class='deleteFav' onclick='fn_deleteFav($(this))'>"
						+			"<div id='num' style='display:none;'>"
						+				room.ROOM_NUM
						+			"</div>"
						+		"</div>"
						+	"</div>"
						+	"<a href='<c:url value='/room/roomDetail?ROOM_NUM=" + room.ROOM_NUM + "'/>' class='kpKjGs'>"
							+	"<div class='img iCdwvo'>"
							+		"<img src='<c:url value='/roomImages/" + room.THUMBNAIL + "'/>'>"
							+	"</div>"
							+	"<p class='kCTBqT jBkVAv'>" + room.ROOM_TYPE + "</p>"
							+	"<p class='glovZ jBkVAv'><span>"
							+		room.TRADE_TYPE;
					if(room.TRADE_TYPE=='월세')
						str	+=		room.MONTHLY_DEPOSIT + "/" + room.MONTHLY_PAYMENT;
					if(room.TRADE_TYPE=='전세')
						str	+=		room.JEONSE;
					str	+=		"</span></p>"
						+		"<p class='jBkVAv'>"
						+			room.ROOM_FLOOR + "층, " + room.REAL_SIZE + "m2";
					if(room.UTILITY_PRICE!=null && room.UTILITY_PRICE!='')
						str	+=		", " + room.UTILITY_PRICE+'만';
					str	+=		"</p>"
						+		"<p class='jBkVAv'>" + room.DESC_TITLE + "</p>"
						+	"</a>"
						+"</div>"
						+"</div>";
	        	}); 
	        	body.append(str); 
			} 
	}
</script>
</body>
</html>
