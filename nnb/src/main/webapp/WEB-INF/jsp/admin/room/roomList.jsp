<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>방 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminNotice.css'/>"/>	
<style type="text/css">
li.room{
    line-height: 60px;
    height: 60px;
}
.dd{
    display: table;
    width: 100%;
}
.dd > div {
    display: table-cell;
    text-align: center;
    border-right: 1px solid rgb(226, 226, 226);
}
.dd > div:nth-child(1) {
    width: 10%;
}
.dd > div:nth-child(2) {
    width: 20%;
}
.dd > div:nth-child(3) {
    width: 15%;
}
.dd > div:nth-child(4) {
    width: 30%;
}
.dd > div:nth-child(5) {
    width: 25%;
    border-right: 0px;
}
.fLTNNO {
    width: 100%;
    height: 48px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(204, 204, 204);
    border-image: initial;
    display: flex;
}
.fLTNNO > button{
	height: 100%;
    color: rgb(34, 34, 34);
    font-size: 14px;
    background-color: transparent;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
    width: 50%;
}
.fLTNNO> button+button {
    border-left: 1px solid rgb(204, 204, 204);
}
.idxnWu {
    display: table-cell;
    width: 292px;
    height: 60px;
    vertical-align: middle;
    position: relative;
    padding: 0px 22px;
}
#PAGE_NAVI{
	text-align:center;
}
.selectAdminRoomList{
	margin-top: 30px;
}
#selectRoomList{
    margin-top: 30px;
    margin-bottom: 50px;
    box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 5px 0px;
    background-color: rgb(255, 255, 255);
    border-width: 1px;
    border-style: solid;
    border-color: rgb(226, 226, 226);
    border-image: initial;
    border-radius: 4px;
}
.room+.room{
	border-top: 1px solid rgb(226, 226, 226);
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#aroom').addClass('active');
});
</script>
<script type="text/javascript">
	//방 삭제
	function fn_deleteRoom(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='roomDelete'/>");
		comSubmit.addParam("ROOM_NUM",obj.parent().parent().parent().prev().text());
		comSubmit.submit();
	}
	//상태변경
	function fn_updateRoomStatus(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='roomStatus'/>");
		comSubmit.addParam("ROOM_NUM",obj.parent().parent().parent().prev().text());
		comSubmit.addParam("TRADE_STATUS",obj.next().text());
		comSubmit.submit();
	}
	//방 상세
	function showPopup(obj){
	    var url = "<%=request.getContextPath()%>/room/roomDetail?ROOM_NUM="+obj.children('.num').text();
	    var name = "방정보";
	    var option = "width = 1366, height = 800, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
	    window.open(url, name, option);
	}
	//검색
	function fn_search(){
		var comAjax = new ComAjax()
		comAjax.setUrl("<c:url value='selectRoomList'/>");
		comAjax.setCallback("fn_selectSearchroomListCallback");
		comAjax.addParam("searchType",$("select[name=searchType]").val());
		comAjax.addParam("keyword",$("input[name=keyword]").val());
		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	//몇페이지 목록 보기
	$(document).ready(function() {
		var PAGE_INDEX = gfn_isNull("${param.PAGE_INDEX}")==true? "1": "${param.PAGE_INDEX}";
		$("#PAGE_INDEX").val(PAGE_INDEX);
		fn_selectSearchroomList(PAGE_INDEX);
	});
	function fn_selectSearchroomList(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectRoomList'/>");
		comAjax.setCallback("fn_selectSearchroomListCallback");
		comAjax.addParam("searchType",$("select[name=searchType]").val());
		comAjax.addParam("keyword",$("input[name=keyword]").val());
		comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	//콜백함수
	function fn_selectSearchroomListCallback(data) {
		var total = data.total;
		var body = $("ul#selectRoomList");
		$("#count").empty();
		body.empty();
		
		if (total == 0) {
			var str = "<div class='roomList'>" + "조회된 결과가 없습니다." + "</div>";
			body.append(str);
			$("#PAGE_NAVI").empty();
		} else {
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectSearchRoomList"
			};

			gfn_renderPaging(params);
			var str = "";
			var count = "총 " + data.total + "개의 검색 결과가 있습니다.";
			$("#count").append(count);
			body.append(
						"<li class='room'>"
						+	"<div class='dd'>"
							+	"<div>번호</div>"
							+	"<div>등록날짜</div>"
							+	"<div>아이디</div>"
							+	"<div>제목</div>"
							+	"<div>관리</div>"
						+	"</div>"
					+	"</li>"
					)
			$.each(data.list, function(key, room) {
				str+= "<li class='room'>"
						+ "<div class='num' style='display:none;'>" + room.ROOM_NUM + "</div>"
						+ "<div class='dd'>" 
							+ "<div>" + room.RNUM + "</div>" 
							+ "<div>" + room.UPLOAD_DATE + "</div>" 
							+ "<div id='id'>"	+ room.MEM_ID + "</div>" 
							+ "<div>" + room.DESC_TITLE + "</div>" 
							+ "<div class='idxnWu'>"
							+ "<div class='fLTNNO'>"
								+ "<button type='button' class='delete'>삭제</button>";
							if(room.TRADE_STATUS=='광고중'){
					str+=		  "<button type='button' class='status'>광고종료</button>"
								+ "<div style='display:none;'>광고종료</div>";
							}
							if(room.TRADE_STATUS=='광고종료'){
					str+=		  "<button type='button' class='status'>광고재등록</button>"
								+ "<div style='display:none;'>광고중</div>";
							}
							+ "</div>"
							+ "</div>"
				str+=	"</div>" 
					+ "</li>";
			});
			body.append(str)
			
			$("li.room").on("click",function(e){
				e.preventDefault();
				showPopup($(this));
			});
			$(".status").on("click", function(e){
				e.preventDefault();
				fn_updateRoomStatus($(this));
			});
			$(".delete").on("click", function(e){ //삭제하기 버튼 
				e.preventDefault(); 
				fn_deleteRoom($(this)); 
			}); 
		}
	}
</script>

</head>

<body>
<div style="margin:0 auto; width:1180px; min-height: 800px;">

<%@ include file="/WEB-INF/include/adminBoardHeader.jspf"%>

<div class="selectAdminRoomList">

	<div class="adminRoomList">
		<div id="count"></div>
		<ul id="selectRoomList"></ul>
		<div id="PAGE_NAVI"></div>
		<input type='hidden' id='PAGE_INDEX' name="PAGE_INDEX">	 
	</div>

</div>

</div>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>