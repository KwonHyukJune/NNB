<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>신고 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
 </script>

</head>

<br/><br/><br/>

<body>


<div><h1>신고 관리</h1></div>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='/nnb/admin/report/list'">신고 게시글 관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='/nnb/admin/memberList'">신고 룸메이트 관리</a>
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
	<p>총x건의 검색 결과가 있습니다.</p>
	
<br/>

<br/>



<div class="selectReportList">
<div class="reportList">
   
   <c:forEach var="map" items="${list}">
   <div class="report">
  
	 <a href="<c:url value='/admin/report/detail?num=${map.REPORT_NUM}'/>">${map.RNUM}&nbsp;${map.REPORT_TYPE}&nbsp;${map.REPORT_DATE}&nbsp;${map.REPORT_TITLE}&nbsp;${map.REPORT_POST_NUM}&nbsp;</a> 
      
      <a href="#this" class="btn" id="delete">삭제</a>
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