<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 관리</title>
<head>
<%@ include file="/include/include-header.jspf" %>
<%@ include file="/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 

function showPopup() { 
	  window.open("reportDetail.jsp", "상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>신고 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='reportList.jsp'">신고 게시글 관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='reportMateList.jsp'">신고 룸메이트 관리</a>
</div>
<br/>
<select>
	<option>처리완료</option>
	<option>처리대기</option>
</select>
&nbsp;&nbsp;
<select>
	<option>전체</option>
	<option>검색유형1</option>
	<option>검색유형2</option>
</select>
<select>
	<option>제목</option>
	<option>신고자</option>
	<option>매물번호</option>
</select>
&nbsp;&nbsp;
	<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="height: 15px; ">
&nbsp;&nbsp;
    <a href="#this" class="btn" id="delete">조회</a>
	<br/>
	<p>총 ${count}x건의 검색 결과가 있습니다.</p>
	
<br/>

<br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> report1 = new HashMap<String,Object>();
	report1.put("REPORT_NUM","1");
	report1.put("REPORT_TYPE","신고유형1");
	report1.put("REPORT_DATE","2019-07-23");
	report1.put("ROOM_NUM","8123658");
	report1.put("REPORT_TITLE","운영자 양반 이자식이야!");
   
   
   List<Map<String,Object>> reportList = new ArrayList<Map<String,Object>>();
   reportList.add(report1);
  
 
   request.setAttribute("reportList",reportList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectReportList">


<div class="reportList">
   
   <c:forEach var="report" items="${reportList}">
   <div class="report">
  <a href="#" onClick="javascript:showPopup()">
      
      <div>
         ${report.REPORT_NUM}&nbsp;	
      	
		 ${report.REPORT_TYPE}&nbsp;      
      	
      	 ${report.REPORT_DATE}&nbsp;  
      	
         ${report.ROOM_NUM}&nbsp;
         
         ${report.REPORT_TITLE}	
          
      </div>
      
      </a>
      <a href="#this" class="btn" id="delete">삭제</a>
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