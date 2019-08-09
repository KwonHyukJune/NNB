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
			  "width=700, height=800, scrollbars=1, left=100, top=50"); }

</script>

</head>

<br/><br/><br/>

<body>


<div><h1>회원 정보</h1></div>
<br/>
<hr>
<br/><br/><br/>

   <div class="selectAdminRoomDetail">      

		
		<p>매물번호 :
		 ${roomDetail.BOARD_NUM} &nbsp;
		 </p> 
		<p>날짜 : 
         ${roomDetail.UPLOAD_DATE}&nbsp;   
		</p>
		<p>임대인 아이디  :      	
         ${roomDetail.MEM_ID}&nbsp;     
		</p>
		<p>제목  :
		${roomDetail.DESC_TITLE}
      	</p>
    </div>
     <br/><br/><br/>
      <div><h1>추가 정보</h1></div>
		<br/>
		<hr>
		<br/><br/><br/>

<div class="임차">      
		<b>임차회원</b>
		<br/><br/>
		<p>거래상태 :
		 ${roomDetail.TRADE_STATUS} &nbsp;     
		</p>	
		<p>등록날짜 : 
         ${roomDetail.UPLOAD_DATE}&nbsp;
      	</p>
      	<p>주소1  :      	
         ${roomDetail.ADDRESS1}&nbsp;
         </p>
         <p>주소2  :
		${roomDetail.ADDRESS2}    
         </p>	         
</div>

    <br/><br/><br/> 
    <select>
    <option>광고종료</option>
    <option>거래완료</option>
    <option>삭제처리</option>
    </select>

    <a href="javascript:frameclose()">확인</a>
&nbsp;&nbsp;
    <a href="javascript:frameclose()">닫기</a>
   </div>	
</div>   

<br>
</body>
</html>