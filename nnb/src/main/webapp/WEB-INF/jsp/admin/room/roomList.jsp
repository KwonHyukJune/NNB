<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>방 게시판</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 

	function showPopup(num, id){
	    var url = "/nnb/admin/roomDetail?BOARD_NUM="+num;
	    var name = "방정보";
	    var option = "width = 500, height = 500, top = 100, left = 200, location = no, resizeable = yes, scrollbars = yes"
	    window.open(url, name, option);
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
	   
	<c:forEach var="roomDetail" items="${adminRoomList}">
		 <div class="roomList">
			 	    			   
			         ${roomDetail.BOARD_NUM}&nbsp;	
			      	
					 ${roomDetail.ROOM_NUM}&nbsp;      
			      	
			         ${roomDetail.UPLOAD_DATE}&nbsp;
			         
			         ${roomDetail.MEM_ID}&nbsp;
			         
			         ${roomDetail.DESC_TITLE}	   			     
		  
		  </div>
    		<input type="button" value="상세보기" onclick="showPopup(${roomDetail.BOARD_NUM});" />
	      <a href="#" onClick="javascript:showPopup()">수정</a>
	      <a href="#this" class="btn" id="delete">삭제</a>
	      <a href="#this" class="btn" id="delete">광고종료</a>
	      <a href="#this" class="btn" id="delete">거래완료</a>	
	</c:forEach>
	 
	</div>

</div>
<br/><br/><br/><br/><br/><br/><br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>