<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
			  
function termsWrite() { 
	  window.open("/admin/terms/termsWrite", "약관 등록", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); 
	  }	
			  

</script>

</head>

<br/><br/><br/>

<body>


<div><h1>게시판 관리</h1></div>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href="#" onclick="location.href='noticeList.jsp'">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" onclick="location.href='roomList.jsp'">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" onclick="location.href='termsList.jsp'">약관 관리</a>
</div>

<br/><br/><br/>

<div class="selectTermsList">



<div class="termsList">
   
   <c:forEach var="terms" items="${list}">
   <div class="terms">
 


     
	 
      	<a href="#" onClick="javascript:goTermsModify()">수정</a>
      <a href="#this" id="fn_del">삭제</a>
     
      
      

  
   </div>	
   </c:forEach>
  <div>
      	<a href="#" onClick="javascript:termsWrite()">새 약관 등록</a>
      </div>
</div>




</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>