<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>공지 게시판</title>
<html>
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
	  window.open("noticeDetail", "회원상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>게시판 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='noticeList'">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='roomList.jsp'">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='termsList'">약관 관리</a>
</div>

<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> notice1 = new HashMap<String,Object>();
 	notice1.put("NT_NUM","1");
    notice1.put("NT_TYPE","공지유형1");
    notice1.put("NT_DATE","2019-07-25");
    notice1.put("NT_TITLE","공지입니다");
    notice1.put("NT_CONTENT","공지라구요 아시겠어요?");
   
   
   List<Map<String,Object>> noticeList = new ArrayList<Map<String,Object>>();
   noticeList.add(notice1);
  // noticeList.add(noitce2);
   
 
   request.setAttribute("noticeList",noticeList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectNoticeList">


<div class="noticeList">
   
   <c:forEach var="notice" items="${noticeList}">
   <div class="notice">
  <a href="#" onClick="javascript:showPopup()">
      
      <div>
         ${notice.NT_NUM}&nbsp;	
      	
		 ${notice.NT_TYPE}&nbsp;      
      	
         ${notice.NT_DATE}&nbsp;
         
         ${notice.NT_TITLE}&nbsp;
         
         ${notice.NT_CONTENT}	
          
      </div>
      </a>
      <a href="#" onClick="javascript:showPopup()">수정</a>
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