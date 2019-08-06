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

function submit(){
    var f=document.contents;   //폼 name
	    f.submit();	 
	}
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>회원 정보</div></h1>
<br/>
<hr>
<br/><br/><br/>

   <div class="adminMemberDetail">      

		
		<p>번호 :
		 ${memberDetail.MEM_NUM} &nbsp; 
		 </p> 
		<p>아이디 :
		 ${memberDetail.MEM_ID} &nbsp;     
		</p>
		<p>이름 :
		 ${memberDetail.MEM_NAME} &nbsp;     
		</p>
		<p>이메일 : 
         ${memberDetail.MEM_EMAIL}&nbsp;
      	</p>
      	<p>연락처  :      	
         ${memberDetail.MEM_PHONE}&nbsp;
         </p>
    
     
     </div>
     <br/><br/><br/>
      <div><h1>추가 정보</h1></div>
		<br/>
		<hr>
		<br/><br/><br/>
<div class="임차">      
		<b>임차회원</b>
		<p>닉네임 :
			${memberDetail.MEM_NICK} &nbsp;     
		</p>	
		<p>성별 :
		 	${memberDetail.RI_GENDER} &nbsp;     
		</p>	
		<p>생일 : 
         	${memberDetail.RI_BIRTH}&nbsp;
      	</p>
      	<p>자기소개  :      	
        	 ${memberDetail.RI_PROFILE}&nbsp;
        </p>     
</div>

<div class="임대">      
		<b>임차회원</b>
		<p>성별 :
		 	${memberDetail.RI_GENDER} &nbsp;     
		</p>	
		<p>생일 : 
         	${memberDetail.RI_BIRTH}&nbsp;
      	</p>
      	<p>자기소개  :      	
        	 ${memberDetail.RI_PROFILE}&nbsp;
        </p>  
<div>
등록한 방&nbsp;&nbsp; 거래상태
</div>        
<div class="member">
  
   <c:forEach var="member" items="${member1}">
   <div class="member">
      <div>
         ${member.ROOM_NUM
         }&nbsp;	

         ${member.TRADE_TYPE}	          
      </div> 
   </div>	
 
  </c:forEach> 
</div>
</div>
      
<br/><br/><br/> 

   <form action="reportList.jsp" method="post" name="contents">     
    <select name="period">
     	<option value="1">1일</option>
     	<option value="3">3일</option>
     	<option value="7">7일</option>
     	<option value="30">30일</option>
     </select> &nbsp;&nbsp;
  
	
	  	<a href="#" onClick="javascript:showPopup1()">메시지 보내기</a> &nbsp;&nbsp;
	
	   	<a href="javascript:submit()">확인</a> &nbsp;&nbsp;  
	
	    <a href="javascript:frameclose()">닫기</a>
	   	
   </form>
   

<br>
</body>
</html>