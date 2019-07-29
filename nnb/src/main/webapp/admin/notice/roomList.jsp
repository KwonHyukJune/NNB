<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>방 게시판</title>
<head>
<%@ include file="/include/include-header.jspf" %>
<%@ include file="/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 

function showPopup() { 
	  window.open("roomDetail.jsp", "방 상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>게시판 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='noticeList.jsp'">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='roomList.jsp'">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='termsList.jsp'">약관 관리</a>
</div>

<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> room1 = new HashMap<String,Object>();
	room1.put("ROOM_NUM","1");
	room1.put("BOARD_NUM","18293123");
	room1.put("UPLOAD_DATE","2019-07-25");
	room1.put("MEM_ID","id4");
	room1.put("DESC_TITLE","이집은 강남에 있다");
	   
   
   List<Map<String,Object>> roomList = new ArrayList<Map<String,Object>>();
   roomList.add(room1);

   
 
   request.setAttribute("roomList",roomList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectRoomList">


<div class="roomList">
   
<c:forEach var="room" items="${roomList}">
 <div class="room">
  <a href="#" onClick="javascript:showPopup()">
      
      <div>
         ${room.ROOM_NUM}&nbsp;	
      	
		 ${room.BOARD_NUM}&nbsp;      
      	
         ${room.UPLOAD_DATE}&nbsp;
         
         ${room.MEM_ID}&nbsp;
         
         ${room.DESC_TITLE}	
          
      </div>
      </a>
      <a href="#" onClick="javascript:showPopup()">수정</a>
      <a href="#this" class="btn" id="delete">삭제</a>
      <a href="#this" class="btn" id="delete">광고종료</a>
      <a href="#this" class="btn" id="delete">거래완료</a>

  
  </div>	
</c:forEach>
 
</div>

</div>
<br>
<div>
<%@ include file="/include/footer.jspf" %>
</div>
</body>
</html>