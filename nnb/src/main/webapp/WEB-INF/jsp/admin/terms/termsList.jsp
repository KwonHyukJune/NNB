<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 관리</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function delet(num){  // 삭제
	if(confirm('삭제하시겠습니까?')){
		var x = $('a#'+num);
		var str = "<form id='frm' method='post' action='/nnb/admin/terms/delete'>"
				+ "<input type='hidden' name='num' value='"+num+"'>"
				+ "</form>";
		console.log(str);
		x.html(str);
		frm.submit();
	}
}
function goPage(num) {   // 수정
	location.href="/nnb/admin/terms/termsModifyForm?num="+num; 
	}
	
function goPage1(num) {   // 새 약관 등록
	location.href="/nnb/admin/terms/termsWrite?num="+num; 
	}
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>게시판 관리</h1></div>
<br/>
	
<div>
	<a href=# onclick="location.href='/nnb/admin/openNoticeList'">공지 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href=# onclick="location.href='/nnb/admin/roomList'">방 게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href=# onclick="location.href='/nnb/admin/terms/list'">약관 관리</a>
</div>

<br/><br/><br/>

<div class="selectTermsList">


<div class="termsList">
   
  <c:forEach var="terms" items="${list}">
   <div class="terms">

<a href="<c:url value='/admin/terms/detail?num=${terms.TERMS_NUM}'/>">${terms.RNUM}&nbsp;${terms.TERMS_REGDATE}&nbsp;${terms.TERMS_TITLE} </a>

   	  <a href="#" onClick="goPage(${terms.TERMS_NUM})">수정</a>
      <a href="#" class="btn" id="${terms.TERMS_NUM}" onclick="delet(${terms.TERMS_NUM})">삭제</a>
      
   </div>	
  </c:forEach>
   
  <div>
     
 	 <a href="#" onClick="goPage1(${terms.TERMS_NUM})">새 약관 작성</a>
  </div>

</div>

</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>