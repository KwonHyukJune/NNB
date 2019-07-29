<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>1:1 문의 답변</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript">

function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 


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
   Map<String,Object> qna1 = new HashMap<String,Object>();
qna1.put("QNA_NUM","1");
qna1.put("QNA_DATE","2019-07-25");
qna1.put("MEM_ID","id4");
qna1.put("QNA_TITLE","회원가입 어떻게해요?");
qna1.put("QNA_CONTENT","어떻게 하냐고 이 운영자 양반아");
	
   List<Map<String,Object>>roomList = new ArrayList<Map<String,Object>>();
   roomList.add(qna1);


   
 
   request.setAttribute("qna",qna1);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectRoomList">


<div class="roomList">
   
   <div class="room">      
	<ul>
		<li>번호 :
		 ${qna.QNA_NUM} &nbsp;     
		</li>	
		<br/>
		<li>날짜 : 
         ${qna.QNA_DATE}&nbsp;
      	</li>
      	<br/>
      	<li>아이디  :      	
         ${qna.MEM_ID}&nbsp;
         </li>
         <br/>
         <li>제목  :
		${qna.QNA_TITLE}&nbsp;  
         </li>
         <br/>	         
         <li>내용  :
		${qna.QNA_CONTENT}    
         </li>	         
      </ul>
     </div>
     <br/><br/><br/>
      <h1><div>답변하기</div></h1>
		<br/>
		<hr>
		<br/><br/><br/>
		<div class="room">      
	<form>
		<div>
       		 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${qna.QNA_TITLE }"/>
  		</div>
  		<br/>
		<div>    
	       	 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="CONTENTS">${QNA_CONTENT}</textarea>
	    </div>
     </form> 
    <br/><br/><br/> 
    <a href="javascript:frameclose()">등록</a>
&nbsp;&nbsp;
    <a href="javascript:frameclose()">닫기</a>
   </div>	
   

<br>
</body>
</html>