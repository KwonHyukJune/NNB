<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 리스트</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">

function goPage1(num) {    //리스트 누르면 상세보기
	location.href="bankDetail?num="+num; 
	}
			  
function goPage3(num) {   // 수정
	location.href="bankModifyForm?num="+num; 
	}
function delet(num){
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='bankDelete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		x.html(str);
		console.log(str);
		frm.submit();
	}
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
<%-- <%@ page import="java.util.HashMap" %>
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
%> --%>
<!-- 테스트용 세팅 끝 -->

<div class="selectBankList">


<div class="bankList">
<c:forEach var="bank" items="${list}">
	<div class="bank">
	  <a href="#" onClick="javascript:goPage1(${bank.BANK_NUM})">
	      
	      <div>
	         ${bank.RNUM}&nbsp;	
	      	
			 ${bank.BANK_KIND}&nbsp;      
	      	
	         ${bank.BANK_REGDATE}&nbsp;
	         
	         ${bank.BANK_HITCOUNT}&nbsp;
	         
	         ${bank.BANK_TITLE}	
	          
	      </div>
	  </a>
	      <a href="#" onClick="goPage3(${bank.BANK_NUM})">수정</a>
	      <a href="#" class="btn" id="${bank.BANK_NUM}" onclick="delet(${bank.BANK_NUM})">삭제</a>
	  
		<div>
		</div>
   </div>	
</c:forEach>
<c:if test="${list.size()==0}">
등록된 글이 없습니다.
</c:if>
			 <a href="bankWriteForm">새 글 등록</a>
 
</div>


</div>
<br>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>