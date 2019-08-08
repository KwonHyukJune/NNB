<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Q&A 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
	$("#delete").on("click", function(e){ //삭제하기 버튼 
		e.preventDefault(); 
		fn_deleteBoard(); 
	}); 

function showPopup() { 
	  window.open("QNAAnswer.jsp", "답변하기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>Q&A 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='/nnb/admin/openFaqList'">자주 묻는 질문</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='QNAList.jsp'">1:1 질문</a>
</div>
<br/>
<select>
	<option>답변완료</option>
	<option>답변대기</option>
</select>
&nbsp;&nbsp;
<select>
	<option>검색유형1</option>
	<option>검색유형2</option>
	<option>검색유형3</option>
</select>
&nbsp;&nbsp;
	<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' style="height: 15px; ">
&nbsp;&nbsp;
    <a href="#this" class="btn" id="delete">조회</a>
	<br/>
	<p>총 ${count}x건의 검색 결과가 있습니다.</p>
	
<br/>

<br/>

<div class="selectQNAList">


<div class="QNAList">
   
   <c:forEach var="map" items="${list}">
   <div class="qna">
	<a href="<c:url value='/admin/qna/detail?num=${map.QNA_NUM}'/>">${map.RNUM}&nbsp;${map.RES_STATE}&nbsp;${map.QNA_DATE}&nbsp;${map.MEM_ID}&nbsp;${map.QNA_TITLE}</a>
  
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
