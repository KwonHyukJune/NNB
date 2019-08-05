<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>자주묻는 질문</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
function writeFAQ(num) {   // 새 질문 등록
	location.href="/nnb/admin/faq/writeForm?num="+num; 
	}
	
function goPage(num) {   // 수정
	location.href="modifyForm?num="+num; 
	}	
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>Q&A 관리</h1></div>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='FAQList.jsp'">자주 묻는 질문</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='QNAList.jsp'">1:1 질문</a>
</div>

<br/><br/><br/>

<div class="selectFaqList">


<div class="FaqList">
   
   <c:forEach var="map" items="${list}">
   <div class="faq">
		<a href="<c:url value='/admin/faq/detail?num=${map.FAQ_NUM}'/>">${map.RNUM}&nbsp;${map.FAQ_CATEGORY}&nbsp;${map.FAQ_TITLE}&nbsp;${map.FAQ_CONTENT} </a>
	
	   	 <a href="#" onClick="goPage(${map.FAQ_NUM})">수정</a>
	     <a href="#" class="btn" id="${map.FAQ_NUM}" onclick="delet(${map.FAQ_NUM})">삭제</a>
	      
	   </div>
   </c:forEach>
   <div>
  		<a href="#" onClick="writeFAQ(${map.FAQ_NUM})">새 질문 등록</a>
   </div>	

 
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
