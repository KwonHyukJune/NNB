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


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> member1 = new HashMap<String,Object>();
	member1.put("MEM_NUM","1");
	member1.put("RI_PROFILE","안녕 룸메구한다");
	member1.put("RI_BIRTH","2019-07-25");
	member1.put("MEM_ID","id4");
	member1.put("MEM_PHONE","010-1234-1234 ");
	member1.put("RI_GENDER","남자");
	member1.put("TRADE_TYPE","전세");
	member1.put("ROOM_NUM","이집은 강남에 있었던거 같다");
	member1.put("TRADE_STATUS","광고 중"); 	
   
   List<Map<String,Object>>memberList = new ArrayList<Map<String,Object>>();
   memberList.add(member1);


   
 
   request.setAttribute("member",member1);
%>
<!-- 테스트용 세팅 끝 -->
   <div class="room">      
	
		<p>아이디 :
		 ${member.MEM_ID} &nbsp;     
		</p>	
		<p>이메일 : 
         ${member.MEM_EMAIL}&nbsp;
      	</p>
      	<p>연락처  :      	
         ${member.MEM_PHONE}&nbsp;
         </p>
    <c:forEach var="ban" items="${banList}">
      	 <p>제제내역 <br/>
	      	&nbsp; 날짜 : <br/>
	      	&nbsp; 사유 : <br/>
	      	&nbsp; 제재내용 : 
	     </p> 
     </c:forEach>    
     
     </div>
     <br/><br/><br/>
      <div><h1>추가 정보</h1></div>
		<br/>
		<hr>
		<br/><br/><br/>
<div class="임차">      
		<b>임차회원</b>
		<p>성별 :
		 	${member.RI_GENDER} &nbsp;     
		</p>	
		<p>생일 : 
         	${member.RI_BIRTH}&nbsp;
      	</p>
      	<p>자기소개  :      	
        	 ${member.RI_PROFILE}&nbsp;
        </p>     
</div>

<div class="임대">      
		<b>임차회원</b>
		<p>성별 :
		 	${member.RI_GENDER} &nbsp;     
		</p>	
		<p>생일 : 
         	${member.RI_BIRTH}&nbsp;
      	</p>
      	<p>자기소개  :      	
        	 ${member.RI_PROFILE}&nbsp;
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
  
	
	  	<a href="#" onClick="javascript:showPopup()">메시지 보내기</a> &nbsp;&nbsp;
	
	   	<a href="javascript:submit()">확인</a> &nbsp;&nbsp;  
	
	    <a href="javascript:frameclose()">닫기</a>
	   	
   </form>
   

<br>
</body>
</html>