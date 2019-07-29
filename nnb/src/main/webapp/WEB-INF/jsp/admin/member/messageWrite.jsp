<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>메시지 작성</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
function messageDetail() { 
	  window.open("messageDetail.jsp", "회원상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>회원 관리</h1></div>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='noticeList.jsp'">회원 검색</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='termsList.jsp'">전체 쪽지함</a>
</div>
<br/><br/>
<h3>메시지작성</h3>
<hr>	
<br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> message1 = new HashMap<String,Object>();
	message1.put("MESSAGE_NUM","1");
	message1.put("MEM_KIND","임대");
	message1.put("RECEIVER","ID4");
	message1.put("MESSAGE_TITLE","보세요 보시라구요~");
	message1.put("SEND_DATE","2019-07-31");
		   
   
   List<Map<String,Object>> messageList = new ArrayList<Map<String,Object>>();
   messageList.add(message1);
 
   
 
   request.setAttribute("messageList",messageList);
%>
<!-- 테스트용 세팅 끝 -->


      
	<form action="faqList.jsp" method="get" name="contents">
	<div>
        카테고리&nbsp;&nbsp; 
        <select name="selectBox" id="selectBox" style="width:80px;" class="select_02">

      <c:forEach var="testList" items="${NT_TYPE}" varStatus="i">

         <option value="${FAQ_CATEGORY}">${FAQ_CATEGORY}</option>

      </c:forEach>

   </select>
   </div>
   <br/>
   
  
		<div>
       		 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="text" id="TITLE" name="TITLE"/>
  		</div>
  		<br/>
		<div>    
	       	 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
	    </div>

    <div>
    	<br/><br/>
    	<a href="javascript:submit()">보내기</a>

    	<a href="javascript:frameclose()">취소</a>
    </div>
 </form> 	     


<br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>