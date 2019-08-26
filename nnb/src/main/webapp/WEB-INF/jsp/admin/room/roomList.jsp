<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>방 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">
	//방 삭제
	function fn_deleteRoom(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='roomDelete'/>");
		comSubmit.addParam("ROOM_NUM",obj.parent().prev().text());
		comSubmit.submit();
	}
	//상태변경
	function fn_updateRoomStatus(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='roomStatus'/>");
		comSubmit.addParam("ROOM_NUM",obj.parent().prev().text());
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
			$.each(data.list, function(key, room) {
				str+= "<li class='room'>"
						+ "<div class='num' style='display:none;'>" + room.ROOM_NUM + "</div>"
						+ "<div class=''>" 
							+ "<p>" + room.RNUM + "</p>" 
							+ "<p>" + room.UPLOAD_DATE + "</p>" 
							+ "<p id='id'>"	+ room.MEM_ID + "</p>" 
							+ "<p>" + room.DESC_TITLE + "</p>" 
							+ "<button type='button' class='delete'>삭제</button>";
						if(room.TRADE_STATUS=='광고중'){
				str+=		  "<button type='button' class='status'>광고종료</button>"
							+ "<div style='display:none;'>광고종료</div>";
						}
						if(room.TRADE_STATUS=='광고종료'){
				str+=		  "<button type='button' class='status'>광고재등록</button>"
							+ "<div style='display:none;'>광고중</div>";
						}
				str+=		  "</div>" 
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

<br/><br/><br/>

<body>


<div><h1>게시판 관리</h1></div>
<br/>
	
<div>

<a href=# onclick="location.href='/nnb/admin/openNoticeList'">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='/nnb/admin/roomList'">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='/nnb/admin/terms/list'">약관 관리</a>
</div>

<br/><br/><br/>
<div class="selectAdminRoomList">


	<div class="adminRoomList">
		<div id="count"></div>
		<ul id="selectRoomList"></ul>
		<div id="PAGE_NAVI"></div>
		<input type='hidden' id='PAGE_INDEX' name="PAGE_INDEX">	 
	</div>

</div>
<br/><br/><br/><br/><br/><br/><br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>