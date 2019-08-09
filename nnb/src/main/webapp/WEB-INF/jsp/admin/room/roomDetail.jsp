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