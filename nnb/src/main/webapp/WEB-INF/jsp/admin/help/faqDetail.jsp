<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>FAQ 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

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


<h1><div>상세보기</div></h1>
<br/>
<hr>
<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
  
 
   request.setAttribute("faq",faq1);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectFAQList">


<div class="FAQList">
   
 
   <div class="faq">
      <ul>
      <li>번호 :
         ${faq.FAQ_NUM}&nbsp;	
      </li>
      <li>카테고리 :	
		 ${faq.FAQ_CATEGORY}&nbsp;      
      </li>
      <li>제목(질문) : 	
         ${faq.FAQ_TITLE}&nbsp;
        </li> 
       <li>내용(답변) :  
         ${faq.FAQ_CONTENT}	          
      </li>
      </ul>
      
    <br/><br/><br/> 

    <a href="javascript:frameclose()">닫기</a>
   </div>	
   </div>
   </div>

<br>
</body>
</html>