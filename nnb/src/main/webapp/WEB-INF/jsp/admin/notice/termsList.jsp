<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 관리</title>
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
	  window.open("termsDetail.jsp", "약관 상세보기", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }
			  
function showPopup2() { 
	  window.open("termsWrite.jsp", "약관 등록", 
			  "width=700, height=700, scrollbars=1, left=100, top=50"); }	


//글 삭제
function fn_del() {

    if (confirm("정말 삭제하시겠습니까??") == true) { //확인
        location.href = "/board/delete.do?BOARDNO="+${terms.TERMS_NUM};
        console.log('success');
    } else {
        console.log('fail');
        return false;
    }
}
</script>

</head>

<br/><br/><br/>

<body>


<h1><div>게시판 관리</div></h1>
<br/>
	
<div>
<!-- 링크에 URL 제대로 바꿔줘야 됩니다. 지금은 테스트용 jsp 링크입니다. -->
<a href=# onclick="location.href='noticeList.jsp'">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='roomList.jsp'">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href=# onclick="location.href='termsList.jsp'">약관 관리</a>
</div>

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
	terms1.put("TERMS_TITLE","약과 아니고 약관이요");
   
   
   
   List<Map<String,Object>> termsList = new ArrayList<Map<String,Object>>();
   termsList.add(terms1 );
  // noticeList.add(noitce2);
   
   
   request.setAttribute("termsList",termsList);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectTermsList">



<div class="termsList">
   
   <c:forEach var="terms" items="${termsList}">
   <div class="terms">
  <a href="#" onClick="javascript:showPopup()">
      
     
	<div>
		 ${terms.TERMS_NUM} &nbsp;     
      	
         ${terms.TERMS_DATE}&nbsp;
         
         ${terms.TERMS_TITLE}
         	
          
      </div>
      </a>
      <a href="#" onClick="javascript:showPopup()">수정</a>
      <a href="#this" class="btn" id="fn_del">삭제</a>
      <div>
      	<a href="#" onClick="javascript:showPopup2()">새 약관 등록</a>
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