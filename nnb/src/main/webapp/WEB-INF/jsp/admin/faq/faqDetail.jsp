<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>FAQ 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#awrite').addClass('active');
});
</script>
<script type="text/javascript">

function goPage1(num) {   // 목록으로
	location.href="/nnb/admin/openFaqList?FAQ_NUM="+num; 
	}


</script>

</head>

<br/><br/><br/>

<body>


<div><h1>상세보기</h1></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectFaqDetail">


<div class="FaqList">
   
 
   <div class="faq">
      <ul>
      <li>번호 :
         ${map.FAQ_NUM}&nbsp;	
      </li>
      <li>카테고리 :	
		 ${map.FAQ_CATEGORY}&nbsp;      
      </li>
      <li>제목(질문) : 	
         ${map.FAQ_TITLE}&nbsp;
        </li> 
       <li>내용(답변) :  
         ${map.FAQ_CONTENT}	          
      </li>
      </ul>
      
    <br/><br/><br/> 

    <a href="#" onClick="goPage1(${map.FAQ_NUM})">목록으로</a>
   </div>	
   </div>
   </div>

<br/><hr><br/><br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>