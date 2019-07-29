<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 

function submit(){
    var f=document.contents;   //폼 name
	    f.submit();	 
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
<%
   Map<String,Object> report1 = new HashMap<String,Object>();
	report1.put("REPORT_NUM","1");
	report1.put("REPORT_STATE","처리대기");
	report1.put("REPORT_TYPE","신고유형1");
	report1.put("REPORT_DATE","2019-07-23");
	report1.put("ROOM_NUM","8123658");
	report1.put("REPORT_TITLE","운영자 양반 이자식이야!");
	report1.put("REPORT_CONTENT","라고 얘까 욕설했어요!");
   
   
   List<Map<String,Object>> report = new ArrayList<Map<String,Object>>();
   report.add(report1);
  
 
   request.setAttribute("report",report1);
%>
<!-- 테스트용 세팅 끝 -->


<div class="selectTermsList">


<div class="termsList">
   
   <div class="terms">      
	<ul>
		<li>번호 :
		 ${report.REPORT_NUM} &nbsp;     
		</li>
		<li>신고유형 :
         ${report.REPORT_TYPE}&nbsp;
      	</li>
      	<li>날짜  :     	
         ${report.REPORT_DATE}&nbsp;
         </li>
         <li>매물번호  :     	
         ${report.ROOM_NUM}&nbsp;
         </li>
         <li>매물번호  :     	
         ${report.REPORT_TITLE}&nbsp;
         </li>
         <li>내용  :
		${report.REPORT_CONTENT}    
         </li>	
          
      </ul>
    <br/><br/><br/> 
   <form action="reportList.jsp" method="post" name="contents">     
    <select name="period">
     	<option value="1">1일</option>
     	<option value="3">3일</option>
     	<option value="7">7일</option>
     	<option value="30">30일</option>
     </select>
  
      <a href="javascript:submit()">확인</a>    
      <a href="javascript:frameclose()">닫기</a>
 </form>
  
   </div>	
 
</div>

</div>
<br>
</body>
</html>