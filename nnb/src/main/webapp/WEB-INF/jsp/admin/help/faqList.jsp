<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>자주묻는 질문</title>
<head>
<%@ include file="/include/include-header.jspf" %>
<%@ include file="/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 

function faqDetail() { 
	  window.open("faqDetail.jsp", "FAQ상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
			  
function faqWrite() { 
	  window.open("faqWrite.jsp", "새 질문 등록", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }	

function faqModify() { 
	  window.open("faqModify.jsp", "수정", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }	
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>Q&A 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='FAQList.jsp'">자주 묻는 질문</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='QNAList.jsp'">1:1 질문</a>
</div>

<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> faq1 = new HashMap<String,Object>();
 	faq1.put("FAQ_NUM","1");
    faq1.put("FAQ_CATEGORY","회원문의");
    faq1.put("FAQ_TITLE","회원가입 방법");
    faq1.put("FAQ_CONTENT","그거 모르면 그냥 돌아가세요.");
   
   
   List<Map<String,Object>> FAQList = new ArrayList<Map<String,Object>>();
   FAQList.add(faq1);
  
 
   request.setAttribute("FAQList",FAQList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectFAQList">


<div class="FAQList">
   
   <c:forEach var="faq" items="${FAQList}">
   <div class="faq">
  <a href="#" onClick="javascript:faqDetail()">
      
      <div>
         ${faq.FAQ_NUM}&nbsp;	
      	
		 ${faq.FAQ_CATEGORY}&nbsp;      
      	
         ${faq.FAQ_TITLE}&nbsp;
         
         ${faq.FAQ_CONTENT}	
          
      </div>
      </a>
      <a href="#" onClick="javascript:faqModify()">수정</a>  
      <a href="#this" class="btn" id="delete">삭제</a>
      
      <div><a href="#" onClick="javascript:faqWrite()">새 질문 등록</a></div>

  
   </div>	
   </c:forEach>
 
</div>

</div>
<br>
<div>
<%@ include file="/include/footer.jspf" %>
</div>
</body>
</html>
