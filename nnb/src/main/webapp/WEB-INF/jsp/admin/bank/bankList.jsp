<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>제휴 은행 리스트</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 

function goPage1() {    //리스트 누르면 상세보기
	location.href="bankDetail.jsp"; 
	}
			  
function goPage2() {    // 새글 작성
	location.href="bankWrite.jsp"; 
	}

function goPage3() {   // 수정
	location.href="bankModify.jsp"; 
	}


</script>

</head>

<br/><br/><br/>

<body>


<h1><div>제휴은행 관리</div></h1>
<br/>
<hr>

<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> bank1 = new HashMap<String,Object>();
	bank1.put("BANK_NUM","1");
	bank1.put("BANK_KIND","국민은행");
	bank1.put("BANK_REGDATE","2019-07-25");
	bank1.put("BANK_HITCOUNT","123");
	bank1.put("BANK_TITLE","국민은행에서 대출 해드림 ^^");
	   
   
   List<Map<String,Object>> bankList = new ArrayList<Map<String,Object>>();
   bankList.add(bank1);
  
 
   request.setAttribute("bankList",bankList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectBankList">


<div class="bankList">
   
<c:forEach var="bank" items="${bankList}">
	<div class="bank">
	  <a href="#" onClick="javascript:goPage1()">
	      
	      <div>
	         ${bank.BANK_NUM}&nbsp;	
	      	
			 ${bank.BANK_KIND}&nbsp;      
	      	
	         ${bank.BANK_REGDATE}&nbsp;
	         
	         ${bank.BANK_HITCOUNT}&nbsp;
	         
	         ${bank.BANK_TITLE}	
	          
	      </div>
	  </a>
	      <a href="#" onClick="javascript:goPage3()">수정</a>
	      <a href="#this" class="btn" id="delete">삭제</a>
	  
		<div>
			 <a href="#" onClick="javascript:goPage2()">새 글 등록</a>
		</div>
   </div>	
</c:forEach>
 
</div>

</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>