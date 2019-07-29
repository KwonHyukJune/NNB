<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 상세보기</title>
<head>
<%@ include file="/include/include-header.jspf" %>

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


<h1><div>약관보기</div></h1>
<br/>
<hr>
<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> terms1 = new HashMap<String,Object>();
	terms1.put("TERMS_NUM","1");
	terms1.put("TERMS_DATE","2019-07-25");
	terms1.put("TERMS_TITLE","약관입니다");
	terms1.put("TERMS_CONTENT","약과아니고 약관입니다. 아시겠어요?");
	   
	   
   List<Map<String,Object>> termsList = new ArrayList<Map<String,Object>>();
   termsList.add(terms1 );
  // noticeList.add(noitce2);
   
   
   request.setAttribute("terms",terms1);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectTermsList">


<div class="termsList">
   
   <div class="terms">      
	<ul>
		<li>번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; 
		 ${terms.TERMS_NUM} &nbsp;     
		</li>	
		<li>날짜 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; 
         ${terms.TERMS_DATE}&nbsp;
      	</li>
      	<li>약관제목  :&nbsp;      	
         ${terms.TERMS_TITLE}&nbsp;
         </li>
         <li>약관내용  :&nbsp;
		${terms.TERMS_CONTENT}    
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