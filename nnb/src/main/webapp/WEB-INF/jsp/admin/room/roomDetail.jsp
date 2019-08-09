<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>방 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 

function showPopup() { 
	  window.open("termsDetail.jsp", "방 관리 상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }

</script>

</head>

<br/><br/><br/>

<body>


<h1><div>방 정보</div></h1>
<br/>
<hr>
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
	room1.put("ADDRESS1","지구 서울시 강남구 ");
	room1.put("ADDRESS2","어딘가에 있는 1004동 2호");
	room1.put("ROOM_TYPE","원룸");
	room1.put("TRADE_TYPE","전세");
	room1.put("JEONSE","3000");
	room1.put("ROOM_FLOOR","2");
	room1.put("REAL_SIZE","20");
	room1.put("DESC_TITLE","이집은 강남에 있었던거 같다");
	room1.put("TRADE_STATUS","광고 중"); 	
   
   List<Map<String,Object>>roomList = new ArrayList<Map<String,Object>>();
   roomList.add(room1);


   
 
   request.setAttribute("room",room1);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectRoomList">


<div class="roomList">
   
   <div class="room">      
	<ul>
		<li>매물번호 :
		 ${room.BOARD_NUM} &nbsp;     
		</li>	
		<li>날짜 : 
         ${room.UPLOAD_DATE}&nbsp;
      	</li>
      	<li>임대인 아이디  :      	
         ${room.MEM_ID}&nbsp;
         </li>
         <li>제목  :
		${room.DESC_TITLE}    
         </li>	         
      </ul>
     </div>
     <br/><br/><br/>
      <h1><div>추가 정보</div></h1>
		<br/>
		<hr>
		<br/><br/><br/>
		<div class="room">      
	<ul>
		<li>거래상태 :
		 ${room.TRADE_STATUS} &nbsp;     
		</li>	
		<li>등록날짜 : 
         ${room.UPLOAD_DATE}&nbsp;
      	</li>
      	<li>주소1  :      	
         ${room.ADDRESS1}&nbsp;
         </li>
         <li>주소2  :
		${room.ADDRESS2}    
         </li>	         
      </ul>
     </div>
      
    <br/><br/><br/> 
    <select>
    <option>광고종료</option>
    <option>거래완료</option>
    <option>삭제처리</option>
    </select>
&nbsp;&nbsp;
   <a href="#" onClick="javascript:showPopup()">메시지 보내기</a>
&nbsp;&nbsp;
    <a href="javascript:frameclose()">확인</a>
&nbsp;&nbsp;
    <a href="javascript:frameclose()">닫기</a>
   </div>	
   

<br>
</body>
</html>