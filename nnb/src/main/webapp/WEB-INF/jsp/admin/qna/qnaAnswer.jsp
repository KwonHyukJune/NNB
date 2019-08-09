<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>1:1 문의 답변</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#write").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/qna/reply' />");
		comSubmit.submit();
	}
});

function goPage1(num) {   // 취소
	location.href="/nnb/admin/qna/list?num="+num; 
	}

</script>

</head>

<br/><br/><br/>

<body>


<div><h1>1:1 문의</h1></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectRoomList">


<div class="roomList">
   
   <div class="room">      
	<ul>
		<li>번호 :
		 ${map.QNA_NUM} &nbsp;     
		</li>	
		<br/>
		<li>날짜 : 
         ${map.QNA_DATE}&nbsp;
      	</li>
      	<br/>
      	<li>아이디  :      	
         ${map.MEM_ID}&nbsp;
         </li>
         <br/>
         <li>제목  :
		${map.QNA_TITLE}&nbsp;  
         </li>
         <br/>	         
         <li>내용  :
		${map.QNA_CONTENT}    
         </li>	         
      </ul>
     </div>
     <br/><br/><br/>
      <h1><div>답변하기</div></h1>
		<br/>
		<hr>
		<br/><br/><br/>
		<div class="room">      
 <form action="updateQna" method="post" id="frm" name="frm">
		<div>
       		 제목
        	<input type="text" id="RES_TITLE" name="RES_TITLE" />
  		</div>
  		<br/>
		<div>    
	       	 내용
		<textarea rows="20" cols="50" title="내용" id="RES_CONTENT" name="RES_CONTENT"></textarea>
		<input type="hidden" id="QNA_NUM" name="num" value="${map.QNA_NUM}">
				
	    </div>
     </form> 
    <br/><br/><br/> 
    	<a href="#" id="write">작성하기</a>
&nbsp;&nbsp;
    <a href="#" onClick="goPage1(${map.QNA_NUM})">취소</a>
   </div>	
   

<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>